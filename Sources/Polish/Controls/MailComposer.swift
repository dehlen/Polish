import MessageUI
import Core

public protocol MailComposerType {
    typealias AttachmentType = (data: Data, mimeType: String, fileName: String)
    
    func canSendMail() -> Bool
    func makeViewController(email: String, subject: String?, body: String?, isHTML: Bool, attachment: AttachmentType?) -> MFMailComposeViewController?
    func makeViewController(emails: [String], subject: String?, body: String?, isHTML: Bool, attachment: AttachmentType?) -> MFMailComposeViewController?
}

public extension MailComposerType {
    
    func makeViewController(email: String) -> MFMailComposeViewController? {
        makeViewController(email: email, subject: nil, body: nil, isHTML: true, attachment: nil)
    }
    
    func makeViewController(email: String, subject: String, body: String) -> MFMailComposeViewController? {
        makeViewController(email: email, subject: subject, body: body, isHTML: true, attachment: nil)
    }
}

public protocol MailComposerDelegate: class {
    func mailComposer(didFinishWith result: MFMailComposeResult)
}

open class MailComposer: NSObject, MailComposerType {
    private weak var delegate: MailComposerDelegate?
    private let styleNavigationBar: ((UINavigationBar) -> Void)?
    
    public init(
        delegate: MailComposerDelegate? = nil,
        styleNavigationBar: ((UINavigationBar) -> Void)? = nil
    ) {
        self.delegate = delegate
        self.styleNavigationBar = styleNavigationBar
    }
    
    /// Returns a Boolean indicating whether the current device is able to send email.
    open func canSendMail() -> Bool {
        MFMailComposeViewController.canSendMail()
    }
}

public extension MailComposer {
    
    /// A standard interface for managing, editing, and sending an email message.
    func makeViewController(email: String, subject: String?, body: String?, isHTML: Bool, attachment: AttachmentType?) -> MFMailComposeViewController? {
        makeViewController(emails: [email], subject: subject, body: body, isHTML: isHTML, attachment: attachment)
    }
    
    /// A standard interface for managing, editing, and sending an email message.
    func makeViewController(emails: [String], subject: String?, body: String?, isHTML: Bool, attachment: AttachmentType?) -> MFMailComposeViewController? {
        guard canSendMail() else { return nil }
        
        return with(MFMailComposeViewController()) {
            $0.mailComposeDelegate = self
            
            $0.setToRecipients(emails)
            
            if let subject = subject {
                $0.setSubject(subject)
            }
            
            if let body = body {
                $0.setMessageBody(body, isHTML: isHTML)
            }
            
            if let attachment = attachment {
                $0.addAttachmentData(
                    attachment.data,
                    mimeType: attachment.mimeType,
                    fileName: attachment.fileName
                )
            }
            
            styleNavigationBar?($0.navigationBar)
        }
    }
}

// MARK: MFMailComposeViewControllerDelegate

extension MailComposer: MFMailComposeViewControllerDelegate {
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            self.delegate?.mailComposer(didFinishWith: result)
        }
    }
}
