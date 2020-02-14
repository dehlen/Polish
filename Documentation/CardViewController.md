# CardViewController

Use like:

``` swift
public class CardViewController: UIViewController
```

``` 
@objc private func presentCard() {
   let card = Card(title: "", message: "", action: CardAction(title: "", action: {}))
   let viewController = CardViewController(card: card)
   present(viewController, animated: true, completion: nil)
}
```

## Inheritance

`UIViewController`, `UIViewControllerTransitioningDelegate`

## Initializers

## init(card:)

``` swift
public init(card: Card)
```

## Methods

## viewDidLoad()

``` swift
override public func viewDidLoad()
```

## presentationController(forPresented:presenting:source:)

``` swift
public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
```
