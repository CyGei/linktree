test_that("check_alpha handles valid and invalid inputs", {
  expect_error(check_alpha(-0.1), "alpha should be a numeric value between 0 and 1")
  expect_error(check_alpha(1.1), "alpha should be a numeric value between 0 and 1")
  expect_silent(check_alpha(0.5))
})


test_that("check_delta handles valid and invalid inputs", {
  expect_error(check_delta(c(-2, 0.5)), "delta should be between -1 and 1")
  expect_error(check_delta("a"), "delta should be a numeric vector")
  expect_silent(check_delta(c(-0.5, 0.5)))
})


test_that("check_flevels handles valid and invalid inputs", {
  # Test for non-numeric or unnamed vector, or negative values
  expect_error(check_flevels(c(A = -1, B = 2), c("A", "B")), "f should be a named numeric vector with non-negative values")
  expect_error(check_flevels(c(1, 2), c("A", "B")), "f should be a named numeric vector with non-negative values")

  # Test for unique names
  expect_error(check_flevels(c(A = 1, A = 2), c("A", "B")), "The names of f should be unique")

  # Test for minimum number of groups in f
  expect_error(check_flevels(c(A = 1), c("A", "B")), "f should have at least two groups")

  # Test for more groups in the data than in f
  expect_error(check_flevels(c(A = 1, B = 2), c("A", "B", "C")), "There are more groups in the data than in f")

  # Test for groups in data not present in f
  expect_error(check_flevels(c(A = 1, B = 2), c("A", "C")), "Groups in the data are not present in f")

  # Test for valid input
  expect_silent(check_flevels(c(A = 1, B = 2), c("A", "B")))
})


test_that("check_fromto handles valid and invalid inputs", {
  expect_error(check_fromto(1:3, 1:2), "'from' and 'to' must be vectors of the same length.")
  expect_error(check_fromto(1:3, "a"), "'from' and 'to' must be vectors of the same length.")
  expect_error(check_fromto("a", 1:3), "'from' and 'to' must be vectors of the same length.")
  expect_silent(check_fromto(1:3, 2:4))
  expect_silent(check_fromto(1:3, rep("a", 3)))
})

test_that("check_gamma handles valid and invalid inputs", {
  expect_error(check_gamma(c(-1, 0.5)), "gamma should be non-negative")
  expect_error(check_gamma("a"), "gamma should be a numeric vector")
  expect_silent(check_gamma(c(0, 0.5)))
})

test_that("check_xn handles valid and invalid inputs", {
  expect_error(check_xn(c(1, 2), c(1, NA)), "x and n must not contain NAs")
  expect_error(check_xn(c(1, 2), c(1, -1)), "x and n must be non-negative")
  expect_error(check_xn(c(3, 2), c(2, 2)), "x must be less than or equal to n")
  expect_silent(check_xn(c(1, 2), c(2, 3)))
  expect_silent(check_xn(c(0, 2), c(0, 3)))
})