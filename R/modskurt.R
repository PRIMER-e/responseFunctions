
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
  modskurt(x, H, m, s, 0.5, 0, 1)
}

#' Symmetric Modskurt Stan code.
#'
#' Stan code for the symmetric Modskurt.
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurtp1d0r05_stan[["source_code"]])
modskurtp1d0r05_stan <- get_stan_function("modskurtp1d0r05")


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
  modskurt(x, H, m, s, 0.5, d, 1)
}

#' Symmetric Modskurt with varying flattening / peakedness Stan code.
#'
#' Stan code for the symmetric Modskurt with varying flattening / peakedness.
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurtp1r05_stan[["source_code"]])
modskurtp1r05_stan <- get_stan_function("modskurtp1r05")

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
  modskurt(x, H, m, s, r, 0, 1)
}

#' Asymmetric modskurt Stan code.
#'
#' Stan code for the modskurt with asymmetry
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurtp1d0_stan[["source_code"]])
modskurtp1d0_stan <- get_stan_function("modskurtp1d0")

#' Modskurt with Asymmetry and varied flattening / peakedness.
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
  modskurt(x, H, m, s, r, d, 1)
}

#' Modskurt with Asymmetry and varied flattening / peakedness Stan code.
#'
#' Stan code for the modskurt with asymmetry and varied flattening / peakedness
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurtp1_stan[["source_code"]])
modskurtp1_stan <- get_stan_function("modskurtp1")

#' Modskurt with asymmetry allowing "exaggeration" / large tails
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
  modskurt(x, H, m, s, r, 0, p);
}

#' Modskurt with asymmetry allowing "exaggeration" / large tails Stan code.
#'
#' Stan code for the modskurt with asymmetry allowing "exaggeration" / large tails.
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurtd0_stan[["source_code"]])
modskurtd0_stan <- get_stan_function("modskurtd0")

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

#' Full modskurt Stan code
#'
#' Stan code for the full modskurt function
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(modskurt_stan[["source_code"]])
modskurt_stan <- get_stan_function("modskurt")
