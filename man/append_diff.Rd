% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/appenders.R
\name{append_diff}
\alias{append_diff}
\title{Append a column of differences-to-next-observation}
\usage{
append_diff(.data, .observation)
}
\arguments{
\item{.data}{tsibble. The data.}

\item{.observation}{symbol. The observation column.}
}
\value{
.data, augmented with a column, named \code{diff_to_next_obs},
of leads of differences.
}
\description{
Adds a new column, named "diff_to_next_obs", of the differences to the
next (i.e. lead) observations.
}
\details{
The corresponding selector, \code{\link[=sample_diff]{sample_diff()}}, defaults to this name
for the diff column, so it makes things slightly easier in that regard.

This appender should be paired with \code{\link[=sample_diff]{sample_diff()}} for use in CV.
It is applied to the training data after the train-test split,
to avoid data leakage.
}
\examples{
data = tsibble::tsibble(date = as.Date("2022-02-02") + 0:9,
                        obs = 1:10,
                        index = date)
append_diff(data, obs)

}
