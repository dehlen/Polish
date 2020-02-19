import UIKit

public final class StateViewController: UIViewController {
    public enum State {
        case loading
        case content(controller: UIViewController)
        case error(message: String)
        case empty(message: String)
    }

    public var state: State = .loading {
        didSet {
            applyState()
        }
    }

    private var contentController: UIViewController? {
        didSet {
            guard contentController != oldValue else { return }

            swapContent(newValue: contentController, oldValue: oldValue)
        }
    }

    private func viewController(for state: State) -> UIViewController {
        switch state {
        case .loading:
            return LoadingViewController()
        case .empty(let message), .error(let message):
            return MessageViewController(text: message)
        case .content(let controller):
            return controller
        }
    }

    private func applyState() {
        contentController = viewController(for: state)
    }

    private func swapContent(newValue: UIViewController?, oldValue: UIViewController?) {
        oldValue?.view.removeFromSuperview()
        oldValue?.removeFromParent()
        oldValue?.didMove(toParent: nil)

        guard let controller = newValue else { return }

        embedChild(controller)
    }

    public override func loadView() {
        view = UIView()

        applyState()
    }
}
