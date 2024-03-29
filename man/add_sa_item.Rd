% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export_workspace.R
\name{add_sa_item}
\alias{add_sa_item}
\title{Add a seasonally adjusted series to a multi-processing}
\usage{
add_sa_item(workspace, multiprocessing, sa_obj, name)
}
\arguments{
\item{workspace}{the workspace to add the seasonally adjusted series to.}

\item{multiprocessing}{the name or index of the multiprocessing to add the seasonally adjusted series to.}

\item{sa_obj}{the seasonally adjusted object to add}

\item{name}{the name of the seasonally adjusted series in the multiprocessing.
By default the name of the \code{sa_obj} is used.}
}
\description{
Function to add a new seasonally adjusted object (class \code{"SA"} or \code{"jSA"}) to a \code{workspace} object.
}
\examples{
\donttest{
dir <- tempdir()
# Adjustment of a series with the x13 and Tramo-Seats methods
spec_x13 <- x13_spec(spec = "RSA5c", easter.enabled = FALSE)
sa_x13 <- x13(ipi_c_eu[, "FR"], spec = spec_x13)
spec_ts <- tramoseats_spec(spec = "RSA5")
sa_ts <- jtramoseats(ipi_c_eu[, "FR"], spec = spec_ts)

# Creation of a new workspace..
wk <- new_workspace()
# and of the multiprocessing "sa1" that will contain the series
new_multiprocessing(wk, "sa1")
# Addition of the adjusted series to the workspace via the sa1 multiprocessing
add_sa_item(wk, "sa1", sa_x13, "X13")
add_sa_item(wk, "sa1", sa_ts, "TramoSeats")

# Export of the new filled workspace
save_workspace(wk, file.path(dir, "workspace.xml"))
}

}
\seealso{
\code{\link{load_workspace}}, \code{\link{save_workspace}}
}
