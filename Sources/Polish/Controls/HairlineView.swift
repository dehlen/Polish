import UIKit

public class HairlineView: UIView {
    @IBOutlet public weak var hairlineConstraint: NSLayoutConstraint?

    override public func awakeFromNib() {
        hairlineConstraint?.constant = 1 / UIScreen.main.scale
    }
}
