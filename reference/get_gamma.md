# Calculate gamma

Computes the tansmission assortativity coefficient defined as the excess
probability of a secondary infection taking place within-group compared
to random expectations.

## Usage

``` r
get_gamma(from, to, f, alpha = 0.05)
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

A data frame with the estimated gamma, lower and upper confidence limits
for each group.

## Examples

``` r
from <- c("A", "A", NA, "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
f <- c(A = 0.3, B = 0.2, C = 0.5)
get_gamma(from, to, f, alpha = 0.05)
#>   group      est        lwr      upr
#> 1     A 2.333333 0.02972519 183.1593
#> 2     B      NaN        NaN      NaN
#> 3     C      Inf 0.41323136      Inf
```
