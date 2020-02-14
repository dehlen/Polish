# ListViewController

Example see [TDItemListCoordinator.swift](https://github.com/davedelong/MVCTodo/blob/master/MVCTodo/Item%20List/TDItemListCoordinator.swift)

``` swift
public class ListViewController: UIViewController
```

## Inheritance

`UIViewController`, `UITableViewDataSource`, `UITableViewDelegate`

## Initializers

## init(content:)

``` swift
public init(content: Array<UIViewController> = [])
```

## init?(coder:)

``` swift
public required init?(coder aDecoder: NSCoder)
```

## Properties

## content

``` swift
var content: Array<UIViewController>
```

## listDelegate

``` swift
var listDelegate: ListViewControllerDelegate?
```

## Methods

## loadView()

``` swift
override public func loadView()
```

## viewDidLoad()

``` swift
override public func viewDidLoad()
```

## numberOfSections(in:)

``` swift
public func numberOfSections(in tableView: UITableView) -> Int
```

## tableView(\_:numberOfRowsInSection:)

``` swift
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

## tableView(\_:cellForRowAt:)

``` swift
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

## tableView(\_:didSelectRowAt:)

``` swift
public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

## tableView(\_:trailingSwipeActionsConfigurationForRowAt:)

``` swift
public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
```
