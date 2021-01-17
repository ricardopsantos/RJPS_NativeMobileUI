//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

extension ComponentModel {
    var text: String { data.filter{ $0.key == "text" }.first?.value ?? "" }
    var layoutStyle: String { data.filter{ $0.key == "layoutStyle" }.first?.value ?? "" }
    var touchUpInsideSelector: String? { data.filter{ $0.key == "touchUpInside.selector" }.first?.value }
    var touchUpInsideEnabled: Bool { touchUpInsideSelector != nil }
}

struct ComponentModels: Decodable {
    var results: [ComponentModel]
}
