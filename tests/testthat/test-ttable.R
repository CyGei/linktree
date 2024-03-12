# Test for normal input
test_that("ttable returns correct contingency table for normal input", {
  from <- c("A", "A", "B", "C", "C", "C")
  to <- c("A", "B", "B", "C", "C", "C")
  result <- ttable(from, to, levels = c("A", "B", "C"))
  expect_equal(dim(result), c(3, 3))
  expect_equal(sum(result), length(from))
})

# Test for different length of 'from' and 'to' vectors
test_that("ttable throws an error if 'from' and 'to' are of different lengths", {
  expect_error(ttable(c("A", "B"), c("A", "B", "C"), levels = c("A", "B", "C")))
})

# Test for less than two levels
test_that("ttable throws an error if there are less than two levels", {
  expect_error(ttable(c("A", "A"), c("A", "A"), levels = c("A")))
})


# Test for NA handling if provided as a level
test_that("ttable handles NA values correctly", {
  from <- c("A", "A", "NA", "C", "C", "C")
  to <- c("A", "B", "B", "C", "C", "C")
  result <- ttable(from, to, levels = c("A", "B", "C", "NA"))
  expect_true(all(c("NA", "A", "B", "C") %in% rownames(result)))
  expect_true(all(c("NA", "A", "B", "C") %in% colnames(result)))
})

# Test for additional arguments
test_that("ttable handles additional arguments", {
  from <- c("A", "A", "B", "C", "C", "C")
  to <- c("A", "B", "B", "C", "C", "C")
  result <- ttable(from, to, levels = c("A", "B", "C"), dnn = c("Infector", "Infectee"))
  expect_equal(dimnames(result), list(Infector = c("A", "B", "C"), Infectee = c("A", "B", "C")))
})
