% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_jmodel.R, R/import_workspace.R
\name{get_model}
\alias{get_model}
\alias{get_jmodel}
\title{Get the seasonally adjusted model from a workspace}
\usage{
get_jmodel(x, workspace, userdefined = NULL, progress_bar = TRUE)

get_model(x, workspace, userdefined = NULL, progress_bar = TRUE)
}
\arguments{
\item{x}{the object to get the seasonally adjusted model.}

\item{workspace}{the workspace object where models are stored. If \code{x} is a \code{workspace} object this parameter is not used.}

\item{userdefined}{vector with characters for additional output variables.
(see \code{\link{x13}} or \code{\link{tramoseats}}).}

\item{progress_bar}{boolean: if \code{TRUE} a progress bar is printed.}
}
\value{
\code{get_model()} returns a seasonally adjust object (class \code{c("SA", "X13")} or \code{c("SA", "TRAMO_SEATS"}) or list of seasonally adjust objects:
\itemize{
 \item if \code{x} is a \code{sa_item} object, \code{get_model(x)} returns a \code{"SA"} object (or a \code{\link{jSA}} object with \code{get_jmodel(x)});
 \item if \code{x} is a \code{multiprocessing} object, \code{get_ts(x)} returns list of length the number
 of sa_items, each element containing a \code{"SA"} object (or a \code{\link{jSA}} object with \code{get_jmodel(x)});
 \item if \code{x} is a \code{workspace} object, \code{get_ts(x)} returns list of length the number of multiprocessing,
 each element containing a list of a \code{"SA"} object (or a \code{\link{jSA}} object with \code{get_jmodel(x)}).
}
}
\description{
Generics functions to get seasonally adjusted model(s) from \code{workspace},
\code{multiprocessing} or \code{sa_item} object. \code{get_model} returns a \code{"SA"} objects while  \code{get_jmodel} returns the Java objects of the models.
}
\examples{
\donttest{
spec_x13 <- x13_spec(spec = "RSA5c", easter.enabled = FALSE)
sa_x13 <- x13(ipi_c_eu[, "FR"], spec = spec_x13)
spec_ts <- tramoseats_spec(spec = "RSA5")
sa_ts <- tramoseats(ipi_c_eu[, "FR"], spec = spec_ts)

wk <- new_workspace()
mp <- new_multiprocessing(wk, "sa1")
add_sa_item(wk, "sa1", sa_x13, "X13")
add_sa_item(wk, "sa1", sa_ts, "TramoSeats")

compute(wk) # It's important to compute the workspace to get the SA model
sa_item1 <- get_object(mp, 1)

get_model(sa_item1, wk) # Extract the model of the sa_item1: its the object sa_x13

# To get all the models of the multiprocessing mp:
get_model(mp, wk)

# To get all the models of the workspace wk:
get_model(wk)
}

}
\seealso{
Other functions to get informations from a workspace, multiprocessing or sa_item: \code{\link{count}}, \code{\link{get_name}}, \code{\link{get_ts}}.

\code{\link{compute}}
}
