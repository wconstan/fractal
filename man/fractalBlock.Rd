%%  WARNING: This file was automatically generated from the associated 
%%  fra_class.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_class.mid file in the project MID directory. Once the 
%%  fra_class.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the fractalBlock, eda.plot.fractalBlock, plot.fractalBlock, print.fractalBlock functions

\name{fractalBlock}
\alias{fractalBlock}
\alias{eda.plot.fractalBlock}
\alias{plot.fractalBlock}
\alias{print.fractalBlock}
\title{Class constructor for block-dependent estimators for stochastic fractal time series}
\concept{class constructor}
\usage{fractalBlock(domain,estimator, exponent, exponent.name,
    scale, stat, stat.name, detrend, overlap,
    data.name, sum.order, series, logfit, sdf=NULL)}
\description{Class constructor for \code{fractalBlock}.}

\arguments{
\item{domain}{character string defining the domain in which the calculations took place,
e.g., in the time or frequency domain.}

\item{estimator}{character string briefly describing the estimator.}

\item{exponent}{numerical value representing the scaling exponent.}

\item{exponent.name}{character string defining the name of the scaling exponent.}

\item{scale}{numeric vector containing the scales used in the analysis.}

\item{stat}{numeric vector containing the statistic calculated in the analysis.}

\item{stat.name}{character vector describing the name for the calculated statistic.}

\item{detrend}{character string describing any series detrending used as a preprocessive measure.
\code{NULL} values are allowed and signify no detrending.}

\item{overlap}{numeric value on [0,1] defining the fraction of overlap used in adjacent blocks of data
during the aggregation process.}

\item{data.name}{character string defining the name of the input series.}

\item{sum.order}{integer representing the sum order.}

\item{series}{a numeric vector containing the input series.}

\item{logfit}{a linear regression model (such as that output by \code{lm}, \code{lqs}, \code{lmsreg}, or \code{ltsreg})
containing the regression model of the \code{log(scale)} versus \code{log(stat)} data.}
\item{sdf}{spectral density function. Default: \code{NULL}.}
}

\section{S3 METHODS}{
\describe{

\item{eda.plot}{extended data analyis plot of the data. Available options are:
\describe{
\item{cex}{character expansion ala \code{par}. Default: 1.}

\item{col}{line color index ala \code{par}. Default: 2.}}}

\item{plot}{plots a summary of the results. Available options are:
\describe{
\item{pch}{plot character ala \code{par}. Default: 18.}

\item{col}{color index ala \code{par} for a plot of the data. the first two elements are
used to color the data and the regression line, respectively. Default: \code{c(1,8)}.}

\item{lty}{line types (ala \code{par}) for the data and regression line plot, respectively. Default: \code{c(1,1)}.}

\item{grid}{list of grid objects whose default values are
\code{grid=list(lty=2, col=16, density=3), key=TRUE, add=FALSE, cex=1, ...)}.}

\item{...}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints the object. Available options are:
\describe{
\item{justify}{text justification ala \code{prettPrintList}. Default: \code{"left"}.}

\item{sep}{header separator ala \code{prettyPrintList}. Default: \code{":"}.}

\item{n.digits}{number of digits ala \code{prettyPrintList}. Default: 5.}

\item{...}{Additional print arguments sent directly to the \code{prettyPrintList} function).}}}

}
}

\seealso{
\code{\link{hurstBlock}}, \code{\link{DFA}}.}

\examples{
## construct a fractalBlock object 
xvar <- 2^(1:10)
yvar <- 0.3^(1:10)
z <- fractalBlock(domain="time", estimator="estimator", exponent=pi, exponent.name="PI",
    scale=xvar, stat=yvar, stat.name="My Stat",
    detrend=NULL, overlap=0.2, data.name="My Series",
    sum.order=-1, series=rnorm(2^10),
    logfit=lm(y ~ x, data=data.frame(x=log(xvar), y=log(yvar))))

## print the result 
print(z)

## plot the result 
plot(z)
}
\keyword{methods}

