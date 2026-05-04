# MoonDataR

**MoonDataR** is a beginner-friendly R package that helps students and new R users explore, clean, summarize, and visualize datasets.

This package was created as the final project for my Open Source R course.

## Purpose

When students are first learning R, it can be difficult to remember all of the separate commands needed to inspect a dataset. MoonDataR brings several common beginner data exploration steps into one small package.

The package can help users:

- summarize variables in a data frame
- check missing values
- clean column names
- detect possible numeric outliers
- create basic exploratory plots
- create a simple S3 data profile object

## Installation

```r
devtools::install_github("AnuliSegree/MoonDataR/MoonDataR")
library(MoonDataR)
```

## Package Functions

| Function | Purpose |
|---|---|
| `summarize_data()` | Creates a summary table for all variables in a data frame. |
| `missing_report()` | Reports missing value counts and percentages. |
| `clean_names_simple()` | Cleans column names. |
| `detect_outliers()` | Finds possible outliers using the IQR rule. |
| `plot_numeric()` | Creates a histogram for a numeric variable. |
| `plot_categorical()` | Creates a bar chart for a categorical variable. |
| `make_data_profile()` | Creates an S3 data profile object. |

## Example Workflow

```r
library(MoonDataR)

data <- iris

data <- clean_names_simple(data)

missing_report(data)

summarize_data(data)

plot_numeric(data, "sepal_length")

plot_categorical(data, "species")

profile <- make_data_profile(data)
print(profile)
```

## S3 Class

MoonDataR uses an S3 class called `moondata_profile`.

The function `make_data_profile()` creates the object, and `print.moondata_profile()` controls how the object is printed. I chose S3 because it is simpler and more beginner-friendly than S4.

## Libraries

This package imports `ggplot2` for exploratory plots. The rest of the package mainly uses base R.

## License

This package uses the **CC0** license.

## Use of AI

I used AI as a learning support tool to help organize my ideas, check errors, and improve clarity. I reviewed, edited, and tested the final package myself.

## Future Improvements

Future versions may include more plot types, automated R Markdown reports, and options to export summaries.
