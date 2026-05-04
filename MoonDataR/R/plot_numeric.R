#' Plot a Numeric Variable
#'
#' Creates a histogram for one numeric variable in a data frame.
#'
#' @param data A data frame.
#' @param variable The name of a numeric variable as a character string.
#' @param bins Number of histogram bins. The default is 30.
#'
#' @return A ggplot object.
#' @export
#' @importFrom ggplot2 ggplot aes geom_histogram labs theme_minimal
#'
#' @examples
#' plot_numeric(iris, "Sepal.Length")
plot_numeric <- function(data, variable, bins = 30) {
  if (!is.data.frame(data)) {
    stop("data must be a data frame.")
  }

  if (!variable %in% names(data)) {
    stop("variable must be a column name in data.")
  }

  if (!is.numeric(data[[variable]])) {
    stop("variable must be numeric.")
  }

  ggplot2::ggplot(data, ggplot2::aes(x = .data[[variable]])) +
    ggplot2::geom_histogram(bins = bins) +
    ggplot2::labs(
      title = paste("Distribution of", variable),
      x = variable,
      y = "Count"
    ) +
    ggplot2::theme_minimal()
}
