# Simulated transmission tree

This dataset represents a simulated transmission tree. This simulation
was generated using the R package `o2groups` (see
<https://github.com/CyGei/o2groups> for more information). Group `HCW`
is assortative with a gamma coefficient of 2 and group `patient` is
disassortative with a gamma coefficient of 1/1.25. Suceptible group
sizes were 100 and 350, respectively. Code to reproduce the data below:

    pak::pak("CyGei/o2groups")
    set.seed(123)
    sim_tree <- o2groups::simulate_groups(
      duration = 100,
      group_n = 2,
      size = c(100, 350), # susceptible group sizes
      name = c("HCW", "patient"),
      gamma = c(2, 0.8), # assortativity coefficients
      intro_n = c(1, 3),
      r0 = c(2, 2),
      generation_time = c(0, 0.1, 0.2, 0.4, 0.2, 0.1, 0),
      incubation_period = sample(1:14, 1000, replace = TRUE)
    )

## Usage

``` r
sim_tree
```

## Format

A data frame with 373 rows and 6 columns:

- group:

  Character. The group to which the individual belongs.

- id:

  Character. Unique identifier for each individual in the study.

- source:

  Character. The ID of the individual who was the source of infection,
  if known. `NA` indicates an unknown source.

- source_group:

  Character. The group of the source individual. `NA` for unknown
  sources.

- date_infection:

  Numeric. The date of infection. Represented as the number of days
  since the start of the study.

- date_onset:

  Numeric. The date of onset of symptoms. Represented as the number of
  days since the start of the study.

## Source

This dataset is simulated (see R package `o2groups`) and does not
correspond to real-world data.
