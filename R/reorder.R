#' Reorder Factors
#'
#' Reorder factors with decreasing order.
#'
#' @param x factor
#'
#' @return factor
#' @export
#'
#' @examples
#' a <- as.factor(c(21,23,45,64,12,22,3, 4, 4, 4, 4))
#' reorder(a)
#' b <- as.factor(c("apple", "orange", "banana", "cherry", "orange"))
#' reorder(b)
#'
reorder <- function(x){
	if (is.factor(x)){
		desc_unique <- desc(unique(x))
		desc_level <- abs(sort(desc_unique))
		x_reorder <- factor(x, levels = levels(x)[desc_level])
		return(x_reorder)
	} else{
		stop("Invaild \'x'\ argument")
	}
}
