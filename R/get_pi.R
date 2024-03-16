#' Calculate Pi Values
#'
#' Calculates the within-group transmission proportion 'pi' for each group in the data.
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param alpha The significance level for the confidence intervals.
#'
#' @return A data frame with the group names and the corresponding 'pi' values and confidence intervals.
#' @export
#'
#' @examples
#' from <- c("A", "A", "NA", "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' get_pi(from, to, alpha = 0.05)
#'
get_pi <- function(from, to, alpha = 0.05) {
  check_fromto(from, to)
  check_alpha(alpha)

  ttab <- ttable(from, to)
  success <- diag(ttab)
  trials <- rowSums(ttab)
  group <- rownames(ttab)
  pi <- binom_test(x = success, n = trials, alpha = alpha)
  return(data.frame(group, pi, row.names = NULL))
}





#' Binomial Test Helper Function
#'
#' This function is a helper function for the `pi()` function. It performs a binomial test on the provided vectors of successes `x` and trials `n`, and calculates the estimated proportion, lower and upper confidence intervals for a significance level `alpha`.
#'
#' @param x A vector of successes.
#' @param n A vector of trials.
#' @param alpha The significance level for the confidence interval calculation. Default is 0.05.
#'
#' @return A matrix with columns for the estimated proportion, lower and upper confidence intervals.
#'
#' @keywords internal
#' @noRd
#' @importFrom stats qbeta
#'
#' @examples
#' x <- c(5, 15, 25)
#' n <- c(10, 20, 30)
#' binom_test(x, n)
#' 
binom_test <- function(x, n, alpha = 0.05) {
  check_xn(x, n)
  check_alpha(alpha)
  
  zvals <- x == 0 & n == 0
  est <- x / n
  lwr <- ifelse(zvals, NaN, qbeta(alpha / 2, x, n - x + 1))
  upr <- ifelse(zvals, NaN, qbeta(1 - alpha / 2, x + 1, n - x))

  return(cbind(est, lwr, upr))
}
