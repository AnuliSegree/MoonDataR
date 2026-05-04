#' Summarize Variables in a Data Frame
#'
#' Creates a simple summary table for every variable in a data frame.
#' Numeric variables include mean, median, standard deviation, minimum,
#' and maximum. Non-numeric variables include missing and unique values.
#'
#' @param data A data frame.
#'
#' @return A data frame with one row per variable and summary information.
#' @export
#'
#' @examples
#' summarize_data(iris)
summarize_data <- function(data) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame.")
  }

  result <- lapply(names(data), function(variable) {
    x <- data[[variable]]
    is_num <- is.numeric(x)

    data.frame(
      variable = variable,
      type = class(x)[1],
      rows = length(x),
      missing_count = sum(is.na(x)),
      missing_percent = round(mean(is.na(x)) * 100, 2),
      unique_values = length(unique(x)),
      mean = if (is_num) round(mean(x, na.rm = TRUE), 3) else NA_real_,
      median = if (is_num) round(stats::median(x, na.rm = TRUE), 3) else NA_real_,
      sd = if (is_num) round(stats::sd(x, na.rm = TRUE), 3) else NA_real_,
      min = if (is_num) round(min(x, na.rm = TRUE), 3) else NA_real_,
      max = if (is_num) round(max(x, na.rm = TRUE), 3) else NA_real_,
      stringsAsFactors = FALSE
    )
  })

  do.call(rbind, result)
}
