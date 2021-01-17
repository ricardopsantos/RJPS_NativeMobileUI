//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public extension UIButton {
    enum LayoutStyle: String, CaseIterable {
        case notApplied
        case primary
        case secondary
        case accept
        case reject
        case remind
    }
}

public extension UIButton {

    // Cant be o Designables because the Designables allready import AppTheme
    static var defaultFont: UIFont { AppFonts.Styles.paragraphMedium.rawValue }

    var layoutStyle: UIButton.LayoutStyle {
        set { apply(style: newValue) }
        get { return .notApplied }
    }
    
    func setState(enabled: Bool) {
        self.isUserInteractionEnabled = enabled
        self.alpha = enabled ? 1.0 : FadeType.disabledUIElementDefaultValue.rawValue
    }

    func apply(style: UIButton.LayoutStyle) {
        switch style {
        case .notApplied  : _ = 1
        case .primary     : self.applyStylePrimary()
        case .secondary   : self.applyStyleSecondary()
        case .accept      : self.applyStyleAccept()
        case .reject      : self.applyStyleReject()
        case .remind      : self.applyStyleRemind()
        }
    }
}

private extension UIButton {

    func applySharedProperties() {
        setState(enabled: true)
        addShadow(shadowType: .regular)
    }

    func applyStyleInngage() {
        applySharedProperties()
        self.titleLabel?.font = UIButton.defaultFont
        self.backgroundColor  = ComponentColor.UIButton.backgroundColorInnGage
        self.setTextColorForAllStates(ComponentColor.UIButton.textColorInnGage)
        self.layer.cornerRadius = 10.0
        self.clipsToBounds      = true
    }

    func applyStyleAccept() {
        applySharedProperties()
        self.titleLabel?.font = UIButton.defaultFont
        self.backgroundColor  = ComponentColor.accept
        self.setTextColorForAllStates(ComponentColor.UIButton.textColorDefault)
        self.layer.cornerRadius = Designables.Sizes.buttonDefaultSize.height / 2
        self.clipsToBounds      = true
    }

    func applyStyleReject() {
        applySharedProperties()
        self.titleLabel?.font = UIButton.defaultFont
        self.backgroundColor  = ComponentColor.reject
        self.setTextColorForAllStates(ComponentColor.UIButton.textColorDefault)
        self.layer.cornerRadius = Designables.Sizes.buttonDefaultSize.height / 2
        self.clipsToBounds      = true
    }

    func applyStyleRemind() {
        applySharedProperties()
        self.titleLabel?.font = UIButton.defaultFont
        self.backgroundColor  = ComponentColor.remind
        self.setTextColorForAllStates(ComponentColor.UIButton.textColorDefault)
        self.layer.cornerRadius = Designables.Sizes.buttonDefaultSize.height / 2
        self.clipsToBounds      = true
    }
    func applyStylePrimary() {
        applySharedProperties()
        self.titleLabel?.font = UIButton.defaultFont
        self.backgroundColor  = ComponentColor.UIButton.backgroundColorDefault
        self.setTextColorForAllStates(ComponentColor.UIButton.textColorDefault)
        self.layer.cornerRadius = Designables.Sizes.buttonDefaultSize.height / 2
        self.clipsToBounds      = true
    }

    func applyStyleSecondary() {
        applySharedProperties()
        self.titleLabel?.font = UIButton.defaultFont
        self.backgroundColor  = UIColor.white
        self.setTextColorForAllStates(ComponentColor.primary)
        self.layer.borderWidth  = 2
        self.layer.borderColor  = ComponentColor.primary.cgColor
        self.layer.cornerRadius = Designables.Sizes.buttonDefaultSize.height / 2
        self.clipsToBounds      = true
    }


}
