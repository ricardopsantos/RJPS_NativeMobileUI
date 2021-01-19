//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

struct ActionsManager {
    private init() { }
    
    static func handleGesture(_ sender: UIView, model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        
        guard let button = sender as? UIButton else { fatalError("Precondiction failed") }

        guard let gesture = model.action?.gesture else { return }
        if gesture == .touch_up_inside {
            #warning("reference cicle!")
            button.bumpAndPerform { [dynamicView] in
                guard let actionType = model.action?.type else { return }
                switch actionType {
                case .openURL:       handleOpenURL(model: model, dynamicView: dynamicView)
                case .loadScreen:    handleLoadScreen(model: model, dynamicView: dynamicView)
                case .pushScreen:    handlePushScreen(model: model, dynamicView: dynamicView)
                case .presentScreen: handlePresentScreen(model: model, dynamicView: dynamicView)
                case .dismissMe:     handleDismissScreen(model: model, dynamicView: dynamicView)
                }
            }
        } else {
            fatalError("not implemented")
        }
    }
}

private extension ActionsManager {
    
    static func handleOpenURL(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let url = model.action?.url else { fatalError("Precondiction failed") }
        UIApplication.shared.open(url)

    }
    
    static func handleLoadScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let screenName = model.action?.screenName else { fatalError("Precondiction failed") }
        dynamicView.load(json: contentOf(jsonFile: screenName.JSONFileName))
    }
    
    static func handlePushScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let screenName = model.action?.screenName else { fatalError("Precondiction failed") }
        let viewController = DynamicVC()
        viewController.screenModel = screenName.model
        (dynamicView as! UIViewController).present(viewController, animated: true) {
            
        }
    }
    
    static func handlePresentScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        guard let screenName = model.action?.screenName else { fatalError("Precondiction failed") }
        let viewController = DynamicVC()
        viewController.screenModel = screenName.model
        (dynamicView as! UIViewController).present(viewController, animated: true) {
            
        }
    }
    
    static func handleDismissScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        (dynamicView as! UIViewController).dismiss(animated: true) {
            
        }
    }
    
}

