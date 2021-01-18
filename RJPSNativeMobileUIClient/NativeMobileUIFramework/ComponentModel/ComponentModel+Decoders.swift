//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

extension ComponentActionModel.ActionType: Codable {
    enum Key: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }
}

extension ComponentActionModel.ActionGesture: Codable {
    enum Key: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }
}

extension ComponentDataModel.ComponentDataKey: Codable {
    enum Key: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }
}

extension DisplayOptions.DisplayOptionsKey: Codable {
    enum Key: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }
}

extension UIKitViewFactoryElementTag: Codable {
    enum Key: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }
}

