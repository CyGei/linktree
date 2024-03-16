#' Plot Assortativity Objects
#'
#' Plots error bars for objects of class "assortativity" (with subclasses "gamma" and "delta").
#' The plot includes a horizontal dotted line at y = 1 for subclass "gamma" and y = 0 for subclass "delta", referring to the neutral value.
#'
#' @param x An object of class "assortativity" (with subclass "gamma" or "delta").
#' @param ... Additional arguments passed to the base `plot` function.
#'
#' @examples
#' from <- c("A", "A", NA, "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' f <- c(A = 0.3, B = 0.2, C = 0.5)
#' plot(get_delta(from, to, f))
#' plot(get_gamma(from, to, f))
#'
#' @method plot assortativity
#' @export
#' @importFrom graphics abline arrows axis
#'

plot.assortativity <- function(x, ...) {
  groups <- x$group
  est <- ifelse(is.infinite(x$est), 1000, x$est)
  lwr <- ifelse(is.infinite(x$lwr), 1000, x$lwr)
  upr <- ifelse(is.infinite(x$upr), 1000, x$upr)
  x_values <- 1:length(groups)

  subclass <- class(x)[1]
  if (subclass == "gamma") {
    ylab <- "Gamma"
    ymax <- max(upr, na.rm = TRUE)
    ymax <- ifelse(ymax > 100, 100, ymax)
    ylim <- c(0, ymax)
  } else if (subclass == "delta") {
    ylab <- "Delta"
    ylim <- c(-1, 1)
  }

  plot(x_values, est, xlim = c(0.5, length(groups) + 0.5),
       ylim = ylim,
       xaxt = "n", xlab = "Group", ylab = ylab, pch = 16, ...)

  arrows(x_values, lwr, x_values, upr,
         angle = 90, code = 3, length = 0.1)

  axis(1, at = x_values, labels = groups)

  # Add a horizontal dotted line based on the subclass
  if (subclass == "gamma") {
    abline(h = 1, lty = 3)
  } else if (subclass == "delta") {
    abline(h = 0, lty = 3)
  }
}

