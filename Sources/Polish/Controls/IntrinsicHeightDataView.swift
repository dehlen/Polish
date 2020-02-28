import UIKit

/// TableView that auto-sizes in StackView.
open class IntrinsicHeightTableView: UITableView {
    
    open override var contentSize: CGSize {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    open override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
