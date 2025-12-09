# Plot linktree objects

Plots error bars for objects of class `linktree` (with subclasses
`gamma`, `delta`, or `pi`). The method displays point estimates with
confidence intervals for each group. A horizontal dotted line is added
at the neutral value: y = 1 for subclass `gamma` and y = 0 for subclass
`delta`.

## Usage

``` r
# S3 method for class 'linktree'
plot(x, ...)
```

## Arguments

- x:

  An object of class `linktree` (with subclasses `gamma`, `delta`, or
  `pi`).

- ...:

  Additional arguments passed to the base
  [`plot`](https://rdrr.io/r/graphics/plot.default.html) function.

## Value

No return value, called for side effects (produces a plot).

## Examples

``` r
from <- c("A", "A", NA, "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
f <- c(A = 0.3, B = 0.2, C = 0.5)
plot(get_delta(from, to, f))

plot(get_gamma(from, to, f))

```
