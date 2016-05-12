%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the embedSeries, print.embedSeries, eda.plot.embedSeries, [.embedSeries, plot.embedSeries, as.matrix.embedSeries functions

\name{embedSeries}
\alias{embedSeries}
\alias{print.embedSeries}
\alias{eda.plot.embedSeries}
\alias{[.embedSeries}
\alias{plot.embedSeries}
\alias{as.matrix.embedSeries}
\title{Creates a delay embedding of a single variable time series}
\concept{topologyembedding parameter estimation}
\usage{embedSeries(x, dimension=NULL, tlag=NULL, series.name=NULL)}
\description{Given the time series \eqn{X_t}{X(t)},
the embedding dimension \eqn{E},
and the time delay \eqn{\tau}{tau},
the embedding coordinates are defined as
\eqn{X_t, X_{t-\tau},\ldots,X_{t - (E-1)\tau}}{X(t), X(t + tau), ... , X(t + (E - 1)*tau)}.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{dimension}{the maximal embedding dimension. Default: \code{2}.}

\item{series.name}{a character string defining the name of the input time series. Default: \code{deparseText(substitute(x))}.}

\item{tlag}{the time delay between coordinates. Default: the first zero crossing of the
autocorrelation function of \code{x}.}
}

\value{
an object of class \code{embedSeries}.
}

\section{S3 METHODS}{
\describe{

\item{[}{data access method. Usage: \code{x[1:3,1]}.}

\item{as.matrix}{convert embedding into matrix object. Usage: \code{as.matrix(x)}.}

\item{eda.plot}{creates an extended data analysis plot of the data summarizing
many of its statistical features. Usage: \code{eda.plot(x)}.}

\item{plot}{plots the embedding. For embeddings higher than 3, a spin plot
of the data is generated. Use the buttons on the spin control panel to conrtol the
display. Available options to the plot function are:

\describe{
\item{dim}{The plot dimension. Must be less than or equal
to the maximal embedding dimension (number of columns in the embedding matrix).
Default: the maximal embedding dimension.}

\item{...}{Additional plot arguments (set internally by the \code{par} function).}}


Usage: \code{plot(x)}.}

\item{print}{prints a summary of the embedding. Available options are:
\describe{
\item{...}{Additional print arguments used by the standard \code{print} function.}}


Usage: \code{print(x)}.}

}
}

\seealso{
\code{\link{timeLag}}, \code{\link{FNN}}, \code{\link{corrDim}}, \code{\link{determinism}}.}

\examples{
## embed the beamchaos series in 10 dimensions 
## using a time lag of 15. 
z <- embedSeries(beamchaos, tlag=15, dim=10)

## plot the attractor in the phase space 
\dontrun{plot(z)}

## plot the embedding projected down to two 
## dimensions 
plot(z, dim=2)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

