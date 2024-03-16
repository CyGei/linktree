#' Convert delta to gamma
#'
#'
#' @param delta A numeric vector of delta coefficients.
#'
#' @return A numeric vector of the corresponding gamma coefficients.
#' @export
#' 
#' @examples
#' delta2gamma(delta = c(-1,0,1))
#'
delta2gamma <- function(delta) {
    check_delta(delta)
    return((1 + delta)/(1 - delta))
}
