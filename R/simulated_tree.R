#'Simulated transmission tree
#' A simulated transmission tree generated from the `o2groups` package.
#'
#' This dataset represents a simulated infection transmission tree, capturing the spread of an infectious disease within groups.
#' This simulation was generated using the R package `o2groups` (see \url{https://github.com/CyGei/o2groups} for more information).
#' Group `A` is assortative with a delta coefficient of 0.75 and group `B` is neutral with a delta coefficient of 0.
#' Both group sizes were set at 100 individuals.
#'
#' @format A data frame with 151 rows and 6 columns:
#' \describe{
#'   \item{group}{Character. The group to which the individual belongs.}
#'   \item{id}{Character. Unique identifier for each individual in the study.}
#'   \item{source}{Character. The ID of the individual who was the source of infection, if known. `NA` indicates an unknown source.}
#'   \item{source_group}{Character. The group of the source individual. `NA` for unknown sources.}
#'   \item{date_infection}{Numeric. The date of infection. Represented as the number of days since the start of the study.}
#'   \item{date_onset}{Numeric. The date of onset of symptoms. Represented as the number of days since the start of the study.}
#' }
#' @source This dataset is simulated (see R package `o2groups`) and does not correspond to real-world data.
"simulated_tree"
