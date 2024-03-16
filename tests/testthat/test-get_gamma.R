test_that("get_gamma calculates correct values", {
    from <- c("A", "A", "B", "C")
    to <- c("B", "B", "C", "C")
    f <- c(A = 0.3, B = 0.2, C = 0.5)
    result <- get_gamma(from, to, f, 0.05)
    expect_true(all(result$group %in% c("A", "B", "C")))


    from <- c("A", "A", "B", "B")
    to <- from
    f <- c(A = 0.5, B = 0.5)
    result <- get_gamma(from, to, f, 0.05)$est
    expect_equal(result, c(Inf, Inf))

    from <- c("A", "A", "B", "B")
    to <- c("B", "B", "A", "A")
    f <- c(A = 0.5, B = 0.5)
    result <- get_gamma(from, to, f, 0.05)$est
    expect_equal(result, c(0, 0))

    from <- c("A", "A", "B", "B")
    to <- c("B", "A", "A", "B")
    f <- c(A = 0.5, B = 0.5)
    result <- get_gamma(from, to, f, 0.05)$est
    expect_equal(result, c(1, 1))
})