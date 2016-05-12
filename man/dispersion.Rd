%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the dispersion function

\name{dispersion}
\alias{dispersion}
\title{Dispersion analysis}
\concept{Hurst coefficient estimation}
\usage{dispersion(x, front=FALSE)}
\description{Dispersion analysis measures the standard deviation of aggregated means of a
time series taken over logarithmically distributed scales. Dispersion analysis is
designed for the analysis of fractional Gaussian noise and should not be used for
analyzing fractional Brownian motion.}

\arguments{
\item{x}{a numeric vector or \code{signalSeries} object containing a uniformly sampled real-valued time series.}
\item{front}{a logical value. If \code{TRUE}, the aggregation is started from the
beginning of the time series so that the first points will be included in the result. Otherwise,
the aggregation is shifted to include the end of the series. Default: \code{FALSE}.}
}

\value{
a list containing the scale and dispersion analysis statistic vectors.
}
\references{
Bassingthwaighte, J. B., and G. M. Raymond.
\emph{Evaluation of the dispersional analysis method for fractal time series},
Annals Biomedical Engineering, \bold{23}, 491--505, 1995.
}

\seealso{
\code{\link{DFA}}, \code{\link{RoverS}}.}

\examples{
set.seed(100)
z <- dispersion(rnorm(1024))
plot(log(z$scale),log(z$sd))
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

