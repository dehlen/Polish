import UIKit

public extension UIAlertAction {
    
    convenience init(title: String, handler: @escaping (() -> Void)) {
        self.init(title: title, style: .default) { _ in
            handler()
        }
    }
}
