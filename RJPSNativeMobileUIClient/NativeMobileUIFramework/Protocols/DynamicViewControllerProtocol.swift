//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation

public protocol DynamicViewControllerProtocol {
    func viewGenericTap(_ sender: UIView, model: ComponentModel)
    func screenJSON() -> String?
    func load(json: String?)
}
