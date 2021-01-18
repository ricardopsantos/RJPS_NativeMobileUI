//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit
//
import TinyConstraints
import RJSLibUFAppThemes

public extension UIView {
    
    func subViewsOf(type: UIKitViewFactoryElementTag, recursive: Bool) -> [UIView] {
        return self.subViewsWith(tag: type.intValue, recursive: recursive)
    }

    func subViewsWith(tag: Int, recursive: Bool) -> [UIView] {
        if recursive {
            return self.getAllSubviews().filter { $0.tag == tag }
        } else {
            return self.subviews.filter { $0.tag == tag }
        }
    }

    class func getAllSubviews<T: UIView>(from parenView: UIView) -> [T] {
        parenView.subviews.flatMap { subView -> [T] in
            var result = getAllSubviews(from: subView) as [T]
            if let view = subView as? T { result.append(view) }
            return result
        }
    }

    class func getAllSubviews(from parenView: UIView, types: [UIView.Type]) -> [UIView] {
        parenView.subviews.flatMap { subView -> [UIView] in
            var result = getAllSubviews(from: subView) as [UIView]
            for type in types {
                if subView.classForCoder == type {
                    result.append(subView)
                    return result
                }
            }
            return result
        }
    }

    func getAllSubviews<T: UIView>() -> [T] { UIView.getAllSubviews(from: self) as [T] }

    func get<T: UIView>(all type: T.Type) -> [T] { UIView.getAllSubviews(from: self) as [T] }

    func get(all types: [UIView.Type]) -> [UIView] { UIView.getAllSubviews(from: self, types: types) }

    func bringToFront() { superview?.bringSubviewToFront(self) }

    func sendToBack() { superview?.sendSubviewToBack(self) }
}

public extension UIView {

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
    
    // this functions is duplicated
    func addBlur(style: UIBlurEffect.Style = .dark) -> UIVisualEffectView {
        let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.5
        self.addSubview(blurEffectView)
        return blurEffectView
    }

    // this functions is duplicated
    struct Shadows {
        private init() { }
        public static func offsetWith(k: CGFloat) -> CGSize {
            return CGSize(width: offset.width / k, height: offset.height / k)
        }
        static var k = 1.0
        public static let offset = CGSize(width: 1, height: 5) // Shadow bellow
        public static var shadowColor = UIColor(red: CGFloat(80/255.0), green: CGFloat(88/255.0), blue: CGFloat(93/255.0), alpha: 1)
    }

    // this functions is duplicated
    func addShadow(color: UIColor = Shadows.shadowColor,
                   offset: CGSize = Shadows.offset,
                   radius: CGFloat = Shadows.offset.height,
                   shadowType: ShadowType = ShadowType.superLight) {
        self.layer.shadowColor   = color.cgColor
        self.layer.shadowOpacity = Float(1 - shadowType.rawValue)
        self.layer.shadowOffset  = offset
        self.layer.shadowRadius  = radius
        self.layer.masksToBounds = false
    }

    // this functions is duplicated
    func addCorner(radius: CGFloat) {
        self.layoutIfNeeded()
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension UIView {
    func addHorizontalMargin(_ defaultMargin: CGFloat = SizesNames.size_5.cgFloat) {
        let edgesToExclude: LayoutEdge = .init([.top, .bottom])
        let insets = UIEdgeInsets(top: 0,
                                  left: defaultMargin,
                                  bottom: 0,
                                  right: defaultMargin)
        self.edgesToSuperview(excluding: edgesToExclude, insets: insets)
    }
}
