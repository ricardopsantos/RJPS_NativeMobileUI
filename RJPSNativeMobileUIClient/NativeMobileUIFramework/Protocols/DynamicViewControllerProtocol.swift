//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public protocol DynamicViewControllerProtocol {
    
    func base() -> DynamicViewControllerProtocol
    func screenJSONFileName() -> String?
    func viewGenericTap(_ sender: UIView, model: ComponentModel)
    func load(json: String?)
}
