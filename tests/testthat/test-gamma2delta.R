test_that("gamma2delta converts correctly", {
    gamma_values <- c(0, 1/3, 1, 3, Inf)
    delta_values <- c(-1, -0.5, 0, 0.5, 1)
    expect_equal(gamma2delta(gamma_values), delta_values)
})