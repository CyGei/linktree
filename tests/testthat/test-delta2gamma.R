test_that("delta2gamma converts correctly", {
    delta_values <- c(-1, -0.5, 0, 0.5, 1)
    gamma_values <- c(0, 1/3, 1, 3, Inf)
    expect_equal(delta2gamma(delta_values), gamma_values)
})