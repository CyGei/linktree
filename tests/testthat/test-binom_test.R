test_that("binom_test calculates correct values", {
    x <- c(5, 15, 25)
    n <- c(10, 20, 30)
    result <- binom_test(x, n)
    expect_equal(dim(result), c(3, 3))
})