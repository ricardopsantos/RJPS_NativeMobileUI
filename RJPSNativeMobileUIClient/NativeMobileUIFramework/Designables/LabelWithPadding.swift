//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit
import SwiftUI
//
import TinyConstraints


// MARK: - View

open class UILabelWithPadding: UIView {

    //
    // Its just a view with a UILabel inside.
    // For fast label access just use [public lazy var label: UILabel] property
    //

    var _padding: UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    public var padding: UIEdgeInsets { _padding }
    private var paddingWasApplied = false
    
    public lazy var label: UILabel = {
        let some = UIKitFactory.label(style: .value)
        addSubview(some)
        return some
    }()
    
    private func unifyColors() {
        // Keep the same colour than the label
        self.backgroundColor = label.backgroundColor
        label.backgroundColor = .clear
    }
    
    var layoutStyle: UILabel.LayoutStyle {
        set {
            label.layoutStyle = newValue
            unifyColors()
        }
        get { return .notApplied }
    }
    
    public func apply(style: UILabel.LayoutStyle) {
        layoutStyle = style
        unifyColors()
    }
    
    public var numberOfLines: Int = 0 {
        didSet { label.numberOfLines = numberOfLines }
    }
    
    public var textColor: UIColor = .black {
        didSet { label.textColor = textColor }
    }
    
    public var textAlignment: NSTextAlignment = .left {
        didSet { label.textAlignment = textAlignment }
    }
    
    public var text: String = "" {
        didSet { label.text = text }
    }
    
    public var textAnimated: String = "" {
        didSet { label.textAnimated = textAnimated }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func applyPadding() {
        guard !paddingWasApplied else { return }
        label.topToSuperview(offset: padding.top)
        label.bottomToSuperview(offset: padding.left)
        label.leadingToSuperview(offset: padding.right)
        label.trailingToSuperview(offset: padding.bottom)
        paddingWasApplied = true
    }
    
    public convenience init(padding: UIEdgeInsets?, text: String="") {
        self.init(frame: .zero)
        if padding != nil {
            self._padding = padding!
        }
        applyPadding()
        self.text = text
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupView() {
        applyPadding()
    }
}
