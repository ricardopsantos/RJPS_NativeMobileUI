//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit
import RJSLibUFBase
import RJSLibUFAppThemes
import TinyConstraints

public struct UIKitFactory {
    private init() {}

    static func view(model: ComponentModel, base: DynamicViewControllerProtocol) -> UIView? {
        switch model.type {
        case .view: fatalError("Not implemented")
        case .button: return UIKitFactory.button(model, base: base)
        case .scrollView: fatalError("Not implemented")
        case .stackView: fatalError("Not implemented")
        case .imageView: return UIKitFactory.imageView(model, base: base)
        case .textField: return UIKitFactory.textField(model, base: base)
        case .label: return UIKitFactory.label(model, base: base)
        case .stackViewSeparator: return nil
        case .titleAndValue: fatalError("Not implemented")
        case .stackViewSection: return nil
        }
    }
    
    static func button(_ model: ComponentModel,
                       base: DynamicViewControllerProtocol) -> UIButton? {
        guard model.type == .button,
              let style = UIButton.LayoutStyle(rawValue: model.layoutStyle) else {
            fatalError("Invalid model [\(model)]")
        }
        let some = UIKitFactory.button(id: model.id, title: model.text, style: style)
        some.isUserInteractionEnabled = true
        some.onTouchUpInside { [base] in
            base.viewGenericTap(some, model: model)
        }
        return some
    }
    
    public static func button(id: String?,
                              title: String = "",
                              style: UIButton.LayoutStyle) -> UIButton {
        let some = UIButton()
        if let id = id {
            some.set(componentID: id)
        }
        some.setTitleForAllStates(title)
        some.tag = UIKitViewFactoryElementTag.button.intValue
        some.setTitleForAllStates(title)
        some.layoutStyle = style
        return some
    }

    static func textField(_ model: ComponentModel,
                          base: DynamicViewControllerProtocol) -> UITextField? {
        guard model.type == .textField else {
            fatalError("Invalid model [\(model)]")
        }
        let some = UIKitFactory.textField(id: model.id,
                                          title: model.text,
                                          placeholder: model.textPlaceHolder,
                                          isSecureTextEntry: model.textIsSecured)
        return some
    }
    
    public static func textField(id: String?,
                                 title: String,
                                 placeholder: String = "",
                                 isSecureTextEntry: Bool = false) -> UITextField {
        let baseLabel = UILabel()
        baseLabel.layoutStyle = .value
        let some = UITextField()
        if let id = id {
            some.set(componentID: id)
        }
        some.text = title
        some.textColor = baseLabel.textColor
        some.font = baseLabel.font
        some.backgroundColor = ColorName.primary.color.withAlphaComponent(FadeType.superHeavy.rawValue)
        some.tag = UIKitViewFactoryElementTag.textField.intValue
        some.placeholder = placeholder
        some.layer.sublayerTransform = CATransform3DMakeTranslation(SizesNames.size_3.cgFloat, 0, 0)
        some.isSecureTextEntry = isSecureTextEntry
        some.addCorner(radius: 5)
        return some
    }

    static func imageView(_ model: ComponentModel,
                          base: DynamicViewControllerProtocol) -> UIImageView? {
        guard model.type == .imageView,
              !model.url.isEmpty else {
            fatalError("Invalid model [\(model)]")
        }
        return UIKitFactory.imageView(id: model.id, imageURL: model.url)
    }
    
    public static func imageView(id: String?,
                                 image: UIImage? = nil,
                                 imageURL: String? = nil) -> UIImageView {
        let some = UIImageView()
        if let id = id {
            some.set(componentID: id)
        }
        some.tag =  UIKitViewFactoryElementTag.imageView.intValue
        if image != nil {
            some.image = image
        }
        if imageURL != nil, let url = URL(string: imageURL!) {
            some.load(url: url)
            //some.contentMode = .scaleToFill
            some.contentMode = .scaleAspectFit
            some.layer.masksToBounds = true
            some.height(200)
        }
        return some
    }
    
    static func label(_ model: ComponentModel,
                      base: DynamicViewControllerProtocol) -> UILabel? {
        guard model.type == .label,
              let style = UILabel.LayoutStyle(rawValue: model.layoutStyle) else {
            fatalError("Invalid model [\(model)]")
        }
        return UIKitFactory.label(id: model.id,
                                  title: model.text,
                                  style: style,
                                  textAlignment: model.textAlignement)
    }
    
    public static func label(id: String?,
                             title: String = "",
                             style: UILabel.LayoutStyle,
                             textAlignment: NSTextAlignment = .justified) -> UILabel {
        let some = UILabel()
        if let id = id {
            some.set(componentID: id)
        }
        some.text = title
        some.numberOfLines = 0
        some.tag =  UIKitViewFactoryElementTag.label.intValue
        some.layoutStyle = style
        some.textAlignment = textAlignment
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

