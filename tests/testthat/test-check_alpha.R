test_that("check_alpha handles valid and invalid inputs", {
    expect_error(check_alpha(-0.1), "alpha should be a numeric value between 0 and 1")
    expect_error(check_alpha(1.1), "alpha should be a numeric value between 0 and 1")
    expect_silent(check_alpha(0.5))
})