#' Detect Outliers in a Numeric Variable
#'
#' Uses the interquartile range (IQR) rule to identify possible outliers
#' in a numeric variable.
#'
#' @param data A data frame.
#' @param variable The name of a numeric variable as a character string.
#'
#' @return A data frame containing the outlier rows.
#' @export
#'
#' @examples
#' detect_outliers(iris, "Sepal.Length")
detect_outliers <- function(data, variable) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame.")
  }

  if (!variable %in% names(data)) {
    stop("variable must be a column name in data.")
  }

  x <- data[[variable]]

  if (!is.numeric(x)) {
    stop("variable must be numeric.")
  }

  q1 <- stats::quantile(x, 0.25, na.rm = TRUE)
  q3 <- stats::quantile(x, 0.75, na.rm = TRUE)
  iqr <- stats::IQR(x, na.rm = TRUE)

  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr

  data[x < lower | x > upper, , drop = FALSE]
}
