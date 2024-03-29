% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_jspec.R, R/jsa2r.R
\name{jSA}
\alias{jSA}
\alias{get_jspec}
\alias{get_dictionary}
\alias{get_indicators}
\alias{jSA2R}
\title{Functions around 'jSA' objects}
\usage{
get_jspec(x, ...)

get_dictionary(x)

get_indicators(x, ...)

jSA2R(x, userdefined = NULL)
}
\arguments{
\item{x}{a \code{"jSA"} object.}

\item{...}{characters containing the names of the indicators to extract.}

\item{userdefined}{a userdefined vector containing the names of additional output variables (see \code{\link{user_defined_variables}}).
Only used for \code{"SA"} objects.}
}
\value{
\code{get_dictionary} returns a vector of characters,
\code{get_indicators} returns a list containing the indicators that are extracted,
\code{jSA2R} returns a \code{"SA"} or a \code{"regarima"} object and
\code{get_jspec} returns a Java object.
}
\description{
\code{get_dictionary} returns the indicators that can be extracted from \code{"jSA"} objects,
\code{get_indicators} extracts a list of indicators
\code{jSA2R} returns the corresponding \code{"SA"}.
}
\details{
A \code{"jSA"} object is a list of three elements:
\itemize{
\item \code{"result"}: the Java object containing the results of a seasonal adjustment or a pre-adjustment method.
\item \code{"spec"}: the Java object containing the specification of a seasonal adjustment or a pre-adjustment method.
\item \code{"dictionary"}: the Java object containing the dictionary of a seasonal adjustment or a pre-adjustment method.
In particular, it contains all the user-defined regressors.
 }

\code{get_dictionary} returns the list of indicators that can be extracted from a \code{jSA} object by the function \code{get_indicators}.

\code{jSA2R} returns the corresponding formatted seasonally adjusted (\code{"SA"} object) or RegARIMA (\code{"regarima"} object) model.

\code{get_jspec} returns the Java object that contains the specification of an object. Such object can be of type
\code{"jSA"}, \code{"X13"}, \code{"TRAMO_SEATS"} or \code{"sa_item"}.
}
\examples{
myseries <- ipi_c_eu[, "FR"]
mysa <- jx13(myseries, spec = "RSA5c")
get_dictionary(mysa)

get_indicators(mysa, "decomposition.b2", "decomposition.d10")

# To convert the Java object to an R object
jSA2R(mysa)

}
