import UIKit

/// A circular `UIView`.
open class RoundedView: UIView {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}

/// A circular `UIButton`.
open class RoundedButton: UIButton {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}

/// A circular `UIImageView`.
open class RoundedImageView: UIImageView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}
