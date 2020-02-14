# KeyboardObserver

``` swift
public final class KeyboardObserver: NSObject
```

## Inheritance

`NSObject`, `UIGestureRecognizerDelegate`

## Initializers

## init(window:shouldTapCancelTouches:ignoredViews:)

``` swift
public init(window: UIWindow, shouldTapCancelTouches: Bool = false, ignoredViews: [UIView.Type] = [UIControl.self])
```

## Properties

## shouldTapCancelTouches

``` swift
var shouldTapCancelTouches: Bool
```

## ignoredViews

List of view subclasses that should be ignored by the gesture recognizer. Touches on these views won't get
the keyboard resigned. Default is `[UIControl.self]`.

``` swift
var ignoredViews: [UIView.Type]
```

## Methods

## gestureRecognizer(\_:shouldReceive:)

``` swift
public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool
```
