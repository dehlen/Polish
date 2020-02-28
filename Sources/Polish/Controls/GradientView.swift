import UIKit

/// A `UIView` with gradient effects.
@IBDesignable
open class GradientView: UIView {
    
    @IBInspectable open var firstColor: UIColor = .clear {
        didSet { configure() }
    }
    
    @IBInspectable open var secondColor: UIColor = .clear {
        didSet { configure() }
    }
    
    @IBInspectable open var isVertical: Bool = true {
        didSet { configure() }
    }
    
    override class open var layerClass: AnyClass { CAGradientLayer.self }
}

private extension GradientView {
    
    func configure() {
        guard let layer = self.layer as? CAGradientLayer else { return }
        
        layer.colors = [firstColor, secondColor].map { $0.cgColor }
        
        layer.startPoint = isVertical
            ? CGPoint(x: 0.5, y: 0)
            : CGPoint(x: 0, y: 0.5)
        
        layer.endPoint = isVertical
            ? CGPoint (x: 0.5, y: 1)
            : CGPoint (x: 1, y: 0.5)
    }
}
