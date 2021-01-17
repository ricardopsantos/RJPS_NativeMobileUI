//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public extension UIStackView {

    func loadWith(models: [ComponentModel]?, base: DynamicViewControllerProtocol) {
        self.removeAllSubviews()
        models?.forEach({ (model) in
            if model.type == .label, let style = UILabel.LayoutStyle(rawValue: model.layoutStyle) {
                self.addSub(view: UIKitFactory.label(title: model.text, style: style))
            } else if model.type == .button, let style = UIButton.LayoutStyle(rawValue: model.layoutStyle) {
                let some = UIKitFactory.button(title: model.text, style: style)
                if model.touchUpInsideEnabled {
                    some.isUserInteractionEnabled = true
                    some.onTouchUpInside { [base] in
                        base.viewGenericTap(some, model: model)
                    }
                }
                self.addSub(view: some)
            } else if model.type == .stackViewSection {
                self.addSection(title: model.text)
            }
        })
    }
    
    func edgeStackViewToSuperView() {
        guard self.superview != nil else {
            return
        }
        self.edgesToSuperview()
        self.width(to: superview!) // NEEDS THIS!
    }
    
    func addSection(title: String, font: AppFonts.Styles = .paragraphMedium, color: ColorName = .primary, barSize: CGFloat = 1) {
        addSeparator()
        addSeparator(withSize: barSize, color: color.rawValue)
        let label = UILabel()
        label.text = title
        label.font = font.rawValue
        label.tag =  UIKitViewFactoryElementTag.stackViewSection.intValue
        label.textAlignment = .center
        label.textColor = color.rawValue
        addSub(view: label)
        addSeparator()
    }
    
    private func add(_ view: UIView) {
        if view.superview == nil {
            self.addArrangedSubview(view)
            view.setNeedsLayout()
            view.layoutIfNeeded()
        }
    }
    
    func addSub(view: UIView) {
        self.add(view)
    }
    
    // If value=0, will use as separator size will (look) be twice the current
    // stack view separator (trust me)
    @discardableResult
    func addSeparator(withSize value: CGFloat=0, color: UIColor = .clear, tag: Int? = nil) -> UIView {
        let separator = UIView()
        separator.backgroundColor = color
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
