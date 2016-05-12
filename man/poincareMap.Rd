%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the poincareMap function

\name{poincareMap}
\alias{poincareMap}
\title{Create a Poincare map}
\concept{topologyembedding parameter estimation}
\usage{poincareMap(x, extrema="min", denoise=FALSE)}
\description{Create a map using the extrema of a scalar time series.}

\arguments{
\item{x}{a vector holding a scalar time series.}
\item{denoise}{a logical value. If \code{TRUE}, the data is first denoised via
waveshrink prior to analysis. Default: \code{FALSE}.}

\item{extrema}{the type of extrema desired. May be "min" for
minima, "max" for maxima, or "all" for both maxima and minima. Default: \code{"min"}.}
}

\value{
a list where the first element (\code{location}) is a vector containing the
temporal locations of the extrema values, with respect to
sample numbers \eqn{1,\ldots,N}{1,...N}, where \eqn{N} is the length of the original
time series. The second element (\code{amplitude}) is a vector containing the extrema
amplitudes.
}
\details{
%
This function finds the extrema of a scalar time series to form a
map. The time series is assumed to be a uniform sampling of
\eqn{s(t)}{s(t)},
where \eqn{s(t)}{s(t)} is a (possibly noisy) measurement from a
deterministic
non-linear system. It is known that
\eqn{s'(t),$ $s''(t),\,\ldots}{s'(t), s''(t), ...} are legitimate
coordinate vectors in the phase space. Hence the hyperplane given by
\eqn{s'(t)=0}{s'(t)=0} may be used as a Poincare surface of
section. The
intersections with this plane are exactly the extrema of the time
series. The time series minima (or maxima) are the interesections in a
given direction and form a map that may be used to estimate
invariants, e.g., correlation dimension and Lyapunov exponents, of the
underlying non-linear system.

The algorithm used to create a Poincare map is as follows.
\describe{
\item{1}{The first and second derivatives of the resulting series
are approximated via the continuous
wavelet transform (CWT) using the first derivative of a Gaussian as a mother
wavelet filter (see references for details).}

\item{2}{The locations of the
local extrema are then estimated using the standard first and second
derivative tests on the CWT coefficients
at a single and appropriate scale (an appropriate scale is one that is
large enough to smooth out noisy components but not so large as to
the oversmooth the data).}

\item{3}{The extrema locations are then fit with a quadratic
interpolation scheme to estimate the amplitude of the extrema using the
original time series.}}
}
\references{
Holger Kantz and Thomas Schreiber, \emph{Nonlinear Time Series Analysis},
Cambridge University Press, 1997.
}

\seealso{
\code{\link{embedSeries}}, \code{\link{corrDim}}, \code{\link{infoDim}}.}

\examples{
## Using the third coordinate (\eqn{z} state) of a 
## chaotic Lorenz system, form a discrete map 
## using the series maxima. Embed the resulting 
## extrema in a 2-dimensional delay embedding 
## (with delay=1 for a map). The resulting plot 
## reveals a tent map structure common to 
## Poincare sections of chaotic flows. 
z <- poincareMap(lorenz[,3], extrema="max")
z <- embedSeries(z$amplitude, tlag=1, dimension=2)
plot(z, pch=1, cex=1)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

