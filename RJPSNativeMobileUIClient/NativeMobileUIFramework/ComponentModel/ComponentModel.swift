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

public struct ComponentDataModel : Codable {
    let key: ComponentDataKey
    let value : String
    
    public enum ComponentDataKey: String {
        case layoutStyle
        case text
        case url
        case height
        case color
        
        case params   // related with ComponentActionModel
        case options  // related with ComponentActionModel
    }
}

public struct DisplayOptions : Codable {
    let key: DisplayOptionsKey
    let value : String
    
    public enum DisplayOptionsKey: String {
        case textAlign
    }
}

public struct ComponentModel : Codable {
    public let id: String?
    public let type: UIKitViewFactoryElementTag
    public let displayOptions: [DisplayOptions]?
    public let data: [ComponentDataModel]?
    public let action: ComponentActionModel?
    

}

