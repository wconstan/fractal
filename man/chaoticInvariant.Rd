%%  WARNING: This file was automatically generated from the associated 
%%  fra_class.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_class.mid file in the project MID directory. Once the 
%%  fra_class.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the chaoticInvariant, eda.plot.chaoticInvariant, plot.chaoticInvariant, print.chaoticInvariant, print.summary.chaoticInvariant functions

\name{chaoticInvariant}
\alias{chaoticInvariant}
\alias{eda.plot.chaoticInvariant}
\alias{plot.chaoticInvariant}
\alias{print.chaoticInvariant}
\alias{print.summary.chaoticInvariant}
\title{Class for chaotic invariant objects}
\concept{class constructor}
\description{Class constructor for \code{chaoticInvariant}.}


\section{S3 METHODS}{
\describe{

\item{eda.plot}{plots an extended data analysis plot, which graphically summarizes
the process of obtaining a correlation dimension estimate. A time history,
phase plane embeddding, correlation summation curves, and the slopes of correlation summation
curves as a function of scale are plotted.}

\item{plot}{plots the correlation summation curves on a log-log scale. The following
options may be used to adjust the plot components:

\describe{
\item{type}{Character string denoting the type of data to be plotted. The \code{"stat"} option
plots the correlation summation curves while the \code{"dstat"} option plots a 3-point estimate
of the derivatives of the correlation summation curves. The \code{"slope"} option plots the estimated
slope of the correlation summation curves as a function of embedding dimension. Default: \code{"stat"}.}

\item{fit}{Logical flag. If \code{TRUE}, a regression line is overlaid for each curve. Default: \code{TRUE}.}

\item{grid}{Logical flag. If \code{TRUE}, a grid is overlaid on the plot. Default: \code{TRUE}.}

\item{legend}{Logical flag. If \code{TRUE}, a legend of the estimated slopes as a function of
embedding dimension is displayed. Default: \code{TRUE}.}

\item{...}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints a qualitiative summary of the results.}

}
}

\seealso{
\code{\link{infoDim}}, \code{\link{corrDim}}, \code{\link{lyapunov}}.}

\examples{
## create a faux object of class chaoticInvariant 
faux.data <- list(matrix(rnorm(1024), ncol=2), matrix(1:512))
chaoticInvariant(faux.data,
    dimension   = 1:2,
    n.embed     = 10,
    n.reference = 50,
    n.neighbor  = 35,
    tlag        = 10,
    olag        = 15,
    resolution  = 2,
    series.name = "my series",
    series      = 1:10,
    ylab        = "log2(C2)",
    xlab        = "log2(scale)",
    metric      = Inf,
    invariant   = "correlation dimension")
}
\keyword{methods}

