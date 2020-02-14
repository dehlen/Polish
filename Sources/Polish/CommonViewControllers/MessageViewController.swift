import UIKit

public struct Message {
    public struct Action {
        let title: String
        let handler: () -> Void
    }
    
    let text: String
    let image: UIImage?
    let action: Action?
    
    public init(text: String, image: UIImage? = nil, action: Action? = nil) {
        self.text = text
        self.image = image
        self.action = action
    }
    
    public init(text: String, image: UIImage? = nil, actionTitle: String, actionHandler: @escaping () -> Void) {
        self.text = text
        self.image = image
        self.action = Action(title: actionTitle, handler: actionHandler)
    }
}

public class MessageViewController: UIViewController {
    private let message: Message
    
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var messageText: UILabel?
    @IBOutlet private var messageAction: UIButton?

    public init(message: Message) {
        self.message = message
        super.init(nibName: "MessageViewController", bundle: nil)
    }
    
    public convenience init(text: String, image: UIImage? = nil, action: Message.Action? = nil) {
        let m = Message(text: text, image: image, action: action)
        self.init(message: m)
    }
    
    public convenience init(text: String, image: UIImage? = nil, actionTitle: String, actionHandler: @escaping () -> Void) {
        let m = Message(text: text, image: image, actionTitle: actionTitle, actionHandler: actionHandler)
        self.init(message: m)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = message.image {
            imageView?.image = image
        } else {
            imageView?.removeFromSuperview()
        }
        
        messageText?.text = message.text
        
        if let action = message.action {
            messageAction?.setTitle(action.title, for: .normal)
        } else {
            messageAction?.removeFromSuperview()
        }
    }
    
    @IBAction private func performMessageAction(_ sender: UIButton) {
        message.action?.handler()
    }
}
