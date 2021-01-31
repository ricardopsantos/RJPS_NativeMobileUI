//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import RJSLibUFBase
import UIKit

extension ComponentActionModel {
    
    var screenName : AppSreens? {
        guard let firstParam = firstParam,
              let result = AppSreens(rawValue: firstParam) else {
            return nil
            }
        return result
    }
    
    var url : URL? {
        guard let firstParam = firstParam,
              let result = URL(string: firstParam) else {
            return nil
            }
        return result
    }
    
    var firstParam: String? {
        return self.data?.filter{ $0.key == .params }.first?.value
    }
    
    var options: String? {
        return self.data?.filter{ $0.key == .options }.first?.value
    }
}
