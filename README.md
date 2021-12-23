
<!-- README.md is generated from README.Rmd. Please edit that file -->

# responseFunctions

<!-- badges: start -->

[![R-CMD-check](https://github.com/PRIMER-e/responseFunctions/workflows/R-CMD-check/badge.svg)](https://github.com/PRIMER-e/responseFunctions/actions)
<!-- badges: end -->

The goal of responseFunctions is to provide a set of useful non-linear
response functions.

## Installation

You can install the development version of responseFunctions from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("PRIMER-e/responseFunctions")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(responseFunctions)

modskurt(x = 500,
         H = 1000,
         m = 750,
         s = 20,
         r = 0.75,
         d = 50,
         p = 1)
#> [1] 800
```
