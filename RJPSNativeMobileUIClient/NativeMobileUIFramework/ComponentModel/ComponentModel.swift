//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

struct ComponentModels: Decodable {
    var results: [ComponentModel]
}

public enum ComponentDisplayOptionsModel: String {
    case fixedToTop
    case spacer
    case listItemType
}

enum ActionsTargets: String {
    case `self`
    case newViewController = "new_view_controller"
}

enum ActionsTypes: String {
    case touchUpInside = "touch_up_inside"
}

public struct ActionsModel : Decodable {
    let id: String?          // idenfifier
    let type: String         // touch_up_inside
    let data: [ComponentKeyValuesModel]?
    //let target : String      // self | new_view_controller
    //let options : [String]?  // push | present | dismiss
    //let params : [String]?   // ["ScreenName"]
}

public struct ComponentKeyValuesModel : Decodable {
    let key: String
    let value : String
}

public struct ComponentModel : Decodable {
    public let id: String? // idenfifier
    public let type: UIKitViewFactoryElementTag
    public let displayOptions: [ComponentDisplayOptionsModel: String]?
    public let data: [ComponentKeyValuesModel]?
    public let action: ActionsModel?
}
