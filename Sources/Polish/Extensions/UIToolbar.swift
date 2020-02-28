import UIKit
import Core

public extension UIToolbar {
    
    /// Create an instance of a `UIToolbar` with a `Done` button that performs the action.
    ///
    ///     class ViewController: UIViewController {
    ///
    ///         private lazy var inputDoneToolbar: UIToolbar = .makeInputDoneToolbar(
    ///             target: self,
    ///             action: #selector(endEditing)
    ///         )
    ///     }
    ///
    ///     extension ViewController: UITextViewDelegate {
    ///
    ///         func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
    ///             textView.inputAccessoryView = inputDoneToolbar
    ///             return true
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - target: The object that receives the action message.
    ///   - action: The action to send to target when this item is selected.
    ///   - clearAction: The action to send to target when this item is cleared.
    ///   - title: The title of the toolbar.
    ///   - clearTitle: The title of the clear Button. Defaults to Clear
    /// - Returns: A control that displays the done button along the bottom edge of your interface.
    static func makeInputDoneToolbar(target: Any?, action: Selector, clearAction: Selector? = nil, title: String? = nil, clearTitle: String = "Clear") -> UIToolbar {
        with(UIToolbar()) {
            $0.isTranslucent = true
            $0.isUserInteractionEnabled = true
            $0.sizeToFit()
            
            var items: [UIBarButtonItem] = []
            
            if let clearAction = clearAction {
                let clearButton = UIBarButtonItem(
                    title: clearTitle,
                    style: .plain,
                    target: target,
                    action: clearAction
                )
                
                clearButton.setTitleTextAttributes([
                    .font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
                ], for: .normal)
                
                items.append(clearButton)
            }
            
            if let title = title {
                items += [
                    .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                    .init(customView:
                        with(UILabel(frame: .zero)) {
                            $0.text = title
                            $0.sizeToFit()
                            $0.backgroundColor = .clear
                            $0.textColor = .gray
                            $0.textAlignment = .center
                        }
                    )
                ]
            }
            
            items += [
                .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                .init(barButtonSystemItem: .done, target: target, action: action)
            ]
            
            $0.setItems(items, animated: false)
        }
    }
    
    /// Create an instance of a `UIToolbar` with a `Next` button that performs the action.
    ///
    /// - Parameters:
    ///   - target: The object that receives the action message.
    ///   - action: The action to send to target when this item is selected.
    ///   - clearAction: The action to send to target when this item is cleared.
    ///   - title: The title of the toolbar.
    ///   - clearTitle: The title of the clear button. Defaults to Clear.
    ///   - nextTitle: The title of the next button. Defaults to Next.
    /// - Returns: A control that displays the next button along the bottom edge of your interface.
    static func makeInputNextToolbar(target: Any?, action: Selector, clearAction: Selector? = nil, title: String? = nil, clearTitle: String = "Clear", nextTitle: String = "Next") -> UIToolbar {
        with(UIToolbar()) {
            $0.isTranslucent = true
            $0.isUserInteractionEnabled = true
            $0.sizeToFit()
            
            var items: [UIBarButtonItem] = []
            
            if let clearAction = clearAction {
                let clearButton = UIBarButtonItem(
                    title: clearTitle,
                    style: .plain,
                    target: target,
                    action: clearAction
                )
                
                clearButton.setTitleTextAttributes([
                    .font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
                ], for: .normal)
                
                items.append(clearButton)
            }
            
            if let title = title {
                items += [
                    .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                    .init(customView:
                        with(UILabel(frame: .zero)) {
                            $0.text = title
                            $0.sizeToFit()
                            $0.backgroundColor = .clear
                            $0.textColor = .gray
                            $0.textAlignment = .center
                        }
                    )
                ]
            }
            
            let nextButton = UIBarButtonItem(
                title: nextTitle,
                style: .plain,
                target: target,
                action: action
            )
            
            nextButton.setTitleTextAttributes([
                .font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
            ], for: .normal)
            
            items += [
                .init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                nextButton
            ]
            
            $0.setItems(items, animated: false)
        }
    }
}
