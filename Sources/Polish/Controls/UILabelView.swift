import UIKit

/// UITextView that mimics UILabel for leveraging data detectors and other features
open class UILabelView: UITextView {
    
    public init(dataDetectorTypes: UIDataDetectorTypes) {
        self.init()
        self.dataDetectorTypes = dataDetectorTypes
        configure()
    }
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
}

private extension UILabelView {
    
    func configure() {
        isEditable = false
        isScrollEnabled = false
        textContainer.lineFragmentPadding = 0
        textContainerInset = .zero
        backgroundColor = .clear
    }
}
