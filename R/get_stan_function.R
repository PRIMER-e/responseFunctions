get_stan_function <- function(function_name) {
  filename = paste0(function_name, ".stan")

  full_filename <- system.file("stan_files",
                      "functions",
                      filename,
                      package = methods::getPackageName())

  if (full_filename == "") {
    stop(paste0("Definition for ", function_name, " could not be found."))
  }

  list(source_code = readr::read_file(full_filename))
}
