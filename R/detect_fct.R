#' Detect Factors
#'
#' Detect factors that should be character because the number of unique values of a factor is equal to its length
#'
#' @param x factor
#'
#' @return (logical) \code{TRUE} or \code{FALSE}. \code{TRUE} if the length of x is not equal to the length of \code{unique(x)};
#' otherwise, \code{FALSE}
#' @export
#'
#' @examples
#' a <- as.factor(c("yes", "yes", "no", "yes"))
#' detect_fct(a)  # TRUE
#' b <- as.factor(c("Apple", "Banana", "Orange", "Cherry"))
#' detect_fct(b)  # FALSE
#'
detect_fct <- function(x){
	if (is.factor(x)){
		if (length(unique(x))==length(x)){
			return(FALSE)
		} else{
			return(TRUE)
		}
	} else{
		stop("Sorry, this function amis to detect factors. The input you provided is ", class(x))
	}
}
