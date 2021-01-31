//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public extension UIStackView {
    
    func edgeStackViewToSuperView() {
        guard self.superview != nil else {
            return
        }
        self.edgesToSuperview()
        self.width(to: superview!) // NEEDS THIS!
    }
    
    func addSection(title: String, font: AppFonts.Styles = .paragraphMedium, color: ColorName = .primary, barSize: CGFloat = 1) {
        _ = addSeparator()
        _ = addSeparator(withSize: barSize, color: color.rawValue)
        let label = UILabel()
        label.text = title
        label.font = font.rawValue
        label.tag =  UIKitViewFactoryElementTag.stackViewSection.intValue
        label.textAlignment = .center
        label.textColor = color.rawValue
        addSub(view: label)
        _ = addSeparator()
    }

    // If value=0, will use as separator size will (look) be twice the current
    // stack view separator (trust me)
    func addSeparator(withSize value: CGFloat=0, color: UIColor? = .clear, tag: Int? = nil) -> UIView {
        let separator = UIView()
        separator.backgroundColor = color ?? .clear
        if tag != nil {
            separator.tag = tag!
        }
        self.addArrangedSubview(separator)
        var finalValue = value
        if finalValue == 0 && self.spacing == 0 {
            // No space passed, and the stack view does not have space? Lets force a space
            finalValue = 10
        }
        if self.axis == .horizontal {
            separator.width(finalValue)
        } else {
            separator.height(finalValue)
        }
        return separator
    }
}
