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

        let json = """
                    {
                      "results": [
                        {
                          "id": "",
                          "type": "stackViewSection",
                          "data": [
                            { "key": "text", "value": "This are labels...." }
                          ]
                        },
                        {
                          "id": "titleLabel",
                          "type": "label",
                          "data": [
                            { "key": "text", "value": "Im a title" },
                            { "key": "layoutStyle", "value": "title" }
                          ]
                        },
                        {
                          "id": "titleLabel",
                          "type": "label",
                          "data": [
                            { "key": "text", "value": "Im a value" },
                            { "key": "layoutStyle", "value": "value" }
                          ]
                        },
                        {
                          "id": "",
                          "type": "stackViewSection",
                          "data": [
                            { "key": "text", "value": "This arent labels...." }
                          ]
                        },
                        {
                          "id": "btnAcceptTermsAndCondictions",
                          "type": "button",
                          "data": [
                            { "key": "text", "value": "I'll accept" },
                            { "key": "layoutStyle", "value": "accept" }
                          ]
                        },
                        {
                          "id": "btnAcceptTermsAndCondictions",
                          "type": "button",
                          "data": [
                            { "key": "text", "value": "Im a accept" },
                            { "key": "layoutStyle", "value": "primary" }
                          ]
                        },
                        {
                          "id": "btnAcceptTermsAndCondictions",
                          "type": "button",
                          "data": [
                            { "key": "text", "value": "Im secondary" },
                            { "key": "layoutStyle", "value": "secondary" }
                          ]
                        }
                      ]
                    }
        """
       // let models = NMUIModel.loadWith(json: json)
        let models = ComponentModel.loadWith(file: "JSON_1")


        models?.forEach({ (model) in
            if model.type == .label, let style = UILabel.LayoutStyle(rawValue: model.layoutStyle) {
                stackViewVLevel1.addSub(view: UIKitFactory.label(title: model.text, style: style))
            } else if model.type == .button, let style = UIButton.LayoutStyle(rawValue: model.layoutStyle) {
                stackViewVLevel1.addSub(view: UIKitFactory.button(title: model.text, style: style))
            } else if model.type == .stackViewSection {
                stackViewVLevel1.addSection(title: model.text)
            }
        })
    }

}
