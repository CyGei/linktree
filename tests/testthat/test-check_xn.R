test_that("check_xn handles valid and invalid inputs", {
    expect_error(check_xn(c(1, 2), c(1, NA)), "x and n must not contain NAs")
    expect_error(check_xn(c(1, 2), c(1, -1)), "x and n must be non-negative")
    expect_error(check_xn(c(3, 2), c(2, 2)), "x must be less than or equal to n")
    expect_silent(check_xn(c(1, 2), c(2, 3)))
    expect_silent(check_xn(c(0, 2), c(0, 3)))
})