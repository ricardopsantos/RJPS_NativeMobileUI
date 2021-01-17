//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

extension ComponentModel {
    static func loadWith(json: String) -> [ComponentModel]? {
        do {
            let data = json.data(using: .utf8, allowLossyConversion: false)!
            let jsonData = try JSONDecoder().decode(ComponentModels.self, from: data)
            return jsonData.results
        } catch {
            print("error:\(error)")
        }
        return nil
    }
    
    static func loadWith(file: String) -> [ComponentModel]? {
        guard let fileURL = Bundle.main.url(forResource: file, withExtension: "json"),
              let fileContents = try? String(contentsOf: fileURL) else {
                return nil
            }
        return loadWith(json: fileContents)
    }
}
