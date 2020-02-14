# MessageViewController

``` swift
public class MessageViewController: UIViewController
```

## Inheritance

`UIViewController`

## Initializers

## init(message:)

``` swift
public init(message: Message)
```

## init(text:image:action:)

``` swift
public convenience init(text: String, image: UIImage? = nil, action: Message.Action? = nil)
```

## init(text:image:actionTitle:actionHandler:)

``` swift
public convenience init(text: String, image: UIImage? = nil, actionTitle: String, actionHandler: @escaping () -> Void)
```

## init?(coder:)

``` swift
public required init?(coder aDecoder: NSCoder)
```

## Methods

## viewDidLoad()

``` swift
override public func viewDidLoad()
```
