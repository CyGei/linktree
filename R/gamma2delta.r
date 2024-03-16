#' Convert gamma to delta
#'
#' @param gamma A numeric vector of gamma coefficients.
#'
#' @return A numeric vector delta coefficients.
#' @export
#' 
#' @examples
#' gamma2delta(gamma = c(0,1,10, Inf))
#'

gamma2delta <- function(gamma) {
    check_gamma(gamma)
    sapply(gamma, function(g) {
        if (is.infinite(g)) {
            delta <- 1
        } else if (is.na(g)) {
            delta <- NaN
        } else if (is.numeric(g) & is.finite(g)) {
            delta <- (g - 1) / (g + 1)
        }
        return(delta)
    })
}
