//
//  Created by Ricardo Santos on 17/01/2021.
//

import Foundation
import Combine

public final class CancelBag {
    var subscriptions = Set<AnyCancellable>()
    public init() {
        subscriptions = Set<AnyCancellable>()
    }
    func cancel() {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
}

public extension AnyCancellable {
    
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
