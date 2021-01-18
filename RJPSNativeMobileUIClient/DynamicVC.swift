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
    override func screenJSONFileName() -> String? { return "ScreenA" }
    override func base() -> DynamicViewControllerProtocol { self }
    
    var newJSON: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        if newJSON != nil {
            load(json: newJSON)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //
    }
}

extension DynamicVC: DynamicViewControllerProtocol {
    
    func load(json: String?) {
       load(json: json, base: self)
    }
    
    func viewGenericTap(_ sender: UIView, model: ComponentModel) {
        ActionsManager.handleGesture(sender, model: model, dynamicView: self)
    }
}
