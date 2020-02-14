# ListSelectionResponse

``` swift
public struct ListSelectionResponse: OptionSet
```

## Inheritance

`OptionSet`

## Initializers

## init(rawValue:)

``` swift
public init(rawValue: Int)
```

## Properties

## none

``` swift
let none = ListSelectionResponse(rawValue: 0)
```

## deselect

``` swift
let deselect = ListSelectionResponse(rawValue: 1 << 0)
```

## reload

``` swift
let reload = ListSelectionResponse(rawValue: 1 << 1)
```

## rawValue

``` swift
let rawValue: Int
```
