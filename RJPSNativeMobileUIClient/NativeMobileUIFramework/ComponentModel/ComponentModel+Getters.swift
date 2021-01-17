//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

extension ComponentModel {
    var text: String { data.filter{ $0.key == "text" }.first?.value ?? "" }
    var layoutStyle: String { data.filter{ $0.key == "layoutStyle" }.first?.value ?? "" }
}

struct ComponentModels: Decodable {
    var results: [ComponentModel]
}
