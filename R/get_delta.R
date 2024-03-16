#' Calculate delta
#'
#' Computes the scaled tansmission assortativity coefficient, see function \code{\link{gamma2delta}}.
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param f A named numeric value representing the prevalence of each group in the population or directly the group sizes.
#' @param alpha The significance level for the confidence interval.
#'
#' @return A data frame with the estimated delta, lower and upper confidence limits for each group.
#' @export
#'
#' @examples
#' from <- c("A", "A", NA, "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' f <- c(A = 0.3, B = 0.2, C = 0.5)
#' get_delta(from, to, f, alpha = 0.05)
get_delta <- function(from, to, f, alpha = 0.05) {
  check_fromto(from, to)
  check_alpha(alpha)
  pi <- get_pi(from, to, alpha = alpha)
  check_flevels(f, pi$group)

  f <- f[pi$group]
  f <- f / sum(f, na.rm = TRUE)

  delta <- data.frame(
    group = pi$group,
    est = gamma2delta(gamma_formula(pi$est, f)),
    lwr = gamma2delta(gamma_formula(pi$lwr, f)),
    upr = gamma2delta(gamma_formula(pi$upr, f)),
    row.names = NULL
  )

  class(delta) <- c("delta", "linktree", "data.frame")
  return(delta)
}
