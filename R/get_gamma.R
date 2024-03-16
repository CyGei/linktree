#' Calculate gamma
#'
#' Computes the tansmission assortativity coefficient defined as the excess probability of a secondary infection taking place within-group compared to random expectations.
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param f A named numeric value representing the prevalence of each group in the population or directly the group sizes.
#' @param alpha The significance level for the confidence interval.
#'
#' @return A data frame with the estimated gamma, lower and upper confidence limits for each group.
#' @export
#'
#' @examples
#' from <- c("A", "A", NA, "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' f <- c(A = 0.3, B = 0.2, C = 0.5)
#' get_gamma(from, to, f, alpha = 0.05)
get_gamma <- function(from, to, f, alpha = 0.05) {
  check_fromto(from, to)
  check_alpha(alpha)
  pi <- get_pi(from, to, alpha = alpha)
  check_flevels(f, pi$group)

  f <- f[pi$group]
  f <- f / sum(f, na.rm = TRUE)

  gamma <- data.frame(
    group = pi$group,
    est = gamma_formula(pi$est, f),
    lwr = gamma_formula(pi$lwr, f),
    upr = gamma_formula(pi$upr, f),
    row.names = NULL
  )

  class(gamma) <- c("gamma", "assortativity", "data.frame")
  return(gamma)
}

gamma_formula <- function(pi, f) {
  numerator <- pi * (1 - f)
  denominator <- f * (1 - pi)
  return(numerator / denominator)
}
