import UIKit

public class ScrollingContentViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let scrollViewContentContainer = UIView()

    private let scrollViewContent: UIViewController
    
    public init(content: UIViewController) {
        scrollViewContent = content
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.preservesSuperviewLayoutMargins = true
        
        view.embedSubview(scrollView)
        
        scrollView.embedSubview(scrollViewContentContainer)
        scrollView.widthAnchor.constraint(equalTo: scrollViewContentContainer.widthAnchor).isActive = true
        
        embedChild(scrollViewContent, in: scrollViewContentContainer)
        
    }
}
