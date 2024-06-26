% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{SUGG_temp}
\alias{SUGG_temp}
\title{Daily mean surface water temperatures of Lake Suggs, FL}
\format{
A \code{tsibble} with 2348 rows and 2 variables:
\describe{
\item{date}{Date}
\item{observation}{Mean surface water temperature (Celcius)}
}
}
\source{
\url{https://sdsc.osn.xsede.org/bio230014-bucket01/challenges/targets/project_id=neon4cast/duration=P1D/aquatics-targets.csv.gz}
}
\usage{
SUGG_temp
}
\description{
\href{https://www.neonscience.org/field-sites/sugg}{NEON description of Lake Suggs}
}
\details{
The data comes from the NEON field site at Lake Suggs, Florida.
It was processed by the NEON Ecological Forecasting Challenge group,
which you can find information on
\href{https://projects.ecoforecast.org/neon4cast-ci/targets.html}{here} and
\href{https://projects.ecoforecast.org/neon4cast-docs/Aquatics.html}{here}.
This subset of that data goes from 2017-08-19 to 2024-01-22.
It contains ~10\% missing observations.
}
\keyword{datasets}
