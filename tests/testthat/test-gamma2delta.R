
# Test for normal numeric input
test_that("gamma2delta returns expected delta", {
  expect_equal(gamma2delta(c(0, 1, Inf)), c(-1, 0, 1))
})

# Test for NA gamma
test_that("gamma2delta returns NA for NA gamma", {
  expect_true(is.na(gamma2delta(NA)))
})
