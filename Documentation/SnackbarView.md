# SnackbarView

The `SnackbarView` which contains 3 subviews.

``` swift
open class SnackbarView: UIView
```

  - titleLabel: The label on the left hand side of the view used to display text.

<!-- end list -->

  - button: The button on the right hand side of the view which allows an action to be performed.

<!-- end list -->

  - seperator: A small view which adds an accent that seperates the `titleLabel` and the `button`.

## Inheritance

`UIView`

## Initializers

## init(frame:)

Overriden

``` swift
public override init(frame: CGRect)
```

## init?(coder:)

Overriden

``` swift
public required init?(coder aDecoder: NSCoder)
```

## Properties

## leftPadding

The amount of padding from the left handside, used to layout the `titleLabel`, default is `8.0`

``` swift
var leftPadding: CGFloat = 8.0
```

## rightPadding

The amount of padding from the right handside, used to layout the `button`, default is `8.0`

``` swift
var rightPadding: CGFloat = 8.0
```

## seperatorHeightPercent

The height percent of the total available size that the seperator should take up inside the view.

``` swift
var seperatorHeightPercent: CGFloat = 0.65
```

### Important

This should only be a value between `0.0` and `1.0`. If this value is set past this range, the value
will be reset to the default value of `0.65`.

## seperatorWidth

The width for the seperator, default is `1.5`

``` swift
var seperatorWidth: CGFloat = 1.5
```

## seperatorPadding

The amount of padding from the right side of the seperator (next to the button), default is `20.0`

``` swift
var seperatorPadding: CGFloat = 20.0
```

## actionMaxWidth

``` swift
var actionMaxWidth: CGFloat = 100
```

## spaceBetweenElements

``` swift
var spaceBetweenElements: CGFloat = 24.0
```

## titleLabel

The label on the left hand side of the view used to display text.

``` swift
var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
```

## button

The button on the right hand side of the view which allows an action to be performed.

``` swift
var button: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(red: 0.702, green: 0.867, blue: 0.969, alpha: 1.00), for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        return button
    }()
```

## seperator

A small view which adds an accent that seperates the `titleLabel` and the `button`.

``` swift
var seperator: UIView = {
        let seperator = UIView(frame: .zero)
        seperator.isAccessibilityElement = false
        seperator.backgroundColor = UIColor(red: 0.366, green: 0.364, blue: 0.368, alpha: 1.00)
        seperator.layer.cornerRadius = 2.0
        return seperator
    }()
```

## Methods

## layoutSubviews()

Overriden, lays out the `seperator`

``` swift
open override func layoutSubviews()
```

## removeFromSuperview()

Overriden, posts `snackRemoval` notification.

``` swift
open override func removeFromSuperview()
```
