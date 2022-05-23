#' Mixture of two Gaussian functions.
#'
#' R version.
#' \deqn{f(x; H_1, H_2, m_1, m_2, s_1, s_2) =
#'       H_1 \exp \left( -\frac{1}{2} \left( \frac{x - m_1}{s_1} \right) ^ 2 \right) +
#'       H_2 \exp \left( -\frac{1}{2} \left( \frac{x - m_2}{s_2} \right) ^ 2 \right)}{}
#'
#' @param x Environmental variable
#' @param H1 Height of the first Gaussian
#' @param H2 Height of the second Gaussian
#' @param m1 Mode of the first Gaussian
#' @param m2 Mode of the second Gaussian
#' @param s1 Spread of the first Gaussian
#' @param s2 Spread of the second Gaussian
#'
#' @return Value at x, given the other parameters
#' @export
#'
#' @examples
mixgaussian <- function(x, H1, H2, m1, m2, s1, s2) {
  H1 * exp(-0.5 * ((x - m1) / s1) ^ 2) + H2 * exp(-0.5 * ((x - m2) / s2) ^ 2)
}

#' Mixture of two Gaussian functions Stan code
#'
#' Stan code for the mixgaussian function
#'
#' @usage NULL
#' @format NULL
#' @export
#'
#' @examples
#' cat(mixgaussian_stan[["source_code"]])
mixgaussian_stan <- get_stan_function("mixgaussian")
