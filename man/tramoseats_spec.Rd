% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tramoseats_spec.R
\name{tramoseats_spec}
\alias{tramoseats_spec}
\title{TRAMO-SEATS model specification}
\usage{
tramoseats_spec(
  spec = c("RSAfull", "RSA0", "RSA1", "RSA2", "RSA3", "RSA4", "RSA5"),
  preliminary.check = NA,
  estimate.from = NA_character_,
  estimate.to = NA_character_,
  estimate.first = NA_integer_,
  estimate.last = NA_integer_,
  estimate.exclFirst = NA_integer_,
  estimate.exclLast = NA_integer_,
  estimate.tol = NA_integer_,
  estimate.eml = NA,
  estimate.urfinal = NA_integer_,
  transform.function = c(NA, "Auto", "None", "Log"),
  transform.fct = NA_integer_,
  usrdef.outliersEnabled = NA,
  usrdef.outliersType = NA,
  usrdef.outliersDate = NA,
  usrdef.outliersCoef = NA,
  usrdef.varEnabled = NA,
  usrdef.var = NA,
  usrdef.varType = NA,
  usrdef.varCoef = NA,
  tradingdays.mauto = c(NA, "Unused", "FTest", "WaldTest"),
  tradingdays.pftd = NA_integer_,
  tradingdays.option = c(NA, "TradingDays", "WorkingDays", "UserDefined", "None"),
  tradingdays.leapyear = NA,
  tradingdays.stocktd = NA_integer_,
  tradingdays.test = c(NA, "Separate_T", "Joint_F", "None"),
  easter.type = c(NA, "Unused", "Standard", "IncludeEaster", "IncludeEasterMonday"),
  easter.julian = NA,
  easter.duration = NA_integer_,
  easter.test = NA,
  outlier.enabled = NA,
  outlier.from = NA_character_,
  outlier.to = NA_character_,
  outlier.first = NA_integer_,
  outlier.last = NA_integer_,
  outlier.exclFirst = NA_integer_,
  outlier.exclLast = NA_integer_,
  outlier.ao = NA,
  outlier.tc = NA,
  outlier.ls = NA,
  outlier.so = NA,
  outlier.usedefcv = NA,
  outlier.cv = NA_integer_,
  outlier.eml = NA,
  outlier.tcrate = NA_integer_,
  automdl.enabled = NA,
  automdl.acceptdefault = NA,
  automdl.cancel = NA_integer_,
  automdl.ub1 = NA_integer_,
  automdl.ub2 = NA_integer_,
  automdl.armalimit = NA_integer_,
  automdl.reducecv = NA_integer_,
  automdl.ljungboxlimit = NA_integer_,
  automdl.compare = NA,
  arima.mu = NA,
  arima.p = NA_integer_,
  arima.d = NA_integer_,
  arima.q = NA_integer_,
  arima.bp = NA_integer_,
  arima.bd = NA_integer_,
  arima.bq = NA_integer_,
  arima.coefEnabled = NA,
  arima.coef = NA,
  arima.coefType = NA,
  fcst.horizon = NA_integer_,
  seats.predictionLength = NA_integer_,
  seats.approx = c(NA, "None", "Legacy", "Noisy"),
  seats.trendBoundary = NA_integer_,
  seats.seasdBoundary = NA_integer_,
  seats.seasdBoundary1 = NA_integer_,
  seats.seasTol = NA_integer_,
  seats.maBoundary = NA_integer_,
  seats.method = c(NA, "Burman", "KalmanSmoother", "McElroyMatrix"),
  benchmarking.enabled = NA,
  benchmarking.target = c(NA, "Original", "CalendarAdjusted"),
  benchmarking.useforecast = NA,
  benchmarking.rho = NA_real_,
  benchmarking.lambda = NA_real_
)
}
\arguments{
\item{spec}{a TRAMO-SEATS model specification. It can be the 'JDemetra+' name (\code{character}) of a predefined TRAMO-SEATS model specification
(see \emph{Details}), an object of class \code{c("SA_spec","TRAMO_SEATS")} or an object of class \code{c("SA", "TRAMO_SEATS")}.
The default is \code{"RSAfull"}.}

\item{preliminary.check}{a \code{logical} to check the quality of the input series and exclude highly problematic series
e.g. the series with a number of identical observations and/or missing values above pre-specified threshold values.

The time span of the series, which is the (sub)period used to estimate the regarima model, is controlled by the following six variables:
\code{estimate.from, estimate.to, estimate.first, estimate.last, estimate.exclFirst} and \code{estimate.exclLast};
where \code{estimate.from} and \code{estimate.to} have priority over the remaining span control variables,
\code{estimate.last} and \code{estimate.first} have priority over \code{estimate.exclFirst} and \code{estimate.exclLast},
and \code{estimate.last} has priority over \code{estimate.first}. Default= "All".}

\item{estimate.from}{a character in format "YYYY-MM-DD" indicating the start of the time span (e.g. "1900-01-01").
It can be combined with the parameter \code{estimate.to}.}

\item{estimate.to}{a \code{character} in format "YYYY-MM-DD" indicating the end of the time span (e.g. "2020-12-31").
It can be combined with the parameter \code{estimate.from}.}

\item{estimate.first}{\code{numeric}, the number of periods considered at the beginning of the series.}

\item{estimate.last}{\code{numeric}, the number of periods considered at the end of the series.}

\item{estimate.exclFirst}{\code{numeric}, the number of periods excluded at the beginning of the series.
It can be combined with the parameter \code{estimate.exclLast}.}

\item{estimate.exclLast}{\code{numeric}, the number of periods excluded at the end of the series.
It can be combined with the parameter \code{estimate.exclFirst}.}

\item{estimate.tol}{\code{numeric}, the convergence tolerance. The absolute changes in the log-likelihood function are compared to this value
to check for the convergence of the estimation iterations.}

\item{estimate.eml}{\code{logical}, the exact maximum likelihood estimation. If \code{TRUE}, the program performs an exact maximum likelihood estimation.
If \code{FASLE}, the Unconditional Least Squares method is used.}

\item{estimate.urfinal}{\code{numeric}, the final unit root limit. The threshold value for the final unit root test
for identification of differencing orders. If the magnitude of an AR root for the final model is smaller than this number,
 then a unit root is assumed, the order of the AR polynomial is reduced by one and the appropriate order of the differencing
 (non-seasonal, seasonal) is increased.}

\item{transform.function}{the transformation of the input series: \code{"None"} = no transformation of the series;
\code{"Log"} = takes the log of the series; \code{"Auto"} = the program tests for the log-level specification.}

\item{transform.fct}{\code{numeric} controlling the bias in the log/level pre-test:
\code{ transform.fct }> 1 favours levels, \code{transform.fct}< 1 favours logs.
Considered only when \code{transform.function} is set to \code{"Auto"}.

Control variables for the pre-specified outliers. Said pre-specified outliers are used in the model only when  enabled
(\code{usrdef.outliersEnabled=TRUE}) and when the outliers' type (\code{usrdef.outliersType}) and date (\code{usrdef.outliersDate})
are provided.}

\item{usrdef.outliersEnabled}{\code{logical}. If \code{TRUE}, the program uses the pre-specified outliers.}

\item{usrdef.outliersType}{a vector defining the outliers' type. Possible types are: \code{("AO"}) = additive,
\code{("LS"}) = level shift, \code{("TC"}) = transitory change, \code{("SO"}) = seasonal outlier.
E.g.: \code{ usrdef.outliersType= c("AO","AO","LS")}.}

\item{usrdef.outliersDate}{a vector defining the outliers' date. The dates should be characters in format "YYYY-MM-DD".
E.g.: \code{usrdef.outliersDate= c("2009-10-01","2005-02-01","2003-04-01")}.}

\item{usrdef.outliersCoef}{a vector providing fixed coefficients for the outliers. The coefficients can't be fixed if
the parameter \code{ transform.function} is set to \code{"Auto"} (i.e. if the series transformation needs to be pre-defined.)
E.g.: \code{usrdef.outliersCoef= c(200,170,20)}.

Control variables for the user-defined variables:}

\item{usrdef.varEnabled}{\code{logical} If \code{TRUE}, the program uses the user-defined variables.}

\item{usrdef.var}{a time series (\code{ts}) or a matrix of time series (\code{mts}) containing the user-defined variables.}

\item{usrdef.varType}{a vector of character(s) defining the user-defined variables component type.
Possible types are: \code{"Undefined", "Series", "Trend", "Seasonal", "SeasonallyAdjusted", "Irregular", "Calendar"}.
To use the user-defined calendar regressors, the type \code{"Calendar"} must be defined in conjunction with \code{tradingdays.option = "UserDefined"}.
Otherwise, the program will automatically set \code{usrdef.varType = "Undefined"}.}

\item{usrdef.varCoef}{a vector providing fixed coefficients for the user-defined variables. The coefficients can't be fixed if
\code{ transform.function} is set to \code{"Auto"} (i.e. if the series transformation needs to be pre-defined).}

\item{tradingdays.mauto}{defines whether the calendar effects should be added to the model manually (\code{"Unused"}) or automatically.
During the automatic selection, the choice of the number of calendar variables can be based on the F-Test (\code{"FTest"}) or the Wald Test (\code{"WaldTest"});
the model with higher F value is chosen, provided that it is higher than \code{tradingdays.pftd}).}

\item{tradingdays.pftd}{\code{numeric}. The p-value used in the test specified by the automatic parameter (\code{tradingdays.mauto})
to assess the significance of the pre-tested calendar effects variables and whether they should be included in the RegArima model.

Control variables for the manual selection of calendar effects variables (\code{tradingdays.mauto} is set to \code{"Unused"}):}

\item{tradingdays.option}{to choose the trading days regression variables: \code{"TradingDays"} =  six day-of-the-week regression variables;
\code{"WorkingDays"} = one working/non-working day contrast variable; \code{"None"} = no correction for trading days and working days effects;
\code{"UserDefined"} = user-defined trading days regressors (regressors must be defined by the \code{usrdef.var} argument
with \code{usrdef.varType} set to \code{"Calendar"} and \code{usrdef.varEnabled = TRUE}).
\code{"None"} must also be chosen for the "day-of-week effects" correction (and \code{tradingdays.stocktd} must be modified accordingly).}

\item{tradingdays.leapyear}{\code{logical}. Specifies if the leap-year correction should be included.
If \code{TRUE}, the model includes the leap-year effect.}

\item{tradingdays.stocktd}{numeric indicating the day of the month when inventories and other stock are reported (to denote the last day of the month set the variable to 31). Modifications of this variable are taken into account only when \code{tradingdays.option} is set to \code{"None"}.}

\item{tradingdays.test}{defines the pre-tests of the trading day effects: \code{"None"} = calendar variables are used in the model without pre-testing;
\code{"Separate_T"} = a t-test is applied to each trading day variable separately and the trading day variables are included in the RegArima model
if at least one t-statistic is greater than 2.6 or if two t-statistics are greater than 2.0 (in absolute terms);
\code{"Joint_F"} = a joint F-test of significance of all the trading day variables. The trading day effect is significant if the F statistic is greater than 0.95.}

\item{easter.type}{a\code{character} that specifies the presence and the length of the Easter effect:
\code{"Unused"} = the Easter effect is not considered; \code{"Standard"} = influences the period of \code{n} days strictly before Easter Sunday;
\code{"IncludeEaster"} = influences the entire period (\code{n}) up to and including Easter Sunday;
\code{"IncludeEasterMonday"} = influences the entire period (\code{n}) up to and including Easter Monday.}

\item{easter.julian}{\code{logical}. If \code{TRUE}, the program uses the Julian Easter (expressed in Gregorian calendar).}

\item{easter.duration}{\code{numeric} indicating the duration of the Easter effect (length in days, between 1 and 15).}

\item{easter.test}{\code{logical}. If \code{TRUE}, the program performs a t-test for the significance of the Easter effect.
The Easter effect is considered as significant if the modulus of t-statistic is greater than 1.96.}

\item{outlier.enabled}{\code{logical}. If \code{TRUE}, the automatic detection of outliers is enabled in the defined time span.

The time span of the series to be searched for outliers is controlled by the following six variables:
\code{outlier.from, outlier.to, outlier.first, outlier.last, outlier.exclFirst} and \code{outlier.exclLast};
where \code{outlier.from} and \code{outlier.to} have priority over the remaining span control variables,
\code{outlier.last} and \code{outlier.first} have priority over \code{outlier.exclFirst} and \code{outlier.exclLast},
and \code{outlier.last} has priority over \code{outlier.first}.}

\item{outlier.from}{a character in format "YYYY-MM-DD" indicating the start of the time span (e.g. "1900-01-01").
It can be combined with \code{outlier.to}.}

\item{outlier.to}{a character in format "YYYY-MM-DD" indicating the end of the time span (e.g. "2020-12-31").
It can be combined with \code{outlier.from}.}

\item{outlier.first}{\code{numeric} specifying the number of periods considered at the beginning of the series.}

\item{outlier.last}{\code{numeric} specifying the number of periods considered at the end of the series.}

\item{outlier.exclFirst}{\code{numeric} specifying the number of periods excluded at the beginning of the series. It can be combined with \code{outlier.exclLast}.}

\item{outlier.exclLast}{\code{numeric} specifying the number of periods excluded at the end of the series. It can be combined with \code{outlier.exclFirst}.}

\item{outlier.ao}{\code{logical}. If \code{TRUE}, the automatic detection of additive outliers is enabled (\code{outlier.enabled} must also be set to \code{TRUE}).}

\item{outlier.tc}{\code{logical}. If \code{TRUE}, the automatic detection of transitory changes is enabled (\code{outlier.enabled} must also be set to \code{TRUE}).}

\item{outlier.ls}{\code{logical}. If \code{TRUE}, the automatic detection of level shifts is enabled (\code{outlier.enabled} must also be set to \code{TRUE}).}

\item{outlier.so}{\code{logical}. If \code{TRUE}, the automatic detection of seasonal outliers is enabled (\code{outlier.enabled} must also be set to \code{TRUE}).}

\item{outlier.usedefcv}{\code{logical}. If \code{TRUE}, the critical value for the outliers' detection procedure is automatically determined
by the number of observations in the outlier detection time span. If \code{FALSE}, the procedure uses the entered critical value (\code{outlier.cv}).}

\item{outlier.cv}{\code{numeric}. The entered critical value for the outliers' detection procedure. The modification of this variable
is only taken in to account when \code{outlier.usedefcv} is set to \code{FALSE}.}

\item{outlier.eml}{\code{logical} for the exact likelihood estimation method. It controls the method applied for a parameter estimation
in the intermediate steps of the automatic detection and correction of outliers. If \code{TRUE}, an exact likelihood estimation method is used.
When \code{FALSE}, the fast Hannan-Rissanen method is used.}

\item{outlier.tcrate}{\code{numeric}. The rate of decay for the transitory change outlier.}

\item{automdl.enabled}{\code{logical}. If \code{TRUE}, the automatic modelling of the ARIMA model is enabled.
If \code{FALSE}, the parameters of the ARIMA model can be specified.

Control variables for the automatic modelling of the ARIMA model (\code{automdl.enabled} is set to \code{TRUE}):}

\item{automdl.acceptdefault}{\code{logical}. If \code{TRUE}, the default model (ARIMA(0,1,1)(0,1,1)) may be chosen in the first step
of the automatic model identification. If the Ljung-Box Q statistics for the residuals is acceptable, the default model is accepted
and no further attempt will be made to identify another model.}

\item{automdl.cancel}{\code{numeric}, the cancellation limit. If the difference in moduli of an AR and an MA roots (when estimating ARIMA(1,0,1)(1,0,1) models
in the second step of the automatic identification of the differencing orders) is smaller than the cancellation limit, the two roots are assumed equal and canceled out.}

\item{automdl.ub1}{\code{numeric}, the first unit root limit. It is the threshold value for the initial unit root test in the automatic differencing procedure.
When one of the roots in the estimation of the ARIMA(2,0,0)(1,0,0) plus mean model, performed in the first step of the automatic model identification procedure,
is larger than first unit root limit in modulus, it is set equal to unity.}

\item{automdl.ub2}{\code{numeric}, the second unit root limit. When one of the roots in the estimation of the ARIMA(1,0,1)(1,0,1) plus mean model,
which is performed in the second step of the automatic model identification procedure, is larger than second unit root limit in modulus,
it is checked if there is a common factor in the corresponding AR and MA polynomials of the ARMA model that can be canceled (see \code{automdl.cancel}).
If there is no cancellation, the AR root is set equal to unity (i.e. the differencing order changes).}

\item{automdl.armalimit}{\code{numeric}, the arma limit. It is the threshold value for t-statistics of ARMA coefficients and the constant term used
for the final test of model parsimony. If the highest order ARMA coefficient has a t-value smaller than this value in magnitude, the order of the model is reduced.
If the constant term has a t-value smaller than the ARMA limit in magnitude, it is removed from the set of regressors.}

\item{automdl.reducecv}{\code{numeric}, ReduceCV. The percentage by which the outlier critical value will be reduced
when an identified model is found to have a Ljung-Box statistic with an unacceptable confidence coefficient.
The parameter should be between 0 and 1, and will only be active when automatic outlier identification is enabled.
The reduced critical value will be set to (1-ReduceCV)xCV, where CV is the original critical value.}

\item{automdl.ljungboxlimit}{\code{numeric}, the Ljung Box limit, setting the acceptance criterion for the confidence intervals of the Ljung-Box Q statistic.
If the LjungBox Q statistics for the residuals of a final model is greater than Ljung Box limit, then the model is rejected, the outlier critical value is reduced,
and model and outlier identification (if specified) is redone with a reduced value.}

\item{automdl.compare}{\code{logical}. If \code{TRUE}, the program compares the model identified by the automatic procedure to the default model (ARIMA(0,1,1)(0,1,1))
and the model with the best fit is selected. Criteria considered are residual diagnostics, the model structure and the number of outliers.

Control variables for the non-automatic modelling of the ARIMA model (\code{automdl.enabled} is set to \code{FALSE}):}

\item{arima.mu}{\code{logical}. If \code{TRUE}, the mean is considered as part of the ARIMA model.}

\item{arima.p}{\code{numeric}. The order of the non-seasonal autoregressive (AR) polynomial.}

\item{arima.d}{\code{numeric}. The regular differencing order.}

\item{arima.q}{\code{numeric}. The order of the non-seasonal moving average (MA) polynomial.}

\item{arima.bp}{\code{numeric}. The order of the seasonal autoregressive (AR) polynomial.}

\item{arima.bd}{\code{numeric}. The seasonal differencing order.}

\item{arima.bq}{\code{numeric}. The order of the seasonal moving average (MA) polynomial.

Control variables for the user-defined ARMA coefficients. Such coefficients can be defined for the regular and seasonal autoregressive (AR) polynomials
and moving average (MA) polynomials. The model considers the coefficients only if the procedure for their estimation (\code{arima.coefType}) is provided,
and the number of provided coefficients matches the sum of (regular and seasonal) AR and MA orders (\code{p,q,bp,bq}).}

\item{arima.coefEnabled}{\code{logical}. If \code{TRUE}, the program uses the user-defined ARMA coefficients.}

\item{arima.coef}{a vector providing the coefficients for the regular and seasonal AR and MA polynomials.
The length of the vector must be equal to the sum of the regular and seasonal AR and MA orders. The coefficients shall be provided in the following order:
regular AR (\emph{Phi} - \code{p} elements), regular MA  (\emph{Theta} - \code{q} elements), seasonal AR (\emph{BPhi} - \code{bp} elements)
and seasonal MA (\emph{BTheta} - \code{bq} elements).
E.g.: \code{arima.coef=c(0.6,0.7)} with \code{arima.p=1, arima.q=0,arima.bp=1} and \code{arima.bq=0}.}

\item{arima.coefType}{avector defining the ARMA coefficients estimation procedure. Possible procedures are:
\code{"Undefined"} = no use of user-defined input (i.e. coefficients are estimated),
\code{"Fixed"} = fixes the coefficients at the value provided by the user,
\code{"Initial"} = the value defined by the user is used as initial condition.
For orders for which the coefficients shall not be defined, the \code{arima.coef} can be set to \code{NA} or \code{0}
or the \code{arima.coefType} can be set to \code{"Undefined"}.
E.g.: \code{arima.coef = c(-0.8,-0.6,NA)}, \code{arima.coefType = c("Fixed","Fixed","Undefined")}.}

\item{fcst.horizon}{\code{numeric}, the forecasting horizon. The length of the forecasts generated by the RegARIMA model
in periods (positive values) or years (negative values). By default, the program generates two years forecasts (\code{fcst.horizon} set to \code{-2}).}

\item{seats.predictionLength}{integer: the number of forecasts used in the decomposition. Negative values correspond to number of years. Default=-1.}

\item{seats.approx}{character: the approximation mode. When the ARIMA model estimated by TRAMO does not accept an admissible decomposition, SEATS: \code{"None"} - performs an approximation; \code{"Legacy"} - replaces the model with a decomposable one; \code{"Noisy"} - estimates a new model by adding a white noise to the non-admissible model estimated by TRAMO. Default="Legacy".}

\item{seats.trendBoundary}{numeric: the trend boundary. The boundary beyond which an AR root is integrated in the trend component.
If the modulus of the inverse real root is greater than the trend boundary, the AR root is integrated in the trend component.
Below this value, the root is integrated in the transitory component. Possible values [0,1]. Default=0.5.}

\item{seats.seasdBoundary}{numeric: the seasonal boundary. The boundary beyond which a negative AR root is integrated in the seasonal component.  If the modulus of the inverse negative real root is greater (or equal) than Seasonal boundary, the AR root is integrated into the seasonal component. Otherwise the root is integrated into the trend or transitory component. Possible values [0,1]. Default=0.8.}

\item{seats.seasdBoundary1}{numeric: the seasonal boundary (unique). The boundary beyond which a negative AR root is integrated
in the seasonal component, when the root is the unique seasonal root. If the modulus of the inverse negative real root is greater (or equal) than Seasonal boundary, the AR root is integrated into the seasonal component. Otherwise the root is integrated into the trend or transitory component. Possible values [0,1]. Default=0.8.}

\item{seats.seasTol}{numeric: the seasonal tolerance. The tolerance (measured in degrees) to allocate the AR non-real roots
to the seasonal component (if the modulus of the inverse complex AR root is greater than the trend boundary
and the frequency of this root differs from one of the seasonal frequencies by less than Seasonal tolerance)
or the transitory component (otherwise). Possible values in [0,10]. Default value 2.}

\item{seats.maBoundary}{numeric: the MA unit root boundary. When the modulus of an estimated MA root falls in the range (xl, 1),
it is set to xl. Possible values [0.9,1]. Default=0.95.}

\item{seats.method}{character: the estimation method for the unobserved components. The choice can be made from:
\itemize{
\item \code{"Burman"}: the default value. May result in a significant underestimation of the components' standard deviation,
as it may become numerically unstable when some roots of the MA polynomial are near 1;
\item \code{"KalmanSmoother"}: it is not disturbed by the (quasi-) unit roots in MA;
\item \code{"McElroyMatrix"}: it has the same stability issues as the Burman's algorithm.
}}

\item{benchmarking.enabled}{logical: to enable benchmarking. If \code{TRUE}, the benchmarking is enabled.}

\item{benchmarking.target}{character: the target of the benchmarking procedure, which can be the raw series (\code{"Original"}) or the series the adjusted for calendar effects (\code{"CalendarAdjusted"}).}

\item{benchmarking.useforecast}{logical: If \code{TRUE}, the forecasts of the seasonally adjusted variable and of the target variable are used in the benchmarking computation so the benchmarking constrains is also applied to the forecasting period.}

\item{benchmarking.rho}{numeric: the value of the AR(1) parameter (set between 0 and 1) in the function used for benchmarking.}

\item{benchmarking.lambda}{numeric: a parameter used for benchmarking that relatesto to the weights in the regression equation. It is typically equal to 0, 1/2 or 1.}
}
\value{
A two-element list of class \code{c("SA_spec", "TRAMO_SEATS")}, containing:
(1) an object of class \code{c("regarima_spec", "TRAMO_SEATS")} with the RegARIMA model specification,
(2) an object of class \code{c("seats_spec", "data.frame")} with the SEATS algorithm specification.
Each component refers to a different part of the SA model specification, mirroring the arguments of the function
(for details see the function arguments in the description).
Each lowest-level component (except span, pre-specified outliers, user-defined variables and pre-specified ARMA coefficients)
is structured as a data frame with columns denoting different variables of the model specification and rows referring to:
\itemize{
\item first row: the base specification, as provided within the argument \code{spec};
\item second row: user modifications as specified by the remaining arguments of the function (e.g.: \code{arima.d});
\item and third row: the final model specification.

The final specification (third row) shall include user modifications (row two) unless they were wrongly specified.
The pre-specified outliers, user-defined variables and pre-specified ARMA coefficients consist of a list of
\code{Predefined} (base model specification) and \code{Final} values.

\item \code{regarima}: an object of class \code{c("regarima_spec", "TRAMO_SEATS")}. See \emph{Value} of the function \code{\link{regarima_spec_tramoseats}}.

\item \code{seats}: a data.frame of class \code{c("seats_spec", "data.frame")}, containing the \emph{seats} variables in line with
the names of the arguments variables. The final values can also be accessed with the function \code{\link{s_seats}}.
}
}
\description{
Function to create (and/or modify) a \code{c("SA_spec", "TRAMO_SEATS")} class object with the SA model specification
for the TRAMO-SEATS method. It can be done from a pre-defined 'JDemetra+' model specification (a \code{character}),
a previous specification (\code{c("SA_spec", "TRAMO_SEATS")} object) or a seasonal adjustment model (\code{c("SA", "TRAMO_SEATS")} object).
}
\details{
The available predefined 'JDemetra+' model specifications are described in the table below:

\tabular{rrrrrrrr}{
\strong{Identifier} |\tab \strong{Log/level detection} |\tab \strong{Outliers detection} |\tab \strong{Calendar effects} |\tab \strong{ARIMA}\cr
RSA0 |\tab \emph{NA} |\tab \emph{NA} |\tab \emph{NA} |\tab Airline(+mean)\cr
RSA1 |\tab automatic |\tab AO/LS/TC |\tab \emph{NA} |\tab Airline(+mean)\cr
RSA2 |\tab automatic |\tab AO/LS/TC |\tab 2 td vars + Easter |\tab Airline(+mean)\cr
RSA3 |\tab automatic |\tab AO/LS/TC |\tab \emph{NA} |\tab automatic\cr
RSA4 |\tab automatic |\tab AO/LS/TC |\tab 2 td vars + Easter |\tab automatic\cr
RSA5 |\tab automatic |\tab AO/LS/TC |\tab 7 td vars + Easter |\tab automatic\cr
RSAfull |\tab automatic |\tab AO/LS/TC |\tab automatic |\tab automatic
}
}
\examples{
\donttest{
myseries <- ipi_c_eu[, "FR"]
myspec1 <- tramoseats_spec(spec = c("RSAfull"))
mysa1 <- tramoseats(myseries, spec = myspec1)

# To modify a pre-specified model specification
myspec2 <- tramoseats_spec(spec = "RSAfull", tradingdays.mauto = "Unused",
                           tradingdays.option = "WorkingDays",
                           easter.type = "Standard",
                           automdl.enabled = FALSE, arima.mu = TRUE)
mysa2 <- tramoseats(myseries, spec = myspec2)

# To modify the model specification of a "SA" object
myspec3 <- tramoseats_spec(mysa1, tradingdays.mauto = "Unused",
                           tradingdays.option = "WorkingDays",
                           easter.type = "Standard", automdl.enabled = FALSE, arima.mu = TRUE)
mysa3 <- tramoseats(myseries, myspec3)

# To modify the model specification of a "SA_spec" object
myspec4 <- tramoseats_spec(myspec1, tradingdays.mauto = "Unused",
                           tradingdays.option = "WorkingDays",
                           easter.type = "Standard", automdl.enabled = FALSE, arima.mu = TRUE)
mysa4 <- tramoseats(myseries, myspec4)

# Pre-specified outliers
myspec5 <- tramoseats_spec(spec = "RSAfull",
                           usrdef.outliersEnabled = TRUE,
                           usrdef.outliersType = c("LS", "LS"),
                           usrdef.outliersDate = c("2008-10-01", "2003-01-01"),
                           usrdef.outliersCoef = c(10,-8), transform.function = "None")
s_preOut(myspec5)
mysa5 <- tramoseats(myseries, myspec5)
mysa5
s_preOut(mysa5)

# User-defined calendar regressors
var1 <- ts(rnorm(length(myseries))*10, start = start(myseries), frequency = 12)
var2 <- ts(rnorm(length(myseries))*100, start = start(myseries), frequency = 12)
var<- ts.union(var1, var2)

myspec6 <- tramoseats_spec(spec = "RSAfull", tradingdays.option = "UserDefined",
                           usrdef.varEnabled = TRUE, usrdef.var = var,
                           usrdef.varType = c("Calendar", "Calendar"))
s_preVar(myspec6)
mysa6 <- tramoseats(myseries, myspec6)

myspec7 <- tramoseats_spec(spec = "RSAfull", usrdef.varEnabled = TRUE,
                           usrdef.var = var, usrdef.varCoef = c(17,-1),
                           transform.function = "None")
mysa7 <- tramoseats(myseries, myspec7)

# Pre-specified ARMA coefficients
myspec8 <- tramoseats_spec(spec = "RSAfull",
                           arima.coefEnabled = TRUE, automdl.enabled = FALSE,
                           arima.p = 2, arima.q = 0,
                           arima.bp = 1, arima.bq = 1,
                           arima.coef = c(-0.12, -0.12, -0.3, -0.99),
                           arima.coefType = rep("Fixed", 4))
mysa8 <- tramoseats(myseries, myspec8)
mysa8
s_arimaCoef(myspec8)
s_arimaCoef(mysa8)
}
}
\references{
More information and examples related to 'JDemetra+' features in the online documentation:
\url{https://jdemetra-new-documentation.netlify.app/}
}
\seealso{
\code{\link{tramoseats}}
}
