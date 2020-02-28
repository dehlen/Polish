import UIKit

public class CardPresentationController: PresentationController {
    override public var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return containerView.bounds
            .inset(by: UIEdgeInsets(top: containerView.bounds.size.height - 400, left: 16, bottom: 16, right: 16))
            .inset(by: containerView.safeAreaInsets)
    }
    
    override public func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override public func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        presentedView?.layer.cornerRadius = 48
        containerView?.backgroundColor = .clear
        
        if let coordinator = presentingViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { [weak self] _ in
                self?.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                }, completion: nil)
        }
    }
    
    override public func dismissalTransitionWillBegin() {
        if let coordinator = presentingViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { [weak self] _ in
                self?.containerView?.backgroundColor = .clear
                }, completion: nil)
        }
    }
}
