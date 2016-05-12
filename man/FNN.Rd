%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the FNN, plot.FNN, print.FNN functions

\name{FNN}
\alias{FNN}
\alias{plot.FNN}
\alias{print.FNN}
\title{Estimation of the proper embedding dimension for a single-variable time series}
\concept{class constructorembedding parameter estimationtopology}
\usage{FNN(x, dimension=5, tlag=NULL, rtol=10, atol=2, olag=1)}
\description{Invokes the method of False Nearest Neighbors (FNN) to estimate the
minimal embedding dimension of a multivariate data set.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{atol}{neighbor tolerance based on attractor size.
If the Euclidean distance between two neighbor candidates is
\code{Atol} times larger the estimated
"size" of the attractor, then those neighbors are declared as
false neighbors. Default: \code{2}.}

\item{dimension}{the maximal embedding dimension. Default: \code{5}.}

\item{olag}{orbital lag. The number of points along the
trajectory (orbit) of the current point
that must be exceeded in order for
another point in the phase space to be considered
a neighbor candidate. This argument is used
to help attenuate temporal correlation in the
the embedding which can lead to spuriously low
minimal embedding dimension estimates. The orbital lag
must be positive or zero. Default: \code{0}.}

\item{rtol}{false neighbor Euclidean distance tolerance.
If the ratio of the Euclidean distances between neighbor candidates
in successive embedding dimensions exceeds \code{Rtol},
then those neighbors are declared as false neighbors. For example,
if \code{Rtol=5} neighbor candidates that are separated
five times more so than in the previous embedding dimension are
declared false neighbors. Default: \code{10}.}

\item{tlag}{the time delay between coordinates.
Default: the decorrelation time of the autocorrelation function.}
}

\value{
an object of class \code{FNN}.
}

\section{S3 METHODS}{
\describe{

\item{plot}{plots a summary of the results. Available options are:
\describe{
\item{xlab}{a character string defining the x-axis label. Default: \code{"Embedding Dimension"}.}

\item{ylab}{a character string defining the y-axis label. Default: \code{"FNN percentage"}.}

\item{\code{...}}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints a summary of the results. Available options are:
\describe{
\item{...}{Additional print arguments used by the standard \code{print} function.}}}

}
}

\references{
M. B. Kennel, R. Brown, and H. D. I. Abarbanel (1992),
Determining embedding dimension for phase-space reconstruction
using a geometrical construction,
\emph{Physical Review A}, \bold{45}(6), 3403--3411.

Fredkin, D. R., and Rice, J. A. (1995),
Method of false nearest neighbors: A cautionary note,
\emph{Physical Review E}, \bold{51}(4), 2950--2954.
}

\seealso{
\code{\link{FNS}}, \code{\link{embedSeries}}, \code{\link{infoDim}}, \code{\link{corrDim}}, \code{\link{timeLag}}, \code{\link{determinism}}.}

\examples{
## perform False Nearest Neighbors tests on 
## chaotic beam data for embedding dimensions 1 
## through 10, using a time delay embedding 
## with a time lag of 10 and an orbital lag of 
## 15 
x <- FNN(beamchaos, tlag=10, olag=15 )

## print the results 
print(x)

## plot the results 
plot(x)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

