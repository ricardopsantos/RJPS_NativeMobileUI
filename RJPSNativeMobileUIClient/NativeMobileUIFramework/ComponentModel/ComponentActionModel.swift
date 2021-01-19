//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public struct ComponentActionModel : Codable {
    let id: String?
    let gesture: ActionGesture
    let type: ActionType
    let data: [ComponentDataModel]?
    
    public enum ActionType: String {
        case openURL
        case loadScreen
        case pushScreen
        case presentScreen
        case dismissMe
    }
    
    public enum ActionGesture: String {
        case touch_up_inside
        case double_tap
    }
    
}

