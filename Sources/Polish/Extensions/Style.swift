import UIKit

precedencegroup SingleTypeComposition {
    associativity: right
}
infix operator <>: SingleTypeComposition

public func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

public func accessibleStyle<V: UIBarButtonItem>(_ view: V) {
    view.isAccessibilityElement = true
}

// MARK: - View
public func roundedRectStyle<View: UIView>(_ view: View) {
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
}

public func autolayoutStyle<V: UIView>(_ view: V) -> Void {
    view.translatesAutoresizingMaskIntoConstraints = false
}

// MARK: - Label
public func fontStyle(ofSize size: CGFloat, weight: UIFont.Weight) -> (UILabel) -> Void {
    return {
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: size, weight: weight))
    }
}

public func preferredFontStyle(_ textStyle: UIFont.TextStyle) -> (UILabel) -> Void {
    return {
        $0.adjustsFontForContentSizeCategory = true
        $0.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}

public func textColorStyle(_ color: UIColor) -> (UILabel) -> Void {
    return {
        $0.textColor = color
    }
}

public func multiLineStyle() -> (UILabel) -> Void {
    return {
        $0.numberOfLines = 0
    }
}

public func multiLineStyle(_ numberOfLines: Int) -> (UILabel) -> Void {
    return {
        $0.numberOfLines = numberOfLines
    }
}

public let centerStyle: (UILabel) -> Void = {
    $0.textAlignment = .center
}

//MARK: - Button
public let baseButtonStyle: (UIButton) -> Void = {
    $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    $0.titleLabel?.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16, weight: .medium))
}

public let roundedButtonStyle =
    baseButtonStyle
        <> roundedRectStyle

// MARK: - ImageView
public let baseImageViewStyle: (UIImageView) -> Void = {
    $0.contentMode = .scaleAspectFit
}

// MARK: - TextField
public let baseTextFieldStyle: (UITextField) -> Void = {
    $0.font = UIFont.preferredFont(forTextStyle: .body)
    $0.borderStyle = .none
    $0.clearButtonMode = .whileEditing
    $0.autocorrectionType = .no
}
