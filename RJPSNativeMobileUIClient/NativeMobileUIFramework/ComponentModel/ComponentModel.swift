//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public struct DisplayOptions : Codable {
    let key: DisplayOptionsKey
    let value : String
    
    public enum DisplayOptionsKey: String {
        case xxx
    }
}

public struct ComponentModel : Codable {
    public let id: String?
    public let type: UIKitViewFactoryElementTag
    public let displayOptions: [DisplayOptions]?
    public let data: [ComponentDataModel]?
    public let action: ComponentActionModel?
}

