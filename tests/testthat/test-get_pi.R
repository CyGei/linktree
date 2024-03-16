test_that("get_pi calculates correct values", {
    from <- c("A", "A", "B", "C")
    to <- c("B", "B", "C", "C")
    result <- get_pi(from, to, 0.05)
    expect_true(all(result$group %in% c("A", "B", "C")))

    from <- c("A", "A", "B", "B")
    to <- c("B", "B", "A", "A")
    result <- get_pi(from, to, 0.05)$est
    expect_equal(result, c(0, 0))

    from <- c("A", "A", "B", "B")
    to <- from
    result <- get_pi(from, to, 0.05)$est
    expect_equal(result, c(1, 1))

    from <- c("A", "A", "B", "B")
    to <- from
    result_lowalpha <- get_pi(from, to, 0.05)$est
    result_highalpha <- get_pi(from, to, 0.5)$est
    expect_true(all(result_lowalpha <= result_highalpha))
})