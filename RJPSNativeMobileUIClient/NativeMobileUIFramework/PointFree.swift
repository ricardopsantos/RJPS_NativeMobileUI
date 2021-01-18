//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public var screenWidth: CGFloat { return UIScreen.main.bounds.width }
public var screenHeight: CGFloat { return UIScreen.main.bounds.height }

func contentOf(jsonFile: String?) -> String? {
    guard let fileURL = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
          let fileContent = try? String(contentsOf: fileURL) else {
            return nil
        }
    return fileContent
}
