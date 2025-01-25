#' Check 'from' and 'to' vectors
#' @param from A vector of infectors.
#' @param to A vector of infectees
#' @keywords internal
check_fromto <- function(from, to) {
if (!is.vector(from) || !is.vector(to)) {
    stop("'from' and 'to' must be vectors.")
  }
  if (length(from) != length(to)) {
    stop("'from' and 'to' must be vectors of the same length.")
  }
}
#' Check 'f' levels
#' @param f A named numeric vector with non-negative values.
#' @param levels The groups in the data.
#' @keywords internal
check_flevels <- function(f, levels) {
  if (!is.numeric(f) || is.null(names(f)) || any(f < 0)) {
    stop("f should be a named numeric vector with non-negative values")
  }
  if(length(unique(names(f))) != length(names(f))) {
    stop("The names of f should be unique")
  }
  if(length(f) < 2) {
    stop("f should have at least two groups")
  }
  if(length(f) < length(levels)){
    stop("There are more groups in the data than in f")
  }
  if (!all(levels %in% names(f))) {
    stop("Groups in the data are not present in f")
  }
}

#' Check 'alpha' value
#' @param alpha A numeric value between 0 and 1.
#' @keywords internal

check_alpha <- function(alpha) {
  if (!is.numeric(alpha) || alpha < 0 || alpha > 1) {
    stop("alpha should be a numeric value between 0 and 1")
  }
}

#' Check 'x' and 'n' values
#' @param x Number of successes.
#' @param n Number of trials.
#' @keywords internal

check_xn <- function(x, n) {
  if (any(x < 0, na.rm = TRUE) || any(n < 0, na.rm = TRUE)) {
    stop("x and n must be non-negative")
  }
  if (any(is.na(x)) || any(is.na(n))) {
    stop("x and n must not contain NAs")
  }
  if (length(x) != length(n)) {
    stop("x and n must be the same length")
  }
  if (any(x > n)) {
    stop("x must be less than or equal to n")
  }
}

#' Check 'delta' value
#' @param delta A numeric vector between -1 and 1.
#' @keywords internal
check_delta <- function(delta){
  if (!is.numeric(delta)) {
    stop("delta should be a numeric vector")
  }
  if (any(delta < -1) || any(delta > 1)) {
    stop("delta should be between -1 and 1")
  }
}

#' Check 'gamma' value
#' @param gamma A numeric vector with non-negative values.
#' @keywords internal
check_gamma <- function(gamma){
  if (!is.numeric(gamma)) {
    stop("gamma should be a numeric vector")
  }
  if (any(gamma < 0, na.rm = TRUE)) {
    stop("gamma should be non-negative")
  }
}
