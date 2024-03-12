#' Calculate Gamma Coefficient
#'
#' Computes the tansmission assortativity coefficient.
#' @param pi A numeric value representing the proportion of within-group transmissions.
#' @param f A numeric value representing the relative size of the group.
#'
#' @return The calculated Gamma value.
#' @export
#'
#' @examples
#' gamma(pi = c(0.3, 0.7), f = c(0.5, 0.5))

gamma <- function(pi, f) {
  # Check that pi and f are numeric
  if (!is.numeric(pi) || !is.numeric(f)) {
    stop("'pi' and 'f' must be numeric.")
  }

  # Check that pi is between 0 and 1 (inclusive)
  if (any(pi < 0, pi > 1)) {
    stop("'pi' must be between 0 and 1 (inclusive).")
  }

  # Check that f is between 0 and 1 (exclusive)
  if (any(f <= 0, f >= 1)) {
    stop("'f' must be between 0 and 1, excluding 0 and 1.")
  }

  # Check that pi and f have the same length
  if (length(pi) != length(f)) {
    stop("'pi' and 'f' must have the same length.")
  }

  numerator <- pi * (1 - f)
  denominator <- f * (1 - pi)
  gamma <- numerator / denominator
  return(gamma)
}