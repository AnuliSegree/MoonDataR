#' Create a Missing Values Report
#'
#' Reports the number and percentage of missing values for each variable
#' in a data frame.
#'
#' @param data A data frame.
#' @param only_missing Logical. If TRUE, only variables with missing values
#' are returned. The default is FALSE.
#'
#' @return A data frame showing missing value counts and percentages.
#' @export
#'
#' @examples
#' missing_report(airquality)
#' missing_report(airquality, only_missing = TRUE)
missing_report <- function(data, only_missing = FALSE) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame.")
  }

  report <- data.frame(
    variable = names(data),
    missing_count = sapply(data, function(x) sum(is.na(x))),
    missing_percent = round(sapply(data, function(x) mean(is.na(x)) * 100), 2),
    stringsAsFactors = FALSE
  )

  rownames(report) <- NULL

  if (only_missing) {
    report <- report[report$missing_count > 0, ]
    rownames(report) <- NULL
  }

  report
}
