#' Create a MoonDataR Data Profile
#'
#' Creates a simple S3 object that stores a dataset overview,
#' missing values report, and variable summary.
#'
#' @param data A data frame.
#'
#' @return An S3 object of class `moondata_profile`.
#' @export
#'
#' @examples
#' profile <- make_data_profile(iris)
#' print(profile)
make_data_profile <- function(data) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame.")
  }

  profile <- list(
    dataset_name = deparse(substitute(data)),
    rows = nrow(data),
    columns = ncol(data),
    column_names = names(data),
    missing = missing_report(data),
    summary = summarize_data(data)
  )

  class(profile) <- "moondata_profile"
  profile
}

#' Print a MoonDataR Data Profile
#'
#' Prints a clean summary of a `moondata_profile` object.
#'
#' @param x A `moondata_profile` object.
#' @param ... Additional arguments.
#'
#' @return The original object, invisibly.
#' @export
#'
#' @examples
#' profile <- make_data_profile(iris)
#' print(profile)
print.moondata_profile <- function(x, ...) {
  cat("MoonDataR Data Profile\n")
  cat("---------------------\n")
  cat("Dataset:", x$dataset_name, "\n")
  cat("Rows:", x$rows, "\n")
  cat("Columns:", x$columns, "\n")
  cat("Column names:", paste(x$column_names, collapse = ", "), "\n\n")

  cat("Missing Values Report:\n")
  print(x$missing)

  cat("\nVariable Summary:\n")
  print(x$summary)

  invisible(x)
}
