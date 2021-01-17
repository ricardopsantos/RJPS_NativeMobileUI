//
//  Created by Ricardo P Santos on 2020.
//  2020 © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import CryptoKit
import Combine
//
import TinyConstraints

private var cancelBag = CancelBag()

class DynamicVC: UIViewController {
            
    private lazy var scrollView: UIScrollView = {
        UIKitFactory.scrollView()
    }()

    private lazy var stackViewVLevel1: UIStackView = {
        UIKitFactory.stackView(axis: .vertical)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addAndSetup(scrollView: scrollView, stackViewV: stackViewVLevel1, hasTopBar: true)

        let models = ComponentModel.loadWith(file: "JSON_1")
        
        models?.forEach({ (model) in
            if model.type == .label, let style = UILabel.LayoutStyle(rawValue: model.layoutStyle) {
                stackViewVLevel1.addSub(view: UIKitFactory.label(title: model.text, style: style))
            } else if model.type == .button, let style = UIButton.LayoutStyle(rawValue: model.layoutStyle) {
                let some = UIKitFactory.button(title: model.text, style: style)
                if model.touchUpInsideEnabled {
                    some.isUserInteractionEnabled = true
                    some.onTouchUpInside {  [weak self] in
                        self?.viewGenericTap(some, model: model)
                    }
                }
                stackViewVLevel1.addSub(view: some)
            } else if model.type == .stackViewSection {
                stackViewVLevel1.addSection(title: model.text)
            }
        })
    }
    
    func viewGenericTap(_ sender: UIView, model: ComponentModel) {
        //print(sender)
        //print(model)
        let message = "The [\(model.id)] wants to perform [\(model.touchUpInsideSelector!)]\n\n[\(model)]"
        let dialogMessage = UIAlertController(title: "Just do it!",
                                              message: message,
                                              preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })

        dialogMessage.addAction(okAction)
        self.present(dialogMessage, animated: true, completion: nil)
    }

}
