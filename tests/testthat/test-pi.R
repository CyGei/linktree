# Test for normal input
test_that("pi returns correct values for normal input", {
  from <- c("A", "B", "C")
  to <- c("A", "B", NA)
  pi_values <- pi(from, to, levels = c("A", "B", "C"))
  expected_pi_values <- c(A = 1, B = 1, C = NA) # Manually calculated expected pi values
  expect_equal(pi_values, expected_pi_values)
})


# Test for single-level
test_that("pi throws an error if 'levels' is not a vector", {
  expect_error(pi(c("A", "B"), c("A", "B"), levels = "A"))
})

# Test for 'from' and 'to' vectors of different lengths
test_that("pi throws an error if 'from' and 'to' are of different lengths", {
  expect_error(pi(c("A", "B"), c("A", "B", "C"), levels = c("A", "B", "C")))
})
