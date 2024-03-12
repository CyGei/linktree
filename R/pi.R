#' Calculate Pi Values
#'
#' Calculates the within-group transmission proportion
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param levels The factor levels for the groups.
#'
#' @return A numeric vector of pi values.
#' @export
#'
#' @examples
#' from <- c("A", "A", "NA", "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' pi(from, to, levels = c("A", "B", "C"))
#' 
pi <- function(from, to, levels){
  ttab <- ttable(from, to, levels)
  success <- diag(ttab)
  trials <- rowSums(ttab)
  pi <- success / trials
  return(pi)
}