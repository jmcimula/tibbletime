% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_series.R
\name{create_series}
\alias{create_series}
\title{Create a \code{tbl_time} object with a sequence of regularly spaced dates}
\usage{
create_series(time_formula, period = "daily", include_end = FALSE,
  tz = NULL, force_class = NULL, as_date_vector = FALSE)
}
\arguments{
\item{time_formula}{A period to create the series over.
This is specified as a formula.
See the \code{Details} section of \code{\link[=time_filter]{time_filter()}} for more information.}

\item{period}{A formula or character specification used for time-based grouping.

If a formula, e.g. \code{1~year}, the formula is split and parsed to form the
grouping period. The \code{period} argument accepts a formula of the form
\code{multiple ~ period} allowing for flexible period grouping.
The following are examples:
\itemize{
\item 1 Year: \code{1~y}
\item 3 Months: \code{3~m}
\item 90 Days: \code{90~d}
}

Note that while shorthand is used above, an attempt is made to recognize
more explicit period names such as:
\itemize{
\item 2 Year: \code{2~year} / \code{2~years} / \code{2~yearly}
}

The \code{period} argument also accepts characters that are converted to their
corresponding periods. The following are accepted:
\itemize{
\item \code{"yearly"} or \code{"y"}
\item \code{"quarterly"} or \code{"q"}
\item \code{"monthly"} or \code{"m"}
\item \code{"weekly"} or \code{"w"}
\item \code{"daily"} or \code{"d"}
\item \code{"hour"} or \code{"h"}
\item \code{"minute"} or \code{"M"}
\item \code{"second"} or \code{"s"}
}}

\item{include_end}{Whether to always include the RHS of the \code{time_formula}
even if it does not match the regularly spaced index.}

\item{tz}{Time zone of the new series.}

\item{force_class}{Either \code{"Date"} or \code{"POSIXct"}. The default is to infer
the simplest class required from the \code{period} specified, but this will
override that.}

\item{as_date_vector}{Should the series be returned as a vector instead of
a tibble?}
}
\description{
\code{\link[=create_series]{create_series()}} allows the user to quickly create a \code{tbl_time} object with
a \code{date} column populated with a sequence of dates.
}
\examples{

# Every day in 2013
create_series(~2013, "daily")

# Every other day in 2013
create_series(~2013, 2~d)

# Every quarter in 2013
create_series(~2013, 1~q)

# Daily series for 2 years
create_series(2013~2015, 1~d)

# Minute series for 2 months
create_series(2012-01~2012-02, 1~M)

# Second series for 2 minutes
create_series(2011-01-01 + 12:10:00 ~ 2011-01-01 + 12:12:00, 1~s)

# Force POSIXct class
create_series(~2013, 1~d, force_class = "POSIXct")

}
