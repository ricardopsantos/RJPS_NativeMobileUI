//
//  Created by Ricardo Santos on 17/01/2021.
//

import UIKit
import Foundation

// ComponentColor encapsulate a way to relate a UIComponents or Actions ALLWAYS with the same `ColorName`
// Have things like ComponentColor.TopBar.background or ComponentColor.TopBar.titleColor that related with UI elements
// but have things like ComponentColor.accept, ComponentColor.remind, that are related with types of actions
public typealias ComponentColor = UIColor

public extension UIColor {
    struct TopBar {
        private init() {}
        public static var background: UIColor { return ColorName.primary.color }
        public static var titleColor: UIColor { return ColorName.onPrimary.color }
    }

    struct UIButton {
        public static var backgroundColorInnGage: UIColor { return UIColor.Pack1.grey_6.color }
        public static var textColorInnGage: UIColor { return UIColor.Pack1.grey_1.color }
        public static var backgroundColorDefault: UIColor { return  ColorName.primary.color }
        public static var textColorDefault: UIColor { return  ColorName.onPrimary.color }
    }

    struct UILabel {
        public static var lblBackgroundColor: UIColor { return UIColor.Pack1.grey_6.color }
        public static var lblTextColor: UIColor { return UIColor.Pack1.grey_1.color }
    }

    static var background: UIColor { return ColorName.onPrimary.color }
    static var onBackground: UIColor { return ColorName.primary.color }

    static var primary: UIColor { return ColorName.primary.color }
    static var onPrimary: UIColor { return ColorName.onPrimary.color }

    static var error: UIColor { return ColorName.danger.color }
    static var success: UIColor { return ColorName.success.color }
    static var warning: UIColor { return ColorName.warning.color }

    static var accept: UIColor { return ColorName.success.color }
    static var reject: UIColor { return ColorName.danger.color }
    static var remind: UIColor { return ColorName.warning.color }
}
