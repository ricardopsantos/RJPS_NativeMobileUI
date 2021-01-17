//
//  File.swift
//  RJPSNativeMobileUIClient
//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public extension UILabel {
    enum LayoutStyle: String, CaseIterable {
        case notApplied
        case navigationBarTitle
        case title
        case value
        case text
        case error
    }
}

public extension UILabel {
    
    var layoutStyle: UILabel.LayoutStyle {
        set { apply(style: newValue) }
        get { return .notApplied }
    }

    func apply(style: UILabel.LayoutStyle) {
        
        let navigationBarTitle = {
            self.textColor       = ComponentColor.TopBar.titleColor
            self.font            = AppFonts.Styles.headingMedium.rawValue
        }

        let title = {
            self.textColor       = ComponentColor.UILabel.lblTextColor
            self.font            = AppFonts.Styles.paragraphBold.rawValue
        }

        let value = {
            self.textColor       = ComponentColor.UILabel.lblTextColor.withAlphaComponent(FadeType.superLight.rawValue)
            self.font            = AppFonts.Styles.paragraphSmall.rawValue
        }

        let text = {
            self.textColor       = ComponentColor.UILabel.lblTextColor
            self.font            = AppFonts.Styles.caption.rawValue
        }

        let error = {
            self.textColor       = ComponentColor.error
            self.font            = AppFonts.Styles.captionSmall.rawValue
        }

        switch style {
        case .notApplied         : _ = 1
        case .navigationBarTitle : navigationBarTitle()
        case .title              : title()
        case .value              : value()
        case .text               : text()
        case .error              : error()
        }
    }
}
