//
//  Created by Ricardo Santos on 18/01/2021.
//

import Foundation
import RJSLibUFBase
import UIKit

extension ComponentModel {
   
    private static func spacer(height: Int = 0) -> ComponentModel {
        let height = ComponentDataModel(key: .height, value: "\(height)")
        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.stackViewSeparator,
                              displayOptions: nil,
                              data: [height],
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
    
    private static func label(_ layout: UILabel.LayoutStyle, _ title: String) -> ComponentModel {
        let layout = ComponentDataModel(key: .layoutStyle, value: layout.rawValue)
        let text = ComponentDataModel(key: .text, value: title)
        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.label,
                              displayOptions: nil,
                              data: [text, layout],
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
    
    private static func actionLoad(sreeen: String, type: ComponentActionModel.ActionType) -> ComponentActionModel {
        let params = ComponentDataModel(key: .params, value: sreeen)
        let action: ComponentActionModel = ComponentActionModel(id: nil,
                                                                gesture: .touch_up_inside,
                                                                type: type,
                                                                data: [params])
        return action
    }
    private static func button(_ layout: UIButton.LayoutStyle, _ title: String, _ action: ComponentActionModel? = nil) -> ComponentModel {
        let layout = ComponentDataModel(key: .layoutStyle, value: layout.rawValue)
        let text   = ComponentDataModel(key: .text, value: title)
        

        return ComponentModel(id: nil,
                              type: UIKitViewFactoryElementTag.button,
                              displayOptions: nil,
                              data: [layout, text],
                              action: action)
    }
    
    static var screenA : [ComponentModel] {
        let nextScreen = "ScreenB"
        let result =  [
            section(title: "Images..."),
            imageView(url: "https://cdn.vox-cdn.com/thumbor/zEZJzZFEXm23z-Iw9ESls2jYFYA=/89x0:1511x800/1600x900/cdn.vox-cdn.com/uploads/chorus_image/image/55717463/google_ai_photography_street_view_2.0.jpg"),
            section(title: "...and section support!"),
            spacer(),
            button(.primary, "Load next screen", actionLoad(sreeen: nextScreen, type: .loadScreen)),
            button(.primary, "Present next screen", actionLoad(sreeen: nextScreen, type: .presentScreen)),
        ]
        
        return result
    }
    
    static var screenB : [ComponentModel] {
        let nextScreen = "ScreenC"
        let result =  [
            section(title: "Diferent type of labels support..."),
            label(.title, "title"),
            label(.value, "value"),
            label(.text, "text"),
            label(.error, "error"),
            section(title: ""),
            button(.primary, "Load next screen", actionLoad(sreeen: nextScreen, type: .loadScreen)),
            button(.primary, "Present next screen", actionLoad(sreeen: nextScreen, type: .presentScreen)),
            button(.primary, "Dismiss me", actionLoad(sreeen: "", type: .dismissMe)),
        ]
        
        return result
    }
    
    static var screenC : [ComponentModel] {
        let nextScreen = "ScreenD"
        let result =  [
            section(title: "Diferent type of buttons support..."),
            button(.primary, "primary"),
            button(.secondary, "secondary"),
            button(.accept, "accept"),
            button(.reject, "reject"),
            button(.accept, "accept"),
            button(.remind, "remind"),
            section(title: ""),
            button(.primary, "Load next screen", actionLoad(sreeen: nextScreen, type: .loadScreen)),
            button(.primary, "Present next screen", actionLoad(sreeen: nextScreen, type: .presentScreen)),
            button(.primary, "Dismiss me", actionLoad(sreeen: "", type: .dismissMe)),
        ]
        
        return result
    }
    
    static var screenD : [ComponentModel] {
        
        let result =  [
            section(title: "Title"),

            imageView(url: "https://cdn.vox-cdn.com/thumbor/zEZJzZFEXm23z-Iw9ESls2jYFYA=/89x0:1511x800/1600x900/cdn.vox-cdn.com/uploads/chorus_image/image/55717463/google_ai_photography_street_view_2.0.jpg"),
            section(title: ""),

            label(.title, "title title title title title"),
            label(.value, "value value value value value"),
            label(.text, "text text text text text text"),
            label(.error, "error error error error error error"),

            section(title: ""),

            button(.primary, "primary"),
            button(.secondary, "secondary"),
            button(.accept, "accept"),
            button(.reject, "reject"),
            button(.accept, "accept"),
            button(.remind, "remind"),
          
            section(title: ""),

            button(.primary, "Dismiss me", actionLoad(sreeen: "", type: .dismissMe)),

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
