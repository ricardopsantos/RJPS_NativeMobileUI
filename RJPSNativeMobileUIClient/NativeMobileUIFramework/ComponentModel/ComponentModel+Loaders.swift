//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

extension ComponentModel {
    static func loadWith(json: String?) -> [ComponentModel]? {
        guard let json = json else { return nil }
        do {
            let data = json.data(using: .utf8, allowLossyConversion: false)!
            let jsonData = try JSONDecoder().decode([ComponentModel].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
        return nil
    }
    
    static func loadWith(file: String?) -> [ComponentModel]? {
        guard let fileContents = contentOf(jsonFile: file) else {
            return nil
        }
        return loadWith(json: fileContents)
    }
}


