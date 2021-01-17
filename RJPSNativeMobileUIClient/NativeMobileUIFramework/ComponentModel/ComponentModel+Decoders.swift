//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

extension ComponentDisplayOptionsModel: Codable {
    
    enum Key: CodingKey { case rawValue }
    
    enum CodingError: Error { case unknownValue }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0: self = .fixedToTop
        case 1: self = .spacer
        default: throw CodingError.unknownValue
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .fixedToTop: try container.encode(0, forKey: .rawValue)
        case .spacer: try container.encode(1, forKey: .rawValue)
        case .listItemType: try container.encode(2, forKey: .rawValue)
        }
    }
    
}

extension UIKitViewFactoryElementTag: Codable {
    
    enum Key: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }
    
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
