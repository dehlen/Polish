# ToastViewController

Use like:

``` swift
public class ToastViewController: UIViewController
```

``` 
private func presentToast(title: String) {
   let toast = ToastViewController(title: title)
   present(toast, animated: true)
 
   Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
       toast.dismiss(animated: true)
   }
}
```

## Inheritance

`UIViewController`, `UIViewControllerTransitioningDelegate`

## Initializers

## init(title:)

``` swift
public init(title: String)
```

## Methods

## presentationController(forPresented:presenting:source:)

``` swift
public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
```
