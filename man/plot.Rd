% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regarima_plot.R, R/sa_plot.R
\name{plot}
\alias{plot}
\alias{plot.regarima}
\alias{plot.decomposition_X11}
\alias{plot.decomposition_SEATS}
\alias{plot.final}
\alias{plot.SA}
\title{Plotting regarima, decomposition or final results of a SA}
\usage{
\method{plot}{regarima}(
  x,
  which = 1:6,
  caption = list("Residuals", "Histogram of residuals", "Normal Q-Q", "ACF of residuals",
    "PACF of residuals", "Decomposition", list("Y linearised", "Calendar effects",
    "Outliers effects"))[sort(which)],
  ask = prod(par("mfcol")) < length(which) && dev.interactive(),
  ...
)

\method{plot}{decomposition_X11}(x, first_date, last_date, caption = "S-I ratio", ylim, ...)

\method{plot}{decomposition_SEATS}(x, first_date, last_date, caption = "S-I ratio", ylim, ...)

\method{plot}{final}(
  x,
  first_date,
  last_date,
  forecast = TRUE,
  type_chart = c("sa-trend", "cal-seas-irr"),
  caption = c(`sa-trend` = "Y, Sa, trend", `cal-seas-irr` =
    "Cal., sea., irr.")[type_chart],
  ask = length(type_chart) > 1 && dev.interactive(),
  ylim,
  ...
)

\method{plot}{SA}(x, ...)
}
\arguments{
\item{x}{the object to plot}

\item{which}{a numeric vector specifying which graphs should be plotted:
(1) "Residuals", (2) "Histogram of residuals", (3) "Normal Q-Q", (4) "ACF of residuals",
(5) "PACF of residuals", (6) "Decomposition", (7) "Decomposition - zoom"}

\item{caption}{a string containing the graph title}

\item{ask}{a Boolean. If \code{TRUE}, the user will be prompted before a new graphical page is started.}

\item{...}{other parameters}

\item{first_date}{the plot starting date. If missing, the plot starts at the beginning of the time-series.}

\item{last_date}{the end date of the plot. If missing, the plot ends at the end of the time-series (eventually, including forecast).}

\item{ylim}{the y limits of the plot.}

\item{forecast}{a Boolean indicating if forecasts should be included in the plot. If \code{TRUE}, the forecast is plotted.}

\item{type_chart}{a string indicating which type of chart to plot}
}
\description{
Plotting methods for the S3 class objects around the seasonal adjustment:
\code{"regarima"} for RegARIMA,\code{"decomposition_X11"} and \code{"decomposition_SEATS"} for
the decomposition with X13 and TRAMO-SEATS, \code{"final"} for the final SA results
and \code{"SA"} for the entire seasonal adjustment object.
The function \code{plot.SA} just calls the function \code{plot.final}.
}
\examples{
\donttest{
myseries <- ipi_c_eu[, "FR"]
mysa <- x13(myseries, spec = c("RSA5c"))
  # RegArima
plot(mysa$regarima) # 6 graphics are plotted by default
# To plot only one graphic (here, the residuals) and change the title:
plot(mysa$regarima, which = 1, caption = "Plot of residuals")
plot(mysa$regarima, which = 7)

  # Decomposition
plot(mysa$decomposition) # To plot the S-I ratio
plot(mysa$decomposition, first_date = c(2010, 1)) # To start the plot in January 2010

  # Final
plot(mysa$final) # 2 graphics are plotted by default
# To only plot one graphic (here the raw data, the seasonally adjusted data and the trend),
# To change the last date and the title
plot(mysa$final, last_date = c(2000, 1),
     caption = "Results", type_chart = "sa-trend")
}
}
