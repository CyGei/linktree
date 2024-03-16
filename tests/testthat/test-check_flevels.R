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
