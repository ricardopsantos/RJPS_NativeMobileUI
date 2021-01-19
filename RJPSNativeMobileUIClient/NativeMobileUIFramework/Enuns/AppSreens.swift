//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public enum AppSreens: String {
    case screenProfile     = "ScreenProfile"
    case ScreenDesignables = "ScreenDesignables"
}

extension AppSreens {
    var JSONFileName: String {
        self.rawValue
    }
    var model: [ComponentModel] {
        return ComponentModel.loadWith(file: JSONFileName) ?? []
    }
}

