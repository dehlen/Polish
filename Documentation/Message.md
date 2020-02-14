# Message

``` swift
public struct Message
```

## Nested Types

  - [Message.Action](Message_Action)

## Initializers

## init(text:image:action:)

``` swift
public init(text: String, image: UIImage? = nil, action: Action? = nil)
```

## init(text:image:actionTitle:actionHandler:)

``` swift
public init(text: String, image: UIImage? = nil, actionTitle: String, actionHandler: @escaping () -> Void)
```
