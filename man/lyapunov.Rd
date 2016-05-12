%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lyapunov, plot.lyapunov, print.lyapunov, print.summary.lyapunov, summary.lyapunov functions

\name{lyapunov}
\alias{lyapunov}
\alias{plot.lyapunov}
\alias{print.lyapunov}
\alias{print.summary.lyapunov}
\alias{summary.lyapunov}
\title{Local-Global Lyapunov Spectrum Estimation}
\concept{class constructorchaotic invariant, Lyapunov spectrum}
\usage{lyapunov(x, tlag=NULL, dimension=5, local.dimension=3,
    reference=NULL, n.reference=NULL, olag=2,
    sampling.interval=NULL, polynomial.order=3, metric=Inf, scale=NULL)}
\description{Estimates the local Lyapunov exponents over a range
of user supplied scales and dimensions. The local Lyapunov
spectrum is calculated as follows:
\describe{
\item{1}{A delayed embedding of the input time series is formed.}

\item{2}{For each global reference point (specified
by an intger index in the reference matrix) a local Lyapunov
spectrum is calculated, one exponent for each dimension
from 1 to \code{local.dimension} and for each (integer) scale
specified by the \code{scale} vector. As the scales grow larger,
the Lyapunov exponent estimates tend toward asymptotic
values corresponding to the global Lyapunov exponents. The
details of how each local spectrum is estimated is given below.}

\item{3}{The local spectra are then averaged over each global reference
point to stabilize the results.}}


Each local spectrum is obtained by estimating the eigenvalues
of the so-called Oseledec matrix, which is formed through
a matrix product of successive local Jacobians with the transpose
of the Jacobians. The number of Jacobians in the product is equivalent
to the scale. Each Jacobian is formed by fitting a local neighborhood
of points (relative to a some reference point) with a multidimensional
polynomial of order \code{polynomial.order}. The number of neighbors found
for each reference point in the embedding is chosen to be twice the
polynomial order for numerical stability. To further stabilize the results,
a local Lyapunov spectrum is formed for each local \code{reference} point.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{dimension}{an integer representing the embedding dimension. Default: \code{5}.}

\item{local.dimension}{an integer representing the dimension (number of)
local Lyapunov exponents to estimate. This value must be less than
or equal to the embedding dimension.
Default: \code{3}.}

\item{metric}{the metric used to define the distance between
points in the embedding. Choices are limited to \code{1}, \code{2}, or
\code{Inf} which represent an \eqn{L_1}{L1}, \eqn{L_2}{L2}, and
\eqn{L_\infty}{L-inf} norm, respectively. Default: \code{Inf}.}

\item{n.reference}{the number of neighbors to use in
in developing the kd-tree (used as a quick means
of finding nearest neighbors in the phase space).
These neighbors are collected relative to the reference
points. This value must be greater than 10.
Default: \code{min(as.integer(round(length(x)/20)), 100)}.}

\item{olag}{the number of points along the trajectory of the
current point that must be exceeded in order for
another point in the phase space to be considered
a neighbor candidate. This argument is used
to help attenuate temporal correlation in the
the embedding which can lead to spuriously low
correlation dimension estimates. The orbital lag
must be positive or zero. Default: \code{length(x)/10} or \code{500}, whichever is smaller.}

\item{polynomial.order}{the order of the polynomial to use in fitting data
around reference points in the phase space. This poloynomial
fit will be used to form the Jacobians which are
in  turn used to calcualte the Lypaunov exponents. Default: \code{3}.}

\item{reference}{a vector of integers representing the indices
of global reference points to use in estimating the local Lyapunov spectrum.
A local spectrum is estimated around each global reference point,
and all the local spectra are then averaged to stabilize the results.
These global reference points should be
chosen such that they are far apart in time. Default: Five
indices uniformly distributed on the interval [1,M],
where M = Ne - max(scale) - n.reference - 2 and Ne is the
number of embedding points.}

\item{sampling.interval}{a numeric value representing the interval
between samples in the input time series. Default: \code{deltat(x)}.}

\item{scale}{a vector of integers defining the scales over which
the local Lyapunov exponents are to be estimated. As this scale
increases, one expects the local Lyapunov exponent estimates to converge
towards the global estimates. All scales must be greater than one.
Default: as.integer(2\eqn{\mbox{\textasciicircum}}{^}(seq(min(floor(logb(scale.max,2)) - 2 , 10)) - 1))
where scale.max = Ne - 2 - \code{n.reference}.}

\item{tlag}{the time delay between coordinates. Default: the decorrelation time of the autocorrelation function.}
}

\value{
an object of class \code{FNN}.
}

\section{S3 METHODS}{
\describe{

\item{plot}{plots a summary of the results. Available options are:
\describe{
\item{...}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints a summary of the results. Available options are:
\describe{
\item{...}{Additional print arguments used by the standard \code{print} function.}}}

\item{summary}{summarizes the results.}

}
}

\references{
P. Bryant, R. Brown, and H.D.I. Abarbanel (1990),
Lyapunov exponents from observed time series,
\emph{Physical Review Letters}, \bold{65}(13), 1523--1526.

H.D.I. Abarbanel, R. Brown, J.J. Sidorowich, and L. Tsimring (1993),
The analysis of observed chaotic data in physical systems,
\emph{Reviews of Modern Physics}, \bold{65}(4), 1331--1392.
}

\seealso{
\code{\link{embedSeries}}, \code{\link{infoDim}}, \code{\link{corrDim}}, \code{\link{timeLag}}, \code{\link{FNN}}.}

\examples{
## Calculate the local Lyapunov spectrum for the 
## beamchaos series 
z <- lyapunov(beamchaos)

## print the results 
print(z)

## summarize the results 
summary(z)

## plot the results 
plot(z)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

