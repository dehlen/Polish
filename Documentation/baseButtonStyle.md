# baseButtonStyle

## baseButtonStyle

``` swift
let baseButtonStyle: (UIButton) -> Void = {
    $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    $0.titleLabel?.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16, weight: .medium))
}
```
