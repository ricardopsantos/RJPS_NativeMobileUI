//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit
//
import TinyConstraints
import RJSLibUFAppThemes
import RJSLibUFBase

public extension UIView {

    func subviewsWith(componentID: String) -> [UIView] {
        return self.allSubviews().filter {
            return $0.componentID != nil && $0.componentID == componentID
        }
    }
    
    func subViewsOf(type: UIKitViewFactoryElementTag, recursive: Bool) -> [UIView] {
        return self.subViewsWith(tag: type.intValue, recursive: recursive)
    }

    func addAndSetup(scrollView: UIScrollView, stackViewV: UIStackView, hasTopBar: Bool) {
        self.addSubview(scrollView)
        scrollView.addSubview(stackViewV)
        stackViewV.edgeStackViewToSuperView()
        let topBarSize: CGFloat = hasTopBar ? 40 : 0
        let bottomBarSize: CGFloat = 0
        scrollView.trailingToSuperview()
        scrollView.leftToSuperview()
        scrollView.topToSuperview(offset: topBarSize, usingSafeArea: false)
        scrollView.height(screenHeight - topBarSize  - bottomBarSize)
    }
     
    func addHorizontalMargin(_ defaultMargin: CGFloat = SizesNames.size_5.cgFloat) {
        let edgesToExclude: LayoutEdge = .init([.top, .bottom])
        let insets = UIEdgeInsets(top: 0,
                                  left: defaultMargin,
                                  bottom: 0,
                                  right: defaultMargin)
        self.edgesToSuperview(excluding: edgesToExclude, insets: insets)
    }
}
