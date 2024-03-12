
# Test for normal input
test_that("gamma returns correct value for normal input", {
  expect_equal(gamma(pi = c(0.5, 0.5), f = c(0.5, 0.5)), c(1, 1))
})

# Test for pi not numeric
test_that("gamma throws an error if pi is not numeric", {
  expect_error(gamma(pi = c("a", "b"), f = c(0.5, 0.5)))
})

# Test for f not numeric
test_that("gamma throws an error if f is not numeric", {
  expect_error(gamma(pi = c(0.3, 0.7), f = c("a", "b")))
})

# Test for pi out of range
test_that("gamma throws an error if pi is out of [0,1] range", {
  expect_error(gamma(pi = c(-0.1, 1.1), f = c(0.5, 0.5)))
})

# Test for f out of range (including 0 and 1)
test_that("gamma throws an error if f is not in (0,1) range", {
  expect_error(gamma(pi = c(0.3, 0.7), f = c(0, 1)))
  expect_error(gamma(pi = c(0.3, 0.7), f = c(-0.1, 1.1)))
})
