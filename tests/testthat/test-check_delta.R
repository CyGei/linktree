test_that("check_delta handles valid and invalid inputs", {
    expect_error(check_delta(c(-2, 0.5)), "delta should be between -1 and 1")
    expect_error(check_delta("a"), "delta should be a numeric vector")
    expect_silent(check_delta(c(-0.5, 0.5)))
})