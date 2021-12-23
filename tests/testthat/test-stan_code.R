# I've put all the tests of Stan code into the same file
# so that the tests run faster.
# Compiling a Stan model takes about a minute,
# so compiling each function individually in its own test would be frustrating.

# TODO: Produce a warning if rstan is not installed.
if (requireNamespace("rstan", quietly = TRUE)) {

  stan_model_code <- paste("functions {\n",
                           modskurt_stan[["source_code"]],
                           modskurtp1_stan[["source_code"]],
                           modskurtd0_stan[["source_code"]],
                           modskurtp1d0_stan[["source_code"]],
                           modskurtp1r05_stan[["source_code"]],
                           modskurtp1d0r05_stan[["source_code"]],
                           "}\n",
                           sep = "\n")

  model_listing <- rstan::stanc(model_code = stan_model_code)

  stan_function_env <- new.env()

  function_names <- rstan::expose_stan_functions(model_listing, env = stan_function_env)

  # Zero-inflated Poisson

  test_that("modskurt is included in the stan model", {
    expect_true("modskurt" %in% function_names)
    expect_true("modskurtp1" %in% function_names)
    expect_true("modskurtd0" %in% function_names)
    expect_true("modskurtp1d0" %in% function_names)
    expect_true("modskurtp1d0r05" %in% function_names)
    expect_true("modskurtp1r05" %in% function_names)
  })

  test_that("Stan modskurt matches R modskurt", {
    num_tests = 100

    x = runif(n = num_tests, min = 0, max = 1000)
    H = runif(n = num_tests, min = 0.1, max = 100)
    m = runif(n = num_tests, min = 0, max = 1000)
    s = runif(n = num_tests, min = 0.1, max = 10)
    r = runif(n = num_tests, min = 0, max = 1)
    d = runif(n = num_tests, min = -10, max = 10)
    p = runif(n = num_tests, min = 0.1, max = 5)

    for (i in 1:100) {
        expect_equal(stan_function_env[["modskurt"]](x[[i]], H[[i]], m[[i]], s[[i]], r[[i]], d[[i]], p[[i]]),
                     modskurt(x[[i]], H[[i]], m[[i]], s[[i]], r[[i]], d[[i]], p[[i]]))

      expect_equal(stan_function_env[["modskurtp1"]](x[[i]], H[[i]], m[[i]], s[[i]], r[[i]], d[[i]]),
                     modskurtp1(x[[i]], H[[i]], m[[i]], s[[i]], r[[i]], d[[i]]))

      expect_equal(stan_function_env[["modskurtd0"]](x[[i]], H[[i]], m[[i]], s[[i]], r[[i]], p[[i]]),
                     modskurtd0(x[[i]], H[[i]], m[[i]], s[[i]], r[[i]], p[[i]]))

      expect_equal(stan_function_env[["modskurtp1d0"]](x[[i]], H[[i]], m[[i]], s[[i]], r[[i]]),
                     modskurtp1d0(x[[i]], H[[i]], m[[i]], s[[i]], r[[i]]))

      expect_equal(stan_function_env[["modskurtp1d0r05"]](x[[i]], H[[i]], m[[i]], s[[i]]),
                     modskurtp1d0r05(x[[i]], H[[i]], m[[i]], s[[i]]))

      expect_equal(stan_function_env[["modskurtp1r05"]](x[[i]], H[[i]], m[[i]], s[[i]], d[[i]]),
                     modskurtp1r05(x[[i]], H[[i]], m[[i]], s[[i]], d[[i]]))

    }
  })
}
