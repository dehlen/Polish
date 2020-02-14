# baseTextFieldStyle

## baseTextFieldStyle

``` swift
let baseTextFieldStyle: (UITextField) -> Void = {
    $0.font = UIFont.preferredFont(forTextStyle: .body)
    $0.borderStyle = .none
    $0.clearButtonMode = .whileEditing
    $0.autocorrectionType = .no
}
```
