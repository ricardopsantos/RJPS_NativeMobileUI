//
//  Created by Ricardo P Santos on 2020.
//  2020 © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import CryptoKit
import Combine
//
import TinyConstraints
import RJSLibUFBase

public protocol DynamicViewControllerProtocol {
    func viewGenericTap(_ sender: UIView, model: ComponentModel)
    func screenJSON() -> String?
    func load(json: String?)
}

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
        let models = ComponentModel.loadWith(json: screenJSON())
        stackViewVLevel1.loadWith(models: models, base: self)
    }
}

extension DynamicVC: DynamicViewControllerProtocol {
    
    func load(json: String?) {
        let models = ComponentModel.loadWith(json: json)
        stackViewVLevel1.loadWith(models: models, base: self)
    }
    
    func screenJSON() -> String? {
        contentOf(jsonFile: "ScreenC")
    }
    
    func viewGenericTap(_ sender: UIView, model: ComponentModel) {
        ActionsManager.handleAction(sender, model: model, dynamicView: self)
    }

}

struct ActionsManager {
    private init() { }
    static func handleAction(_ sender: UIView, model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        (sender as! UIButton).bumpAndPerform {
            func handleLoadScreen(touchUpInsideSelector: String) {
                guard let screenName = touchUpInsideSelector.split(by: ".").last else {
                    return
                }
                dynamicView.load(json: contentOf(jsonFile: screenName))
            }
            guard let touchUpInsideSelector = model.touchUpInsideSelector else {
                // No actions for button
                return
            }
            if touchUpInsideSelector.hasPrefix("LoadScreen.") {
                handleLoadScreen(touchUpInsideSelector: model.touchUpInsideSelector!)
            }
        }
    }
}
