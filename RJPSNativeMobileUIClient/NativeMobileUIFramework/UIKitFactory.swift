//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit
import RJSLibUFBase
import RJSLibUFAppThemes
import TinyConstraints

public enum UIKitViewFactoryElementTag: String {
    // Simple
    case view
    case button
    case scrollView
    case stackView
    case imageView
    case textField
    case label
    
    case titleAndValue
    case stackViewSection
    case stackViewSeparator    
}


public struct UIKitFactory {
    private init() {}

    public static func button(title: String = "", style: UIButton.LayoutStyle) -> UIButton {
        let some = UIButton()
        some.setTitleForAllStates(title)
        some.tag =  UIKitViewFactoryElementTag.button.intValue
        some.setTitleForAllStates(title)
        some.layoutStyle = style
        return some
    }

    public static func textField(title: String = "") -> UITextField {
        let some = UITextField()
        some.text = title
        some.tag = UIKitViewFactoryElementTag.textField.intValue
        return some
    }

    public static func imageView(image: UIImage? = nil, imageURL: String? = nil) -> UIImageView {
        let some = UIImageView()
        some.tag =  UIKitViewFactoryElementTag.imageView.intValue
        if image != nil {
            some.image = image
        }
        if imageURL != nil, let url = URL(string: imageURL!) {
            some.load(url: url)
            some.contentMode = .scaleToFill
            some.height(200)
        }
        return some
    }
    
    public static func label(title: String = "",
                             style: UILabel.LayoutStyle) -> UILabel {
        let some = UILabel()
        some.text = title
        some.numberOfLines = 0
        some.tag =  UIKitViewFactoryElementTag.label.intValue
        some.layoutStyle = style
        some.addShadow()
        return some
    }
    
    public static func scrollView() -> UIScrollView {
        let some = UIScrollView()
        some.tag = UIKitViewFactoryElementTag.scrollView.intValue
        some.isUserInteractionEnabled = true
        some.isScrollEnabled = true
        some.autoresizesSubviews = false
        some.translatesAutoresizingMaskIntoConstraints = false
        return some
    }
    
    // https://docs-assets.developer.apple.com/published/82128953f6/uistack_hero_2x_04e50947-5aa0-4403-825b-26ba4c1662bd.png
    // https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html
    // https://spin.atomicobject.com/2016/06/22/uistackview-distribution/
    public static var stackViewDefaultLayoutMargins: UIEdgeInsets {
        let topAndBottomSpacing: CGFloat = 0 // Is [ZERO] because [stackViewDefaultSpacing] will do the vertical space (if vertical stackview)
        return UIEdgeInsets(top: topAndBottomSpacing,
                            left: Designables.Sizes.Margins.defaultMargin,
                            bottom: topAndBottomSpacing,
                            right: Designables.Sizes.Margins.defaultMargin)
    }
    public static var stackViewDefaultSpacing: CGFloat {
        return Designables.Sizes.Margins.defaultMargin / 2
    }
    
    public static func stackView(arrangedSubviews: [UIView] = [],
                                 spacing: CGFloat = UIKitFactory.stackViewDefaultSpacing, // Space between subviews
                                 axis: NSLayoutConstraint.Axis,
                                 distribution: UIStackView.Distribution = .fill,
                                 alignment: UIStackView.Alignment = .fill,
                                 layoutMargins: UIEdgeInsets? = UIKitFactory.stackViewDefaultLayoutMargins) -> UIStackView {
        // Distribution: Fill - makes one subview take up most of the space, while the others remain at their natural size.
        //               It decides which view to stretch by examining the content hugging priority for each of the subviews.
        // Distribution: Fill Equally - adjusts each subview so that it takes up equal amount of space in the stack view.
        //               All space will be used up.
        // Distribution: Equal Spacing - adjusts the spacing between subviews without resizing the subviews themselves.
        // Distribution: Equal Centring - attempts to ensure the centers of each subview are equally spaced, irrespective of how far the edge
        //               of each subview is positioned.
        // Distribution: Fill Proportionally - is the most interesting, because it ensures subviews remain the same size relative to each other,
        //               but still stretches them to fit the available space. For example, if one view is 100 across and another is 200, and the
        //               stack view decides to stretch them to take up more space, the first view might stretch to 150 and the other to 300
        //               – both going up by 50%.

        let some = UIStackView(arrangedSubviews: arrangedSubviews)
        some.tag     = UIKitViewFactoryElementTag.stackView.intValue
        some.isLayoutMarginsRelativeArrangement = layoutMargins != nil
        if layoutMargins != nil {
            // When isLayoutMarginsRelativeArrangement property is true, the stack view will layout its arranged views relative to its layout margins.
            // Margins of the content views related to each other on the scroll view
            some.autoresizesSubviews = false
            some.layoutMargins = layoutMargins!
        }

        // Note
        some.axis         = axis         // determines the stack’s orientation, either vertically or horizontally.
        some.distribution = distribution // determines the layout of the arranged views along the stack’s axis.
        some.spacing      = spacing      // determines the minimum spacing between arranged views.
        some.alignment    = alignment    // determines the layout of the arranged views perpendicular to the stack’s axis.
        return some
    }
    

}

extension UIKitFactory {
    public static func labelWithPadding(padding: UIEdgeInsets? = nil,
                                        title: String = "",
                                        style: UILabel.LayoutStyle) -> UILabelWithPadding {
        let some = UILabelWithPadding(padding: padding, text: title)
        some.numberOfLines = 0
        some.tag =  UIKitViewFactoryElementTag.label.intValue
        some.addShadow()
        some.layoutStyle = style
        some.text = title
        return some
    }

}

