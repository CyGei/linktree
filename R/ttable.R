#' Transmission Table Function
#'
#' Generates a contingency table given the 'from' and 'to' vectors and their specified 'levels'.
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param levels The factor levels for the groups.
#' @param ... Additional arguments to be passed to the 'table' function.
#'
#' @return A contingency table representing the counts of infectors (rows) and infectees (columns) in each group (level).
#' @keywords internal
#' @noRd 
#'
#' @examples
#' \dontrun{
#' from <- c("A", "A", "NA", "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' ttable(from, to, levels = c("A", "B", "C"))
#'}
#' 
ttable <- function(from, to, levels, ...) {
  if (!is.vector(levels)) {
    stop("'levels' must be a vector.")
  }
  if (length(levels) < 2) {
    stop("There must be at least two levels")
  }
  if (length(from) != length(to)) {
    stop("'from' and 'to' must be vectors of the same length.")
  }

  from <- factor(from, levels = levels)
  to <- factor(to, levels = levels)
  ttable <- table(from, to, ...)
  return(ttable)
}
