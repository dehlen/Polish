import UIKit

public extension UINavigationController {
    
    /// The previous view controller of the navigation stack.
    var previousViewController: UIViewController? {
        viewControllers[safe: viewControllers.count - 2]
    }
    
    /// Pops the top view controller from the navigation stack and updates the display.
    ///
    /// - Parameters:
    ///   - animated: Set this value to true to animate the transition.
    ///   - completion: Optional completion handler
    func popViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        // https://stackoverflow.com/a/35064909
        popViewController(animated: animated)
        
        guard let completion = completion else { return }
        
        guard let coordinator = transitionCoordinator, animated else {
            completion()
            return
        }
        
        coordinator.animate(alongsideTransition: nil) { _ in
            completion()
        }
    }
}
