context("Detecting factors")

test_that("detect_fct detect factor: TRUE", {
	x <- as.factor(c(1, 3, 1, 1, 2, 5))
	y <- as.factor(c("yes", "yes", "no", "yes"))

	expect_identical(detect_fct(x), TRUE)
	expect_identical(detect_fct(y), TRUE)
})

test_that("detect_fct detect factor: FALSE", {
	x <- as.factor(c(1, 2, 3, 4, 5))
	y <- as.factor(c("Apple", "Banana", "Orange", "Cherry"))


	expect_identical(detect_fct(x), TRUE)
	expect_identical(detect_fct(y), TRUE)
})

test_that("detect_fct detect factor: Invaild input", {
	x <- c(1, 2, 3, 4, 5)
	y <- c("Apple", "Banana", "Orange", "Cherry")


	expect_error(detect_fct(x))
	expect_error(detect_fct(y))
})
