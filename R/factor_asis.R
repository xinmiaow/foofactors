#' Factor Asis
#'
#' Encode a vector as a factor with the order in which they appear in the data
#'
#' @param x a vector of data
#'
#' @return a factor
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 14, 0, 7)
#' factor_asis(x)
#' y <- c("a", "c", "d", "e", "b")
#' factor_asis(y)
#'
factor_asis <- function(x){
	xl <- as.character(unique(x))
	x_new <- factor(x, levels=xl)
	return(x_new)
}
