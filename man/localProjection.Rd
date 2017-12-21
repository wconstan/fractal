%%  WARNING: This file was automatically generated from the associated 
%%  fra_filt.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_filt.mid file in the project MID directory. Once the 
%%  fra_filt.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the localProjection function

\name{localProjection}
\alias{localProjection}
\title{Time series denoising via a local projection filtering technique}
\concept{nonlinear noise reduction}
\usage{localProjection(x, dimension=3, tlag=timeLag(x), n.neighbor=dimension + 1,
    max.distance=2*stdev(x), metric=Inf, noise.dimension=1, corr.curve=TRUE)}
\description{Given a time series, \eqn{X[t]}, this function performs one iteration
of the local projection filtering algorithm as described in Kantz and
Schreiber [1]. This noise reduction algorithm is summarized in the
following steps:

\describe{
\item{1.}{A time lag embedding of dimension \bold{dimension} is formed using \eqn{X[t]}, where
\bold{dimension} is typically at least twice the dimension at which the
underlying dynamics of \eqn{X[t]} become deterministic. At each
point in the embedding a neighborhood is determined by a given
radius and a given minimum number of required neighbors.}

\item{2.}{Center-of-mass vectors are computed for each embedding point
neighborhood and corresponding covariance matrices are computed
with respect to the center-of-maxx vectors.}

\item{3.}{The eigenvectors corresponding to the \bold{noise.dimension} smallest
eigenvalues are assumed to form a (local) basis for the noise
subspace and the projection of the embedding vector onto these
"noise" eigenvectors is subtracted from the original embedding
vector.}

\item{4.}{The components of the corrected embedding vectors are averaged to
compute the overall correction for each point in the original
time series.}}}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time
series.}
\item{corr.curve}{boolean argument. If true, the center-of-mass
vectors will be corrected for curvature effects. Default: \code{TRUE}.}

\item{dimension}{the dimension of the time lag embedding created from the
given time series. This value should be at least twice the dimension
in which the underlying dynamics of the time series become
deterministic. Default: \code{3}.}

\item{max.distance}{the neighbor search for each embedding point
finds all neighbors within \bold{max.distance}. Default: \code{2*stdev(x)}.}

\item{metric}{the metric used when searching for
neighbors. Supported values are 1 (1-norm), 2 (2-norm), and Inf
(infinity norm). Default: \code{Inf}.}

\item{n.neighbor}{the minimum number of neighbors acceptable to
define a neighborhood for each embedding point. If the neighbor search
using input \bold{max.distance} does not produce at least this number of
neighbors a new search is performed which finds exactly \bold{n.neighbor}
neighbors. Default: \code{dimension + 1}.}

\item{noise.dimension}{the assumed dimension of the (local) noise
subspace. This should be equal to the embedding dimension, \bold{dimension},
minus the dimension where the underlying dynamics of the time series
become deterministic. Default: \code{1}.}

\item{tlag}{the time lag used when creating the time lag
embedding. Default: \code{1}.}
}

\value{
the resulting denoised time series, a vector the
same length as the original time series.
}
\references{
Holger Kantz and Thomas Schreiber (1997), \emph{Nonlinear
Time Series Analysis}, Cambridge University Press.
}

\seealso{
\code{\link{embedSeries}}, \code{\link{medianFilter}}, \code{\link{timeLag}}, \code{\link{FNN}}.}

\examples{
\dontrun{
x <- beamchaos@data
x <- x - mean(x)
sigma <- stdev(x)
xnoise <- x + rnorm(length(x)) * sigma / 3
xclean <- localProjection(xnoise, dimension=7, noise.dimension=5,
    max.distance=3*sigma, n.neighbor=100)

y <- data.frame(xclean, xnoise, x)
stackPlot(x=positions(beamchaos)[], y=y,
    ylab=c("denoised","noisy","original"),
    ylim=range(y))
}
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

