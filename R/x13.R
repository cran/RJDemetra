setClass(
  Class = "X13_java",
  contains = "ProcResults"
)
#' Seasonal Adjustment with  X13-ARIMA
#'
#' @description
#' Functions to estimate the seasonally adjusted series (sa) with the X13-ARIMA method.
#' This is achieved by decomposing the time series (y) into the trend-cycle (t), the seasonal component (s) and the irregular component (i).
#' Calendar-related movements can be corrected in the pre-treatment (regarima) step.
#' \code{x13} returns a preformatted result while \code{jx13} returns the Java objects resulting from the seasonal adjustment.
#'
#' @param series an univariate time series
#' @param spec the x13 model specification. It can be the name (\code{character}) of a pre-defined X13 'JDemetra+' model specification
#' (see \emph{Details}) or of a specification created with the \code{\link{x13_spec}} function. The default value is \code{"RSA5c"}.
#' @param userdefined a \code{character} vector containing the additional output variables (see \code{\link{user_defined_variables}}).
#'
#' @details
#' The first step of a seasonal adjustment consists in pre-adjusting the time series. This is done by removing
#' its deterministic effects (calendar and outliers), using a regression model with ARIMA noise (RegARIMA, see: \code{\link{regarima}}).
#' In the second part, the pre-adjusted series is decomposed by the X11 algorithm into the following components:
#' trend-cycle (t), seasonal component (s) and irregular component (i). The decomposition can be:
#' additive  (\eqn{y = t + s + i}) or multiplicative (\eqn{y = t * s * i}).
#
#' More information on the X11 algorithm at \url{https://jdemetra-new-documentation.netlify.app/m-x11-decomposition}.
#'
#' The available pre-defined 'JDemetra+' X13 model specifications are described in the table below:
#' \tabular{rrrrrrr}{
#' \strong{Identifier} |\tab \strong{Log/level detection} |\tab \strong{Outliers detection} |\tab \strong{Calendar effects} |\tab \strong{ARIMA}\cr
#' RSA0 |\tab \emph{NA} |\tab \emph{NA} |\tab \emph{NA} |\tab Airline(+mean)\cr
#' RSA1 |\tab automatic |\tab AO/LS/TC  |\tab \emph{NA} |\tab Airline(+mean)\cr
#' RSA2c |\tab automatic |\tab AO/LS/TC |\tab 2 td vars + Easter |\tab Airline(+mean)\cr
#' RSA3 |\tab automatic |\tab AO/LS/TC |\tab \emph{NA} |\tab automatic\cr
#' RSA4c |\tab automatic |\tab AO/LS/TC |\tab 2 td vars + Easter |\tab automatic\cr
#' RSA5c |\tab automatic |\tab AO/LS/TC |\tab 7 td vars + Easter |\tab automatic\cr
#' X11 |\tab \emph{NA} |\tab \emph{NA} |\tab \emph{NA} |\tab NA
#' }
#'
#' @return
#'
#' \code{jx13} returns the result of the seasonal adjustment in a Java (\code{\link{jSA}}) object, without any formatting.
#' Therefore, the computation is faster than with the \code{x13} function. The results of the seasonal adjustment can be
#' extracted with the function \code{\link{get_indicators}}.
#'
#' \code{x13} returns an object of class \code{c("SA","X13")}, that is, a list containing the following components:
#'
#' \item{regarima}{an object of class \code{c("regarima","X13")}. More info in the \emph{Value} section of the function \code{\link{regarima}}.}
#'
#' \item{decomposition}{an object of class \code{"decomposition_X11"}, that is a six-element list:
#' \itemize{
#' \item \code{specification} a list with the X11 algorithm specification. See also the function \code{\link{x13_spec}}.
#' \item \code{mode} the decomposition mode
#' \item \code{mstats} the matrix with the M statistics
#' \item \code{si_ratio} the time series matrix (mts) with the \code{d8} and \code{d10} series
#' \item \code{s_filter} the seasonal filters
#' \item \code{t_filter} the trend filter
#' }
#' }
#'
#' \item{final}{an object of class \code{c("final","mts","ts","matrix")}. The matrix contains the final results of the seasonal adjustment:
#' the original time series (\code{y})and its forecast (\code{y_f}), the trend (\code{t}) and its forecast (\code{t_f}),
#' the seasonally adjusted series (\code{sa}) and its forecast (\code{sa_f}), the seasonal component (\code{s})and its forecast (\code{s_f}),
#' and the irregular component (\code{i}) and its forecast (\code{i_f}).}
#'
#' \item{diagnostics}{an object of class \code{"diagnostics"}, that is a list containing three types of tests results:
#' \itemize{
#' \item \code{variance_decomposition} a data.frame with the tests results on the relative contribution of the components to the stationary
#' portion of the variance in the original series, after the removal of the long term trend;
#' \item \code{residuals_test} a data.frame with the tests results of the presence of seasonality in the residuals
#' (including the statistic test values, the corresponding p-values and the parameters description);
#' \item \code{combined_test} the combined tests for stable seasonality in the entire series. The format is a two elements list with:
#' \code{tests_for_stable_seasonality}, a data.frame containing the tests results (including the statistic test value, its p-value and the parameters
#' description), and \code{combined_seasonality_test}, the summary.
#' }}
#' \item{user_defined}{an object of class \code{"user_defined"}: a list containing the additional userdefined  variables.}
#'
#'
#' @references
#' More information and examples related to 'JDemetra+' features in the online documentation:
#' \url{https://jdemetra-new-documentation.netlify.app/}
#' @seealso \code{\link{x13_spec}}, \code{\link{tramoseats}}
#'
#' @examples\donttest{
#' myseries <- ipi_c_eu[, "FR"]
#' mysa <- x13(myseries, spec = "RSA5c")
#'
#' myspec1 <- x13_spec(mysa, tradingdays.option = "WorkingDays",
#'             usrdef.outliersEnabled = TRUE,
#'             usrdef.outliersType = c("LS","AO"),
#'             usrdef.outliersDate = c("2008-10-01", "2002-01-01"),
#'             usrdef.outliersCoef = c(36, 14),
#'             transform.function = "None")
#' mysa1 <- x13(myseries, myspec1)
#' mysa1
#' summary(mysa1$regarima)
#'
#' myspec2 <- x13_spec(mysa, automdl.enabled =FALSE,
#'             arima.coefEnabled = TRUE,
#'             arima.p = 1, arima.q = 1, arima.bp = 0, arima.bq = 1,
#'             arima.coef = c(-0.8, -0.6, 0),
#'             arima.coefType = c(rep("Fixed", 2), "Undefined"))
#' s_arimaCoef(myspec2)
#' mysa2 <- x13(myseries, myspec2,
#'              userdefined = c("decomposition.d18", "decomposition.d19"))
#' mysa2
#' plot(mysa2)
#' plot(mysa2$regarima)
#' plot(mysa2$decomposition)
#' }
#' @export
x13 <- function(series, spec = c("RSA5c", "RSA0", "RSA1", "RSA2c", "RSA3", "RSA4c", "X11"),
                       userdefined = NULL){
  if (!is.ts(series)) {
    stop("The series must be a time series!")
  }
  UseMethod("x13", spec)
}
#' @export
x13.SA_spec <- function(series, spec, userdefined = NULL){
  # jsa_obj <- jx13.SA_spec(series, spec)
  # jrslt <- jsa_obj[["result"]]@internal
  # jrspec <- jsa_obj[["spec"]]
  if (is.null(s_estimate(spec))) {

    # For the X11 specification
    jdspec <- .jcall("jdr/spec/x13/X13Spec", "Ljdr/spec/x13/X13Spec;", "of", "X11")

  } else {
    jdspec <- .jcall("jdr/spec/x13/X13Spec", "Ljdr/spec/x13/X13Spec;", "of", "RSA0")
  }
  jdictionary <- spec_regarima_X13_r2jd(spec, jdspec)
  seasma <- specX11_r2jd(spec,jdspec, freq = frequency(series))
  spec_benchmarking_r2jd(rspec = spec, jdspec = jdspec)
  jspec <- .jcall(jdspec, "Lec/satoolkit/x13/X13Specification;", "getCore")
  jrslt <- .jcall("ec/tstoolkit/jdr/sa/Processor", "Lec/tstoolkit/jdr/sa/X13Results;", "x13", ts_r2jd(series), jspec, jdictionary)

  # Or, using the function x13JavaResults:
  # return(x13JavaResults(jrslt = jrslt, spec = jrspec, userdefined = userdefined))


  jrarima <- .jcall(jrslt, "Lec/tstoolkit/jdr/regarima/Processor$Results;", "regarima")
  jrobct_arima <- new(Class = "RegArima_java",internal = jrarima)
  jrobct <- new(Class = "X13_java", internal = jrslt)

  if (is.null(jrobct@internal)) {
    return(NaN)
  }else{
    # Error with the preliminary check
    res = jrslt$getResults()$getProcessingInformation()

    if(is.null(jrslt$getDiagnostics()) & !.jcall(res,"Z","isEmpty")){
      proc_info <- jrslt$getResults()$getProcessingInformation()
      error_msg <- .jcall(proc_info, "Ljava/lang/Object;", "get", 0L)$getErrorMessages(proc_info)
      warning_msg <- .jcall(proc_info, "Ljava/lang/Object;", "get", 0L)$getWarningMessages(proc_info)
      if(!.jcall(error_msg,"Z","isEmpty"))
        stop(error_msg$toString())
      if(!.jcall(warning_msg,"Z","isEmpty"))
        warning(warning_msg$toString())
    }
    reg <- regarima_X13(jrobj = jrobct_arima, spec = spec$regarima)
    deco <- decomp_X13(jrobj = jrobct, spec = spec$x11, seasma = seasma)
    bench <- benchmarking(jrobj = jrobct, spec = spec$benchmarking)
    fin <- final(jrobj = jrobct)
    diagn <- diagnostics(jrobj = jrobct)

    z <- list(regarima = reg, decomposition = deco, final = fin, diagnostics = diagn,
              benchmarking = bench,
              user_defined = user_defined(userdefined, jrobct))

    class(z) <- c("SA", "X13")
    return(z)
  }
}
#' @export
x13.character <- function(series, spec = c("RSA5c", "RSA0", "RSA1", "RSA2c", "RSA3", "RSA4c", "X11"),
                    userdefined = NULL){
  jsa_obj <- jx13.character(series, spec)
  jrslt <- jsa_obj[["result"]]@internal
  jrspec <- jsa_obj[["spec"]]

  return(x13JavaResults(jrslt = jrslt, spec = jrspec, userdefined = userdefined))
}

# To extract the results of the SA of a X13 object
x13JavaResults <- function(jrslt, spec, userdefined = NULL,
                           context_dictionary = NULL,
                           extra_info = FALSE, freq = NA){

  jrarima <- .jcall(jrslt, "Lec/tstoolkit/jdr/regarima/Processor$Results;", "regarima")
  jrobct_arima <- new(Class = "RegArima_java",internal = jrarima)
  jrobct <- new(Class = "X13_java", internal = jrslt)

  if (is.null(jrobct@internal)) {
    return(NULL)
  }

  # Error during the preliminary check
  res = jrslt$getResults()$getProcessingInformation()
  if(is.null(jrslt$getDiagnostics()) & !.jcall(res,"Z","isEmpty")){
    proc_info <- jrslt$getResults()$getProcessingInformation()
    error_msg <- .jcall(proc_info, "Ljava/lang/Object;", "get", 0L)$getErrorMessages(proc_info)
    warning_msg <- .jcall(proc_info, "Ljava/lang/Object;", "get", 0L)$getWarningMessages(proc_info)
    if(!.jcall(error_msg,"Z","isEmpty"))
      stop(error_msg$toString())
    if(!.jcall(warning_msg,"Z","isEmpty"))
      warning(warning_msg$toString())
  }

  reg <- regarima_defX13(jrobj = jrobct_arima, spec = spec,
                         context_dictionary = context_dictionary,
                         extra_info = extra_info, freq = freq)
  deco <- decomp_defX13(jrobj = jrobct, spec = spec, freq = freq)
  bench <- benchmarking_def(jrobj = jrobct, spec)
  fin <- final(jrobj = jrobct)
  diagn <- diagnostics(jrobj = jrobct)

  z <- list(regarima = reg, decomposition = deco, final = fin,
            diagnostics = diagn,
            benchmarking = bench,
            user_defined = user_defined(userdefined, jrobct))

  class(z) <- c("SA","X13")
  return(z)
}


