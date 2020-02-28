import UIKit

public typealias Constraint = (UIView, UIView) -> NSLayoutConstraint

public func equal<L, Axis>(_ to: KeyPath<UIView, L>, constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return equal(to, to, constant: constant)
}

public func equal<L, Axis>(_ from: KeyPath<UIView, L>, _ to: KeyPath<UIView, L>, constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return { view1, view2 in
        view1[keyPath: from].constraint(equalTo: view2[keyPath: to], constant: constant)
    }
}

public func equal<L>(_ keyPath: KeyPath<UIView, L>, constant: CGFloat) -> Constraint where L: NSLayoutDimension {
    return { view1, _ in
        view1[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

public extension UIView {
    func addSubview(_ other: UIView, constraints: [Constraint]) {
        other.translatesAutoresizingMaskIntoConstraints = false
        addSubview(other)
        addConstraints(constraints.map { $0(other, self) })
    }

    func embedIn(_ other: UIView) {
        other.addSubview(self, constraints: [
            equal(\.topAnchor), equal(\.bottomAnchor),
            equal(\.trailingAnchor), equal(\.leadingAnchor)
        ])
    }

    func centerIn(_ other: UIView) {
        other.addSubview(self, constraints: [
            equal(\.centerXAnchor), equal(\.centerYAnchor)
        ])
    }

    func constrainSize(size: CGSize) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
}
