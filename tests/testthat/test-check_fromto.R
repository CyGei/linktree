test_that("check_fromto handles valid and invalid inputs", {
    expect_error(check_fromto(1:3, 1:2), "'from' and 'to' must be vectors of the same length.")
    expect_error(check_fromto(1:3, "a"), "'from' and 'to' must be vectors of the same length.")
    expect_error(check_fromto("a", 1:3), "'from' and 'to' must be vectors of the same length.")
    expect_silent(check_fromto(1:3, 2:4))
    expect_silent(check_fromto(1:3, rep("a", 3)))
})