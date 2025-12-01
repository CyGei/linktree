# Calculate delta

Computes the scaled tansmission assortativity coefficient, see function
[`gamma2delta`](https://cygei.github.io/linktree/reference/gamma2delta.md).

## Usage

``` r
get_delta(from, to, f, alpha = 0.05)
```

## Arguments

- from:

  A vector of infectors.

- to:

  A vector of infectees.

- f:

  A named numeric value representing the prevalence of each group in the
  population or directly the group sizes.

- alpha:

  The significance level for the confidence interval.

## Value

A data frame with the estimated delta, lower and upper confidence limits
for each group.

## Examples

``` r
from <- c("A", "A", NA, "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
f <- c(A = 0.3, B = 0.2, C = 0.5)
get_delta(from, to, f, alpha = 0.05)
#>   group est        lwr       upr
#> 1     A 0.4 -0.9422658 0.9891398
#> 2     B NaN        NaN       NaN
#> 3     C 1.0 -0.4151965 1.0000000
```
