context("Factor Asis")

test_that("factor_asis endoce a vector as a factor", {
	x <- c(21,23,45,64,12,22,3, 4, 4, 4, 4)
	y <- c("apple", "orange", "banana", "cherry", "orange")

	xl <- c("21", "23", "45", "64", "12", "22", "3", "4")
	yl <- c("apple", "orange", "banana", "cherry")


	expect_identical(levels(factor_asis(x)), xl)
	expect_identical(levels(factor_asis(y)), yl)
})
