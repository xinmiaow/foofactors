<!-- README.md is generated from README.Rmd. Please edit that file -->
**NOTE: This is a toy package created for expository purposes. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors.

### Installation

``` r
devtools::install_github("jennybc/foofactors")
```

### Quick demo

Binding two factors via `fbind()`:

``` r
library(foofactors)
#> 
#> Attaching package: 'foofactors'
#> The following object is masked from 'package:stats':
#> 
#>     reorder
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>        x     n
#>   <fctr> <int>
#> 1      a    25
#> 2      b    26
#> 3      c    17
#> 4      d    17
#> 5      e    15
```

Sometimes, character is read as a factor in a wrong way. The unique values of a factor tends to be different from its length; whereas the unique values of character is equal to its length To detect the factor which are supposed to be character, I develop a function `detect_fct()`.

``` r
c <- as.factor(c("yes", "yes", "no", "yes"))
detect_fct(c) #return TRUE
#> [1] TRUE
```

``` r
d <- as.factor(c("Apple", "Banana", "Orange", "Cherry"))
detect_fct(d) #return FALSE
#> [1] FALSE
```

To reorder a factor in a decreasing order, I develop function `reorder()`.

``` r
e <- as.factor(c(21,23,45,64,12,22,3, 4, 4, 4, 4))
levels(e)
#> [1] "3"  "4"  "12" "21" "22" "23" "45" "64"
```

``` r
f <- reorder(e)
levels(f)
#> [1] "64" "45" "23" "22" "21" "12" "4"  "3"
```

Usually, we merely want to encode a vector of data as a factor with the order in which they appear in the data. Hence, based on `factor`, I develop a function `factor_asis()`. By `factor_asis()`, we can set levels to the original order.

``` r
g <- c(1, 2, 3, 14, 0, 7)
factor_asis(g)
#> [1] 1  2  3  14 0  7 
#> Levels: 1 2 3 14 0 7
```
