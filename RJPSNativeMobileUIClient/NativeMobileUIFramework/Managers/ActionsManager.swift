//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

struct ActionsManager {
    private init() { }
    
    static func handleAction(_ sender: UIView, model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {

        guard let button = sender as? UIButton else { fatalError("Precondiction failed") }
        
        button.bumpAndPerform {

            if let action = ActionsTargets(rawValue: model.actionType ?? "") {
                switch action {
                case .self: _ = () // future....
                case .newViewController: handleLoadScreen(model: model, dynamicView: dynamicView)
                }
            } else {
                fatalError("invalid action [\(model)]")
            }
            
        }
    }
}

private extension ActionsManager {
    
    static func handleLoadScreen(model: ComponentModel, dynamicView: DynamicViewControllerProtocol) {
        let screenName = model.actionTarget
        dynamicView.load(json: contentOf(jsonFile: screenName))
    }
    
}

