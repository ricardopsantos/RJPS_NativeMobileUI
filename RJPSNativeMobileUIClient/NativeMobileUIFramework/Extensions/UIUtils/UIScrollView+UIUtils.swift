//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import UIKit

public extension UIScrollView {

    func edgeScrollViewToSuperView() {
        self.edgesToSuperview()
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .always
        }
        self.width(to: self.superview!) // NEEDS THIS!
    }

    // Solving the issue : uiscrollview scrollable content size ambiguity
    // https://stackoverflow.com/questions/19036228/uiscrollview-scrollable-content-size-ambiguity
    func addContentView() -> UIView {
        let contentView: UIView = UIView()
        self.addSubview(contentView)
        contentView.edgesToSuperview()
        guard let superview = self.superview else {
            return contentView
        }
        contentView.size(to: superview)
        return contentView
    }

    func addStackView(_ stackView: UIStackView) {
        let contentView = self.addContentView()
        contentView.addSubview(stackView)
        stackView.edgeStackViewToSuperView()
    }
}
