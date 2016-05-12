%%  WARNING: This file was automatically generated from the associated 
%%  fra_filt.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_filt.mid file in the project MID directory. Once the 
%%  fra_filt.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the medianFilter function

\name{medianFilter}
\alias{medianFilter}
\title{Median filtering of a time series}
\concept{nonlinear noise reduction, median}
\usage{medianFilter(x, order=2)}
\description{Given a filter order \eqn{P}, the output of applying a median filter to a
time series \eqn{X[t]} for \eqn{t=0, \ldots, N - 1}{t=0, ..., N - 1} is

\describe{
\item{P odd:}{\eqn{Y[ k ]=\mbox{median}(X[ k - (P - 1) / 2, ...,   k + (P - 1) / 2 ])}{Y[ k ]=median(X[ k - (P - 1) / 2, ...,   k + (P - 1) / 2 ])}}

\item{P even:}{\eqn{Y[ k ]=\mbox{median}(X[ k - P / 2, ...,   k + P / 2 - 1 ])}{Y[ k ]=median(X[ k - P / 2, ...,   k + P / 2 - 1 ])}}}


for \eqn{k=0, \ldots, N - 1}{k=0, ..., N - 1}.
Thus, median filtering replaces the \eqn{k^{\mbox{th}}}{kth}
value of the time series with the median of the time series
over an \eqn{P}-point window centered about point \eqn{k}.
In the case where a portion of the window exceeds the boundaries
of the time series, the values outside the boundaries are ignored in
the median value calculation.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{order}{the median filter order. This argument defines the
size of the windows over which the median values are calculated. The
filter order must be positive and less than twice the length of the
time series. Default: \code{2}.}
}

\value{
a vector containing the result and of the same length as
the original time series.
}
\seealso{
\code{\link{localProjection}}.}

\examples{
x      <- beamchaos@data
x      <- x - mean(x)
sigma  <- stdev(x)
xnoise <- x + rnorm(length(x)) * sigma / 3
xclean <- medianFilter(xnoise, order=10)
y <- data.frame(xclean, xnoise, x)

stackPlot(x=positions(beamchaos)[], y=y,
    ylab=c("denoised","noisy","original"),
    ylim=range(y))
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

