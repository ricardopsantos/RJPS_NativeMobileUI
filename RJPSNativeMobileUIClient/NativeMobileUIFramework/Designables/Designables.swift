//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

struct Designables {
    private init() {}
    struct Sizes {
        private init() {}
        public struct Margins {
            private init() {}
            public static var defaultMargin: CGFloat = 16
        }
        public static var buttonDefaultSize: CGSize { return CGSize(width: 125, height: 44) }
    }
}
