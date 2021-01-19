//
//  Created by Ricardo Santos on 19/01/2021.
//

import Foundation
import UIKit

public extension UIStackView {
    
    func loadWith(models: [ComponentModel]?, base: DynamicViewControllerProtocol) {
        let hide = { [weak self] in
            self?.subviews.map{ $0.alpha = 0 }
        }
        let show = { [weak self] in
            UIView.animate(withDuration: 0.3) { [weak self] in
                _ = self?.subviews.map{ $0.alpha = 1 }
            }
        }
        let remove = { [weak self] in
            self?.removeAllSubviews()
        }
        let build = { [weak self] in
            guard let self = self else { return }
            models?.forEach({ (model) in
                if let view = UIKitFactory.view(model: model, base: base) {
                    self.add(view)
                } else if model.type == .stackViewSection {
                    self.addSection(title: model.text)
                } else if model.type == .stackViewSeparator {
                    _ = self.addSeparator(color: model.color)
               }
            })
            
            self.subViewsOf(type: .button, recursive: true).forEach { (some) in
                // The height can only be setted after the views are added (that why is here)
                some.height(Designables.Sizes.buttonDefaultSize.height)
            }
            
            self.subViewsOf(type: .textField, recursive: true).forEach { (some) in
                some.height(Designables.Sizes.buttonDefaultSize.height)
                // The delegate can only be setted after the views are added (that why is here)
                (some as? UITextField)?.delegate = base as? UITextFieldDelegate
            }
            
        }
        UIView.animate(withDuration: 0.3) {
            hide()
        } completion: { (_) in
            remove()
            build()
            show()
        }
    }
}
