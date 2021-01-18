//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import RJSLibUFBase
import UIKit
extension ComponentModel {
    
    //
    // Generic
    //
    var text: String { data?.filter{ $0.key == "text" }.first?.value ?? "" }
    var layoutStyle: String { data?.filter{ $0.key == "layoutStyle" }.first?.value ?? "" }
    var url: String { data?.filter{ $0.key == "url" }.first?.value ?? "" }
    var color: UIColor? {
        if let color = data?.filter({ $0.key == "color" }).first?.value {
            return UIColor.colorFromRGBString(color)
        }
        return nil
    }

    //
    // Only for buttons
    //
    var actionType: String? {
        guard type == .button else { fatalError("Invalid call for model of type [\(type)]") }
        return action?.type
    }
    
    var actionTarget: String? {
        guard type == .button else { fatalError("Invalid call for model of type [\(type)]") }
        return action?.data?.filter{ $0.key == "target" }.first?.value
    }
    
    var actionParams: String? {
        guard type == .button else { fatalError("Invalid call for model of type [\(type)]") }
        return action?.data?.filter{ $0.key == "params" }.first?.value
    }
    
    var actionOptions: String? {
        guard type == .button else { fatalError("Invalid call for model of type [\(type)]") }
        return action?.data?.filter{ $0.key == "options" }.first?.value
    }
}

