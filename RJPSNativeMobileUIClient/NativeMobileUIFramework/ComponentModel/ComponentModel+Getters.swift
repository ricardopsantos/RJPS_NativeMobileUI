//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import RJSLibUFBase
import UIKit

extension ComponentModel {
    
    var text: String { data?.filter{ $0.key == .text }.first?.value ?? "" }
    
    var textPlaceHolder: String { data?.filter{ $0.key == .textPlaceHolder }.first?.value ?? "" }
    
    var textIsSecured: Bool {
        if let value = data?.filter({ $0.key == .textIsSecured }).first?.value {
            return Bool(value) ?? false
        }
        return false
    }

    var layoutStyle: String { data?.filter{ $0.key == .layoutStyle }.first?.value ?? "" }
    
    var url: String { data?.filter{ $0.key == .url }.first?.value ?? "" }
    
    var color: UIColor? {
        if let value = data?.filter({ $0.key == .color }).first?.value {
            return UIColor.colorFromRGBString(value)
        }
        return nil
    }
    
    var textAlignement: NSTextAlignment {
        guard let value = data?.filter({ $0.key == .textAlignment }).first?.value,
              let rawValue = Int(value),
              let result = NSTextAlignment(rawValue: rawValue) else {
            return .justified
        }
        return result
    }
}


extension UIView {
    var componentID: String? {
        self.accessibilityIdentifier
    }
    
    func set(componentID: String) {
        self.accessibilityIdentifier = componentID
    }
}
