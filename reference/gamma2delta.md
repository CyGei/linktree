# Convert gamma to delta

Convert gamma to delta

## Usage

``` r
gamma2delta(gamma)
```

## Arguments

- gamma:

  A numeric vector of gamma coefficients.

## Value

A numeric vector delta coefficients.

## Examples

``` r
gamma2delta(gamma = c(0,1,10, Inf))
#> [1] -1.0000000  0.0000000  0.8181818  1.0000000
```
