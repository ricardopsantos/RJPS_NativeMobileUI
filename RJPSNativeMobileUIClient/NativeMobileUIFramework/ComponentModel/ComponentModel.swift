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

public struct ComponentKeyValuesModel : Decodable {
    let key: String
    let value : String
}

public struct ComponentModel : Decodable {
    public let id: String?
    public let type: UIKitViewFactoryElementTag
    public let displayOptions: [ComponentDisplayOptionsModel: String]?
    public let data: [ComponentKeyValuesModel]?
}
