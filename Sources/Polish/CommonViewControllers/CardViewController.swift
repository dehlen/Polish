import UIKit

public struct Card {
    let title: String
    let message: String
    let action: CardAction
}

public struct CardAction {
    let title: String
    let action: () -> Void
}

/** Use like:
 ```
 @objc private func presentCard() {
    let card = Card(title: "", message: "", action: CardAction(title: "", action: {}))
    let viewController = CardViewController(card: card)
    present(viewController, animated: true, completion: nil)
 }
 ```
 */
public class CardViewController: UIViewController {
    let card: Card

    public init(card: Card) {
       self.card = card
        super.init(nibName: nil, bundle: nil)

        transitioningDelegate = self
        modalPresentationStyle = .custom
    }

    convenience init(cardTitle: String, cardMessage: String, cardAction: CardAction) {
        self.init(card: Card(title: cardTitle, message: cardMessage, action: cardAction))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = card.title

        let messageLabel = UILabel()
        messageLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        messageLabel.font = .systemFont(ofSize: 20, weight: .medium)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.text = card.message

        let connectButton = UIButton(type: .system)
        connectButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        connectButton.setTitle(card.action.title, for: .normal)
        connectButton.addTarget(self, action: #selector(cardActionTriggered), for: .primaryActionTriggered)

        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(close), for: .primaryActionTriggered)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, messageLabel, connectButton, cancelButton])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    @objc private func cardActionTriggered() {
        card.action.action()
    }
    
    @objc private func close() {
        dismiss(animated: true)
    }
}

extension CardViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CardPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
