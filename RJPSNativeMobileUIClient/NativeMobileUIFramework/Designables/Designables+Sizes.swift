//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit
import RJSLibUFAppThemes

extension Designables {
    struct Sizes {
        private init() {}
        public struct Margins {
            private init() {}
            public static var defaultMargin: CGFloat = SizesNames.size_4.cgFloat
        }
        public static var buttonDefaultSize: CGSize { return CGSize(width: SizesNames.size_17.cgFloat, height: SizesNames.size_7.cgFloat) }
    }
}
