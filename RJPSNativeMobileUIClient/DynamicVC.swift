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
    override func screenJSONFileName() -> String? { return AppSreens.screenProfile.JSONFileName }
    override func base() -> DynamicViewControllerProtocol { self }
    
    //var screenJSON: String?
    var screenModel: [ComponentModel]?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
      //  if screenJSON != nil {
      //      load(json: screenJSON, base: self)
       /* } else */
        if screenModel != nil {
            load(models: screenModel, base: self)
        }
        else {
            
            let json = String(data: try! JSONEncoder().encode(ComponentModel.screenDesignables), encoding: .utf8)!
                load(json: json)
        }
        //}
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

extension DynamicVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        func display(message: String) {
            if let label = self.view.subviewsWith(componentID: "\(UIKitViewFactoryElementTag.label)_user_validation").first as? UILabel {
                label.text = message
            }
        }
        if textField.componentID == "\(UIKitViewFactoryElementTag.textField)_user" {
            display(message: "User: \(textField.text!)" )
        }
        if textField.componentID == "\(UIKitViewFactoryElementTag.textField)_password" {
            display(message: "Password: \(textField.text!)" )
        }
    }
}
