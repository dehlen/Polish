# FormViewController

``` swift
public class FormViewController: UITableViewController
```

## Inheritance

`UITableViewController`

## Methods

## viewDidLoad()

``` swift
override public func viewDidLoad()
```

## viewDidAppear(\_:)

``` swift
override public func viewDidAppear(_ animated: Bool)
```

## numberOfSections(in:)

``` swift
override public func numberOfSections(in tableView: UITableView) -> Int
```

## tableView(\_:numberOfRowsInSection:)

``` swift
override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

## tableView(\_:cellForRowAt:)

``` swift
override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

## tableView(\_:shouldHighlightRowAt:)

``` swift
override public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool
```

## tableView(\_:titleForFooterInSection:)

``` swift
override public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?
```

## tableView(\_:didSelectRowAt:)

``` swift
override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```
