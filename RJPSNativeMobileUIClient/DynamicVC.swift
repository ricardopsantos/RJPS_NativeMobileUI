//
//  Created by Ricardo P Santos on 2020.
//  2020 © 2019 Ricardo P Santos. All rights reserved.
//

import UIKit
import CryptoKit
import Combine
//
import TinyConstraints
import RJSLibUFBase

class DynamicVC: DynamicBaseVC {
    override func screenJSONFileName() -> String? { return "ScreenC" }
    override func base() -> DynamicViewControllerProtocol { self }
}

extension DynamicVC: DynamicViewControllerProtocol {
    
    func load(json: String?) {
       load(json: json, base: self)
    }
    
    func viewGenericTap(_ sender: UIView, model: ComponentModel) {
        ActionsManager.handleAction(sender, model: model, dynamicView: self)
    }
}
