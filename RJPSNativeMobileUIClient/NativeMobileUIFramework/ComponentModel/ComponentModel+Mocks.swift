//
//  Created by Ricardo Santos on 18/01/2021.
//

import Foundation
import RJSLibUFBase
import UIKit
//
import RJSLibUFAppThemes

extension ComponentActionModel {
    
    static func actionDismiss() -> ComponentActionModel {
        ComponentActionModel(id: "action_dismiss", gesture: .touch_up_inside, type: .dismissMe, data: nil)
    }
    
    static func actionLoad(sreeen: AppSreens) -> ComponentActionModel {
        return action(id: "action_load_\(sreeen.rawValue)", sreeen: sreeen, type: .loadScreen, url: nil)
    }
    
    static func actionPush(sreeen: AppSreens) -> ComponentActionModel {
        return action(id: "action_load_\(sreeen.rawValue)", sreeen: sreeen, type: .pushScreen, url: nil)
    }
    
    static func actionPresent(sreeen: AppSreens) -> ComponentActionModel {
        return action(id: "action_load_\(sreeen.rawValue)", sreeen: sreeen, type: .presentScreen, url: nil)
    }
    
    static func actionOpen(url: String) -> ComponentActionModel {
        return action(id: "action_open_url", sreeen: nil, type: .openURL, url: url)
    }
    
    private static func action(id: String, sreeen: AppSreens?, type: ComponentActionModel.ActionType, url: String?) -> ComponentActionModel {
        var data: [ComponentDataModel] = []
        if sreeen != nil {
            data.append(ComponentDataModel(key: .params, value: sreeen!.JSONFileName))
        }
        if url != nil {
            data.append(ComponentDataModel(key: .params, value: url!))
        }
        let action: ComponentActionModel = ComponentActionModel(id: id,
                                                                gesture: .touch_up_inside,
                                                                type: type,
                                                                data: data)
        return action
    }
}

extension ComponentModel {
   
    private static func spacer(height: Int = 0) -> ComponentModel {
        let height = ComponentDataModel(key: .height, value: "\(height)")
        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.stackViewSeparator,
                              displayOptions: nil,
                              data: [height],
                              action: nil)
    }
    
    private static func textField(title: String, _ placeHolder: String, _ isSecured: Bool? = nil, _ identifier: String?) -> ComponentModel {
        let text = ComponentDataModel(key: .text, value: title)
        let placeHolder = ComponentDataModel(key: .textPlaceHolder, value: placeHolder)
        var data: [ComponentDataModel] = []
        data.append(text)
        data.append(placeHolder)
        if isSecured != nil {
            data.append(ComponentDataModel(key: .textIsSecured, value: "\(isSecured!)"))
        }
        return ComponentModel(id: identifier,
                              type: UIKitViewFactoryElementTag.textField,
                              displayOptions: nil,
                              data: data,
                              action: nil)
    }
    
    private static func section(title: String) -> ComponentModel {
        let text = ComponentDataModel(key: .text, value: title)
        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.stackViewSection,
                              displayOptions: nil,
                              data: [text],
                              action: nil)
    }
    
    private static func label(_ layout: LabelStyle,
                              _ title: String,
                              _ textAlignment: NSTextAlignment?,
                              _ identifier: String? = nil) -> ComponentModel {
        let layout    = ComponentDataModel(key: .layoutStyle, value: layout.rawValue)
        let text      = ComponentDataModel(key: .text, value: title)
        var data: [ComponentDataModel] = []
        data.append(layout)
        data.append(text)
        if let textAlignment = textAlignment {
            data.append(ComponentDataModel(key: .textAlignment, value: "\(textAlignment.rawValue)"))
        }
        return ComponentModel(id: identifier,
                              type: UIKitViewFactoryElementTag.label,
                              displayOptions: nil,
                              data: data,
                              action: nil)
    }
    
    private static func imageView(url: String) -> ComponentModel {
        let url = ComponentDataModel(key: .url, value: url)
        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.imageView,
                              displayOptions: nil,
                              data: [url],
                              action: nil)
    }
    

    
    private static func button(_ layout: ButtontStyle,
                               _ title: String,
                               _ action: ComponentActionModel? = nil) -> ComponentModel {
        let layout = ComponentDataModel(key: .layoutStyle, value: layout.rawValue)
        let text   = ComponentDataModel(key: .text, value: title)
        

        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.button,
                              displayOptions: nil,
                              data: [layout, text],
                              action: action)
    }
    
    static var screenDesignables : [ComponentModel] {
        
        let result =  [
            section(title: "I'm a section title!"),

            imageView(url: "https://cdn.vox-cdn.com/thumbor/zEZJzZFEXm23z-Iw9ESls2jYFYA=/89x0:1511x800/1600x900/cdn.vox-cdn.com/uploads/chorus_image/image/55717463/google_ai_photography_street_view_2.0.jpg"),
            label(.text, "(This image loaded via url)", .center),

            section(title: "Label styles..."),

            label(.title, "Im a label with style [title]", nil),
            label(.value, "Im a label with style [value]", nil),
            label(.text, "Im a label with style [text]", nil),
            label(.error, "Im a label with style [error]", nil),

            section(title: "Text alignment..."),

            label(.text, "Style [text] and align [center]", .center),
            label(.text, "Style [text] and align [left]", .left),
            label(.text, "Style [text] and align [center]", .right),
            label(.text, "Style [text] and align [justified]", .justified),

            section(title: "Button styles..."),

            button(.primary, "Im a button with style [primary]"),
            button(.secondary, "Im a button with style [secondary]"),
            button(.accept, "Im a button with style [accept]"),
            button(.reject, "Im a button with style [reject]"),
            button(.remind, "Im a button with style [remind]"),
          
            section(title: "Textfields..."),

            textField(title: "", "User", false, "\(UIKitViewFactoryElementTag.textField)_user"),
            textField(title: "", "Password", true, "\(UIKitViewFactoryElementTag.textField)_password"),
            label(.text, "", nil, "\(UIKitViewFactoryElementTag.label)_user_validation"),

            section(title: "Navigation..."),

            button(.primary, "Infinite loop?", ComponentActionModel.actionPush(sreeen: .screenProfile)),
            button(.primary, "Open url", ComponentActionModel.actionOpen(url: "https://www.google.com/")),
            button(.secondary, "Dismiss me", ComponentActionModel.actionDismiss()),

            spacer(),
            spacer(),
            spacer(),

        ]
        
        return result
    }
    
    static var screenProfile : [ComponentModel] {
        
        let result =  [
            section(title: "My Profile"),

            imageView(url: "https://media-exp1.licdn.com/dms/image/C4E03AQHpQtIamtJZPA/profile-displayphoto-shrink_800_800/0/1601550428198?e=1616630400&v=beta&t=P8OwQSHL0V18A-NjlYwAMAKqlfXgLzNnIusoAyfTwP4"),

            spacer(),
            
            label(.title, "Ricardo Santos", .center),
            label(.value, "Every line of code represents and ethical and moral decision", .center),

            section(title: "Contacts"),


            button(.secondary, "My LinkedIn", ComponentActionModel.actionOpen(url: "https://www.linkedin.com/in/ricardopsantos/")),
            button(.secondary, "Email me!", ComponentActionModel.actionOpen(url: "mailto:abc@example.com?subject=Feedback")),
            //button(.secondary, "Dismiss me", ComponentActionModel.actionDismiss()),
            
            section(title: ""),

            button(.primary, "Tap to check all components!", ComponentActionModel.actionPush(sreeen: .ScreenDesignables)),

            spacer(),
            spacer(),
            spacer(),
            spacer(),
            spacer(),
            spacer(),

        ]
        
        return result
    }
}
