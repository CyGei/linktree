test_that("check_gamma handles valid and invalid inputs", {
    expect_error(check_gamma(c(-1, 0.5)), "gamma should be non-negative")
    expect_error(check_gamma("a"), "gamma should be a numeric vector")
    expect_silent(check_gamma(c(0, 0.5)))
})