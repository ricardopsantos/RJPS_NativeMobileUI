//
//  Created by Ricardo Santos on 17/01/2021.
//

import UIKit
import Foundation
//
import RJSLibUFBase
import RJSLibUFAppThemes
import TinyConstraints

public extension UIView {
    static func with(model: ComponentModel, base: DynamicViewControllerProtocol) -> UIView? {
        switch model.type {
        case .view: return nil
        case .button: return UIButton.with(model, base: base)
        case .scrollView: return nil
        case .stackView: return nil
        case .imageView: return UIImageView.with(model, base: base)
        case .textField: return nil
        case .label: return UILabel.with(model, base: base)
        case .stackViewSeparator: return nil
        case .titleAndValue: return nil
        case .stackViewSection: return nil
        }
    }
}

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
                if let view = UIView.with(model: model, base: base) {
                    self.add(view)
                } else if model.type == .stackViewSection {
                    self.addSection(title: model.text)
                } else if model.type == .stackViewSeparator {
                    self.addSeparator(color: model.color)
               }
            })
            
            self.subViewsOf(type: .button, recursive: true).forEach { (some) in
                // some.addHorizontalMargin() // No need, allready inside a stack view
                some.height(Designables.Sizes.buttonDefaultSize.height)
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

public extension UIButton {
    static func with(_ model: ComponentModel, base: DynamicViewControllerProtocol) -> UIButton? {
        guard model.type == .button,
              let style = UIButton.LayoutStyle(rawValue: model.layoutStyle) else {
            fatalError("Invalid model [\(model)]")
        }
        let some = UIKitFactory.button(title: model.text, style: style)
        some.isUserInteractionEnabled = true
        some.onTouchUpInside { [base] in
            base.viewGenericTap(some, model: model)
        }
        return some
    }
}
 
public extension UIImageView {
    static func with(_ model: ComponentModel, base: DynamicViewControllerProtocol) -> UIImageView? {
        guard model.type == .imageView,
              !model.url.isEmpty else {
            fatalError("Invalid model [\(model)]")
        }
        return UIKitFactory.imageView(imageURL: model.url)
    }
}

public extension UILabel {
    static func with(_ model: ComponentModel, base: DynamicViewControllerProtocol) -> UILabel? {
        guard model.type == .label,
              let style = UILabel.LayoutStyle(rawValue: model.layoutStyle) else {
            fatalError("Invalid model [\(model)]")
        }
        return UIKitFactory.label(title: model.text, style: style)
    }
}
