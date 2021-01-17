//
//  Created by Ricardo Santos on 17/01/2021.
//

import UIKit
import Foundation
//
import RJSLibUFAppThemes

public struct AppTheme {
    private init() {}
}

// Pack of 22 color namings, inspired on https://developer.android.com/reference/kotlin/androidx/compose/material/Colors
// Its a way of having a colors on the app, but where the color value its not the color it self, but instead is the place
// where that color is being used
// Have things like : surface, onSurface, detail, onDetail, success, onSuccess, ...
public typealias ColorName = RJS_ColorName


// Fonts Shortcut: https://github.com/ricardopsantos/RJPSLib/blob/master/RJSPLib.AppThemes/LibCode/UIFont%2BExtensions.swift
// Font styles utils with a font builder for Bold, Regular and Light, and also pre-built styles like : headingJumbo, headingBold, headingMedium, headingSmall
public typealias AppFonts = RJS_Fonts
