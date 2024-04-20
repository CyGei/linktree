
<!-- README.md is generated from README.Rmd. Please edit that file -->

# linktree

<!-- badges: start -->
<!-- badges: end -->

The goal of `linktree` is to estimate the transmission assorativity
coefficient. More information
[here](https://www.medrxiv.org/content/10.1101/2024.03.13.24304225v1).

## Understanding the transmission assortativity coefficient

`linktree` leverages transmission chain data to estimate group
transmission assortativity; this quantifies the extent to which
individuals transmit within their own group compared to other groups.

### Gamma

$\gamma$ is defined as the excess probability of a secondary infection
taking place within-group compared to random expectation. $\gamma$
values range from 0 (fully disassortative) to $\infty$ (fully
assortative), with 1 indicating homogeneous patterns. For instance,
$\gamma_a = 2$ indicates that an infected individual from group $a$ is
twice as likely to infect an individual from the same group compared to
infecting an individual from another group.

### Delta

To simplify interpretation, we introduce a rescaled parameter $\delta$,
ranging between -1 (fully disassortative) and 1 (fully assortative),
with 0 indicating homogeneous patterns.

We can visualise the relationship between $\gamma$ and $\delta$:

``` r
pacman::p_load_gh("CyGei/linktree")

delta <- seq(-1, 1, 0.1)
gamma <- delta2gamma(delta)
plot(gamma, delta, type = "l")
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" style="display: block; margin: auto;" />

### Estimation

`get_gamma` and `get_delta` estimate $\gamma$ and $\delta$ from a
transmission tree. It requires the following inputs:

- `from`: a vector of infector’s group (e.g. age group, sex, vaccination
  status, etc.)

- `to`: a vector of infectee’s group

- `f`: a named vector of the groups’ sizes or relative sizes
  (i.e. proportion of the population in each group).

## Example

### Data

We can simulate an outbreak with multiple groups using the
[`o2groups`](https://github.com/CyGei/o2groups) package and then use
`linktree` to estimate the assortativity coefficients from the
transmission tree.

``` r
pacman::p_load_gh("CyGei/o2groups")
true_gamma <- c(2, 0.8) # assortativity coefficients

set.seed(123)
sim <- simulate_groups(
  duration = 100,
  group_n = 2,
  size = c(100, 400),
  name = c("HCW", "patient"),
  gamma = true_gamma,
  intro_n = c(1, 3),
  r0 = c(1.7, 2),
  generation_time = c(0, 0.1, 0.2, 0.4, 0.2, 0.1, 0),
  incubation_period = sample(1:14, 1000, replace = TRUE)
)
head(sim)
#>     group     id source source_group date_infection date_onset
#> 1     HCW HmPsw2   <NA>         <NA>              0          2
#> 2 patient WtYSxS   <NA>         <NA>              0          5
#> 3 patient gZ6tF2   <NA>         <NA>              0         13
#> 4 patient Kxtgdz   <NA>         <NA>              0         12
#> 5 patient aH9xtg Kxtgdz      patient              1         14
#> 6     HCW DJE8PP gZ6tF2      patient              2         15
```

### Visualise the transmission tree

``` r
pacman::p_load_gh("reconhub/epicontacts@timeline")
pacman::p_load(dplyr, ggplot2)

ttree <- make_epicontacts(
  linelist = select(sim, c(group, id, date_infection, date_onset)),
  contacts = select(sim, c(source, id, source_group, group)),
  id = "id",
  from = "source",
  to = "id",
  directed = TRUE
) %>%
  plot(
  x_axis = "date_onset",
  node_size = 2,
  node_color = "group",
  edge_color = "source_group",
  method = "ggplot"
  ) +
  scale_colour_manual(values = c("orange", "purple"),
                      guide = "none") +
  scale_fill_manual(values = c("orange", "purple")) +
  labs(title = "Transmission tree", x = "Date of onset", y = "")

ttree
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" style="display: block; margin: auto;" />

### Estimate the transmission assortativity coefficient

``` r
est_delta <- get_delta(
  from = sim$source_group,
  to = sim$group,
  f = c("HCW" = 100, "patient" = 400)
)
true_delta <- gamma2delta(true_gamma)

plot(est_delta)+
abline(h = true_delta, col = c("orange", "purple"), lty = 2)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" style="display: block; margin: auto;" />

    #> integer(0)

For more information regarding when to estimate transmission
assortativity, click on this
[link](https://www.medrxiv.org/content/10.1101/2024.03.13.24304225v1).
