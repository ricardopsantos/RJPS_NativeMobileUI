//
//  Created by Ricardo Santos on 18/01/2021.
//

import Foundation
import UIKit

class DynamicBaseVC: UIViewController {
    
    lazy var scrollView: UIScrollView = { UIKitFactory.scrollView() }()
    lazy var stackViewVLevel1: UIStackView = { UIKitFactory.stackView(axis: .vertical) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addAndSetup(scrollView: scrollView, stackViewV: stackViewVLevel1, hasTopBar: true)
        prepareLayout()
    }
    
    func screenJSON() -> String? {
        fatalError("Override me!")
    }

    func prepareLayout() {
        fatalError("Override me!")
    }
}

//
// Loaders
//

extension DynamicBaseVC {
    func load(file: String, base: DynamicViewControllerProtocol) {
        let models = ComponentModel.loadWith(file: file)
        stackViewVLevel1.loadWith(models: models, base: base)
    }
    
    func load(json: String?, base: DynamicViewControllerProtocol) {
        let models = ComponentModel.loadWith(json: json)
        load(models: models, base: base)
    }
    
    func load(models: [ComponentModel]?, base: DynamicViewControllerProtocol) {
        stackViewVLevel1.loadWith(models: models, base: base)
    }
}
