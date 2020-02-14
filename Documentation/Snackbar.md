# Snackbar

``` swift
open class Snackbar: Equatable
```

## Inheritance

`Equatable`

## Nested Type Aliases

## SnackbarCompletion

The completion block for an `Snackbar`, `true` is sent if button was tapped, `false` otherwise.

``` swift
Typealias(context: Optional("Snackbar"), attributes: [], modifiers: [public], keyword: "typealias", name: "SnackbarCompletion", initializedType: Optional("(Bool) -> Void"), genericParameters: [], genericRequirements: [])
```

## Initializers

## init(title:buttonTitle:)

Creates an `Snackbar`.

``` swift
public init(title: String, buttonTitle: String?)
```

### Important

If `buttonTitle` is `nil`, no button will be displayed.

## init(attributedTitle:attributedButtonTitle:)

Creates an `Snackbar`.

``` swift
public init(attributedTitle: NSAttributedString, attributedButtonTitle: NSAttributedString?)
```

### Important

If `attributedButtonTitle` is `nil`, no button will be displayed.

## Properties

## view

The `SnackbarView` for the controller, access this view and it's subviews to do any additional customization.

``` swift
var view: SnackbarView = {
        let snackView = SnackbarView(frame: .zero)
        snackView.controller = self
        snackView.isHidden = true
        return snackView
    }()
```

## widthPercent

The width percent of the total available size that the `view` should take up.

``` swift
var widthPercent: CGFloat = 0.98
```

### Important

This should only be a value between `0.0` and `1.0`. If this value is set past this range, the value
will be reset to the default value of `0.98`.

## height

The height for the `SnackbarView`.

``` swift
var height: CGFloat = 40.0
```

### Important

Do not set the frame of the `view` yourself. Instead set the `widthPercent` and `height`.
Setting the frame for `view` can have unexpected results as the frame is calculated in a different way depending
on many variables.

## bottomSpacing

The bottom spacing for the `view`.

``` swift
var bottomSpacing: CGFloat = 12.0
```

For example, by default the `view` is placed in the main `UIWindow` of an application with a default
bottom spacing of `12.0`, however, if you have a `UITabBarController` you may want to increase the bottom spacing
so that the snack is presented above the bar.

## stackedBottomSpacing

Similar to the `bottomSpacing` property, except this is only used when multiple `SnackbarViews` are stacked.

``` swift
var stackedBottomSpacing: CGFloat = 8.0
```

## adjustsPositionForSafeArea

Whether or not the snackbar should adjust to fit within the safe area's of it's parent view.

``` swift
var adjustsPositionForSafeArea: Bool = true
```

Only used in iOS 11.0 +

## viewToDisplayIn

Optional view to display the `view` in, by default this is `nil`, thus the main `UIWindow` is used for presentation.

``` swift
var viewToDisplayIn: UIView?
```

## animationDuration

The duration for the animation of both the adding and removal of the `view`.

``` swift
var animationDuration: TimeInterval = 0.5
```

## Methods

## show(displayDuration:animated:completion:)

Presents the snack to the screen

``` swift
open func show(displayDuration: TimeInterval? = 5.0, animated: Bool = true, completion: SnackbarCompletion? = nil)
```

### Parameters

  - displayDuration: How long to show the snack for, if `nil`, will show forever. Default = `5.0`
  - animated: Whether or not the snack should animate in and out. Default = `true`
  - completion: The completion handler for when the snack is removed/button pressed. Default = `nil`

## dismiss(animated:completeWithAction:)

Allows you to manually dismiss the snack from the screen.

``` swift
open func dismiss(animated: Bool = true, completeWithAction: Bool = false)
```

## showSnack(title:displayDuration:completion:)

Allows showing a simple snack without needing to instantiate any `Snackbar`

``` swift
public static func showSnack(title: String, displayDuration: TimeInterval? = 5.0, completion: SnackbarCompletion? = nil)
```

## showSnack(attributedTitle:displayDuration:completion:)

Allows showing a simple, more customizable, snack without needing to instantiate any `Snackbar`

``` swift
public static func showSnack(attributedTitle: NSAttributedString, displayDuration: TimeInterval? = 5.0, completion: SnackbarCompletion? = nil)
```

## \==(lhs:rhs:)

Returns equals if and only if `lhs` and `rhs` are the same object.

``` swift
public static func ==(lhs: Snackbar, rhs: Snackbar) -> Bool
```
