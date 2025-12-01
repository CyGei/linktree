# Plot linktree objects

Plots error bars for objects of class "linktree" (with subclasses
"gamma", "delta" or "pi"). The plot includes a horizontal dotted line at
y = 1 for subclass "gamma" and y = 0 for subclass "delta", referring to
the neutral value.

## Usage

``` r
# S3 method for class 'linktree'
plot(x, ...)
```

## Arguments

- x:

  An object of class "linktree" (with subclass "gamma" or "delta").

- ...:

  Additional arguments passed to the base `plot` function.

## Examples

``` r
from <- c("A", "A", NA, "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
f <- c(A = 0.3, B = 0.2, C = 0.5)
plot(get_delta(from, to, f))

plot(get_gamma(from, to, f))

```
