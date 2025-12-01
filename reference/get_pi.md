# Calculate Pi Values

Calculates the within-group transmission proportion 'pi' for each group
in the data.

## Usage

``` r
get_pi(from, to, alpha = 0.05)
```

## Arguments

- from:

  A vector of infectors.

- to:

  A vector of infectees.

- alpha:

  The significance level for the confidence intervals.

## Value

A data frame with the group names and the corresponding 'pi' values and
confidence intervals.

## Examples

``` r
from <- c("A", "A", "NA", "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
get_pi(from, to, alpha = 0.05)
#>   group est        lwr       upr
#> 1     A 0.5 0.01257912 0.9874209
#> 2     B NaN        NaN       NaN
#> 3     C 1.0 0.29240177 1.0000000
#> 4    NA 0.0 0.00000000 0.9750000
```
