# Layout

``` swift
public indirect enum Layout
```

## Enumeration Cases

## view

``` swift
case view(: UIView, : Layout)
```

## space

``` swift
case space(: Width, : Layout)
```

## box

``` swift
case box(contents: Layout, : Width, wrapper: UIView?, : Layout)
```

## newline

``` swift
case newline(space: CGFloat, : Layout)
```

## choice

``` swift
case choice(: Layout, : Layout)
```

## empty

``` swift
case empty
```

## Properties

## centered

``` swift
var centered: Layout
```

## Methods

## apply(containerWidth:)

``` swift
func apply(containerWidth: CGFloat) -> [UIView]
```

## computeLines(containerWidth:currentX:)

``` swift
func computeLines(containerWidth: CGFloat, currentX: CGFloat) -> [Line]
```

## or(\_:)

``` swift
func or(_ other: Layout) -> Layout
```

## box(wrapper:width:)

``` swift
func box(wrapper: UIView? = nil, width: Width = .basedOnContents) -> Layout
```
