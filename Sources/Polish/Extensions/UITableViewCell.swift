import UIKit
import Core

public extension UITableViewCell {
    /// The color of the cell when it is selected.
    @objc dynamic var selectionColor: UIColor? {
        get { selectedBackgroundView?.backgroundColor }
        
        set {
            guard selectionStyle != .none else { return }
            selectedBackgroundView = with(UIView()) {
                $0.backgroundColor = newValue
            }
        }
    }
}

public class UITableViewCellDefault: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
}

public class UITableViewCellValue1: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
}

public class UITableViewCellValue2: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
}

public class UITableViewCellSubtitle: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
}

