import UIKit

public extension UIRefreshControl {
    /// Tells the control that a refresh operation was started programmatically
    /// and displays the offset at the top of scroll view if available.
    func beginRefreshing(setOffset: Bool) {
        // https://stackoverflow.com/a/35468501
        guard let scrollView = superview as? UIScrollView, setOffset else { return beginRefreshing() }
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.size.height), animated: true)
        beginRefreshing()
    }
}
