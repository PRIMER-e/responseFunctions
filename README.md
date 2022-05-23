
<!-- README.md is generated from README.Rmd. Please edit that file -->

# responseFunctions

<!-- badges: start -->

[![R-CMD-check](https://github.com/PRIMER-e/responseFunctions/workflows/R-CMD-check/badge.svg)](https://github.com/PRIMER-e/responseFunctions/actions)
<!-- badges: end -->

The goal of responseFunctions is to provide a set of useful non-linear
response functions with both R source-code and Stan source-code.

## Installation

You can install the development version of responseFunctions from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("PRIMER-e/responseFunctions")
```

## Example

This is a basic example which shows you how to call both the R version
and Stan version of the ModSkurt function:

``` r
library(responseFunctions)

x <- 500
H <- 1000
m <- 750
s <- 20
r <- 0.75
d <- 50
p <- 1

# Call the R version of ModSkurt.
modskurt(x, H, m, s, r, d, p)
#> [1] 800
 
# Create a Stan model containing ModSkurt.
stan_model_code <- paste("functions {",
                           modskurt_stan[["source_code"]],
                           "}")

# Compile the Stan model.
model_listing <- rstan::stanc(model_code = stan_model_code)

# Expose the Stan ModSkurt function in the compiled model.
stan_function_env <- new.env()
rstan::expose_stan_functions(model_listing, env = stan_function_env)

# Call the Stan version of ModSkurt.
stan_function_env[["modskurt"]](x, H, m, s, r, d, p)
#> [1] 800
```
