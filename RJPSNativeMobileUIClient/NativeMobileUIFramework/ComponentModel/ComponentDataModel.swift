//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public struct ComponentDataModel : Codable {
    let key: ComponentDataKey
    let value : String
    
    public enum ComponentDataKey: String {
        case layoutStyle
        case text
        case url
        case height
        case color
        case textAlignment
        case textPlaceHolder
        case textIsSecured

        case params   // related with ComponentActionModel
        case options  // related with ComponentActionModel
    }
}
