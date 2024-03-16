#' Transmission table
#'
#' Generates a contingency table given the 'from' and 'to' vectors.
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param ... Additional arguments to be passed to the 'table' function.
#'
#' @return A contingency table representing the counts of infectors (rows) and infectees (columns) in each group (level).
#' @keywords internal
#' @noRd 
#'
#' @examples
#' \dontrun{
#'from <- c("A", "A", NA, "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' ttable(from, to)
#'}
#' 
ttable <- function(from, to, ...) {
  if (!is.vector(from) || !is.vector(to)) {
    stop("'from' and 'to' must be vectors.")
  }
  if (length(from) != length(to)) {
    stop("'from' and 'to' must be vectors of the same length.")
  }
  
  from <- as.character(from)
  to <- as.character(to)
  levels <- unique(sort(c(from, to)))

  if (length(levels) < 2) {
    stop("There must be at least two group levels in the data")
  }

  from <- factor(from, levels = levels)
  to <- factor(to, levels = levels)
  
  # Generate the contingency table
  ttable <- table(from, to, ...)
  
  return(ttable)
}
