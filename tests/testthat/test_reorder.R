context("Reorder factors")

test_that("reorder order the levels of a factor with a decreasing order", {
	x <- as.factor(c(21,23,45,64,12,22,3, 4, 4, 4, 4))
	y <- as.factor(c("apple", "orange", "banana", "cherry", "orange"))

	xl <- c("64", "45", "23", "22", "21", "12", "4", "3")
	yl <- c("orange", "cherry", "banana", "apple")


	expect_identical(levels(reorder(x)), xl)
	expect_identical(levels(reorder(y)), yl)
})

test_that("reorder: Invaild input", {
	x <- c(21,23,45,64,12,22,3, 4, 4, 4, 4)
	y <- c("apple", "orange", "banana", "cherry", "orange")

	expect_error(reorder(x))
	expect_error(reorder(y))
})
