//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public enum UIKitViewFactoryElementTag: String {
    // Simple
    case view
    case button
    case scrollView
    case stackView
    case imageView
    case textField
    case label
    
    case titleAndValue
    case stackViewSection
    case stackViewSeparator
}

extension UIKitViewFactoryElementTag {
    var stringValue: String {  self.rawValue }
    
    var intValue: Int {
        let start = 1000
        switch self {
        case .view: return start + 1
        case .button: return start + 2
        case .scrollView: return start + 3
        case .stackView: return start + 4
        case .imageView: return start + 5
        case .textField: return start + 6
        case .label: return start + 7
        case .stackViewSeparator: return start + 8
        case .titleAndValue: return start + 9
        case .stackViewSection: return start + 10
        }
    }
    
}
