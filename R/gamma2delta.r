#' Convert Gamma to Delta
#'
#' Converts a gamma value to a delta value.
#'
#' @param gamma A numeric value representing the gamma parameter.
#'
#' @return A numeric value representing the delta parameter.
#' @export
#' 
#' @examples
#' gamma2delta(gamma = c(0,1,10, Inf))
#'

gamma2delta <- function(gamma) {
    result <- ifelse(is.infinite(gamma), 1, ifelse(is.na(gamma),
        NA, ifelse(is.numeric(gamma) & is.finite(gamma),
            (gamma - 1) / (gamma + 1), gamma
        )
    ))
    return(result)
}
