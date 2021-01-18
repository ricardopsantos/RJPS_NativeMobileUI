//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

struct ActionsManager {
    private init() { }
    
    static func handleGesture(_ sender: UIView, model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        
        guard let button = sender as? UIButton else { fatalError("Precondiction failed") }

        if model.action?.gesture == .touch_up_inside {
            button.bumpAndPerform {
                if model.action?.type == .loadScreen {
                    handleLoadScreen(model: model, dynamicView: dynamicView)
                } else if model.action?.type == .pushScreen {
                    handlePushScreen(model: model, dynamicView: dynamicView)
                } else if model.action?.type == .presentScreen {
                    handlePresentScreen(model: model, dynamicView: dynamicView)
                } else if model.action?.type == .dismissMe {
                    handleDismissScreen(model: model, dynamicView: dynamicView)
                }
            }
        }

    }
}

private extension ActionsManager {
    
    static func handleLoadScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let screenName = model.action?.params, !screenName.trim.isEmpty else { fatalError("Precondiction failed") }
        dynamicView.load(json: contentOf(jsonFile: screenName))
    }
    
    static func handlePushScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let screenName = model.action?.params, !screenName.trim.isEmpty else { fatalError("Precondiction failed") }
        let viewController = DynamicVC()
        viewController.newJSON = contentOf(jsonFile: screenName)
        (dynamicView as! UIViewController).present(viewController, animated: true) {
            
        }
    }
    
    static func handlePresentScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let screenName = model.action?.params, !screenName.trim.isEmpty else { fatalError("Precondiction failed") }
        dynamicView.load(json: contentOf(jsonFile: screenName))
        let viewController = DynamicVC()
        viewController.newJSON = contentOf(jsonFile: screenName)
        (dynamicView as! UIViewController).present(viewController, animated: true) {
            
        }
    }
    
    static func handleDismissScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        (dynamicView as! UIViewController).dismiss(animated: true) {
            
        }
    }
    
}

