
#' Symmetric Modskurt
#'
#' @param x Environmental variable
#' @param H Height of the mode
#' @param m Location of the mode
#' @param s Spread
#'
#' @return Value at x, given the other parameters.
#' @export
modskurtp1d0r05 <- function(x, H, m, s) {
  modskurt_meanfunction(x, H, m, s, 0.5, 0, 1)
}



#' Symmetric Modskurt with varying flattening / peakedness
#'
#' @param x Environmental variable
#' @param H Height of the mode
#' @param m Location of the mode
#' @param s Spread
#' @param d Flatness
#'
#' @return Value at x, given the other parameters.
#' @export
modskurtp1r05 <- function(x, H, m, s, d) {
  modskurt_meanfunction(x, H, m, s, 0.5, d, 1)
}

#' Asymetric Modskurt
#'
#' @param x Environmental variable
#' @param H Height of the mode
#' @param m Location of the mode
#' @param s Spread
#' @param r Skewness
#'
#' @return Value at x, given the other parameters.
#' @export
modskurtp1d0 <- function(x, H, m, s, r) {
  modskurt_meanfunction(x, H, m, s, r, 0, 1)
}

#' Asymetric with varied flattening / peakedness
#'
#' @param x Environmental variable
#' @param H Height of the mode
#' @param m Location of the mode
#' @param s Spread
#' @param r Skewness
#' @param d Flatness
#'
#' @return Value at x, given the other parameters.
#' @export
modskurtp1 <- function(x, H, m, s, r, d) {
  modskurt_meanfunction(x, H, m, s, r, d, 1)
}

#' Asymetric allowing "exaggeration" / large tails
#'
#' @param x Environmental variable
#' @param H Height of the mode
#' @param m Location of the mode
#' @param s Spread
#' @param r Skewness
#' @param p Pointyness
#'
#' @return Value at x, given the other parameters.
#' @export
modskurtd0 <- function (x, H, m, s, r, p) {
  modskurt_meanfunction(x, H, m, s, r, 0, p);
}

#' Full modskurt
#'
#' @param x Environmental variable
#' @param H Height of the mode
#' @param m Location of the mode
#' @param s Spread
#' @param r Skewness
#' @param d Flatness
#' @param p Pointyness
#'
#' @return Value at x, given the other parameters.
#' @export
modskurt <- function(x, H, m, s, r, d, p) {
  H / (r * exp(((x - m)/(r * s) - d) / p) +
         (1 - r) * exp(- ((x - m)/((1 - r) * s) + d) / p) - exp(- d / p) + 1) ^ p
}

#' Modskurt Stan Code
#'
#' Stan code for the full modskurt function
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurt[["source_code"]])
modskurt_stan <- get_stan_function("modskurt")
