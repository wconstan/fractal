%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the FNS function

\name{FNS}
\alias{FNS}
\title{Estimation of the proper embedding dimension for a single-variable time series}
\concept{class constructorembedding parameter estimationtopology}
\usage{FNS(x, dimension=5, tlag=NULL, atol=1,
    image.tol=1, olag=1)}
\description{Invokes the method of False Nearest Strands (FNS) to estimate the
minimal embedding dimension of a multivariate data set.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{atol}{fNS statitstic threshold.
Default: \code{1}.}

\item{dimension}{the maximal embedding dimension. Default: \code{5}.}

\item{image.tol}{an integer defining the so-called iterate tolerance. Nearest
neighbor pairs (i,J(i)) are separated in time by a point index span dindex = |i-J(i)|,
where J(i) represents the index of the nearest neighbor to point i. If a point near i,
say k points away also has a nearest neighbor such that |k - J(k)| = dindex +/- M,
where M is the iterate tolerance, then the pair (k, J(k)) is added to the current
strand. Typically, M=0 or M=1. If M=0, then the difference in index must be exactly
the same for each pair included in the strand. If M=1, the index difference is allowed
to be 1 point off from the reference pair.  Default: \code{1}.}

\item{olag}{orbital lag. The number of points along the
trajectory (orbit) of the current point
that must be exceeded in order for
another point in the phase space to be considered
a neighbor candidate. This argument is used
to help attenuate temporal correlation in the
the embedding which can lead to spuriously low
minimal embedding dimension estimates. The orbital lag
must be positive or zero. Default: \code{1}.}

\item{tlag}{the time delay between coordinates.
Default: the decorrelation time of the autocorrelation function.}
}

\value{
an single-dimensional matrix containing the FNS percentage as a function of embedding dimension.
}
\details{
%
The statistic used for determining a false nearest strand (FNS)
is based on a Euclidean
tolerance supplied by the user (\code{atol}).
Let \eqn{S(d)} be the mean Euclidean distance in the projected \eqn{(d+1)}th coordinate
between strand pairs found to be nearest neighbors in embedding dimension $d$.
If \eqn{S(d) / A > \mbox{atol}}{S(d) / A > atol}, where \eqn{A} is the estimated attractor size, then
the strand is considered to be a false strand. \eqn{A} is typically calculated
to be the sample standard deviation of the original time series.
The \eqn{S(d)} statistic is a measure of the average
additional Euclidean distance we gain by embedding the strand in the next
dimension, and is used to assess when this extra distance
has grown too large, indicating a false strand.
}
\references{
M. B. Kennel and Henry D.I. Abarbanel (2002),
False neighbors and false strands: A reliable minimum embedding dimension algorithm,
\emph{Physical Review E}, \bold{66}, 026209, 1--19.

M. B. Kennel, R. Brown, and H. D. I. Abarbanel (1992),
Determining embedding dimension for phase-space reconstruction
using a geometrical construction,
\emph{Physical Review A}, \bold{45}(6), 3403--3411.

Fredkin, D. R., and Rice, J. A. (1995),
Method of false nearest neighbors: A cautionary note,
\emph{Physical Review E}, \bold{51}(4), 2950--2954.
}

\seealso{
\code{\link{FNN}}, \code{\link{embedSeries}}, \code{\link{infoDim}}, \code{\link{corrDim}}, \code{\link{timeLag}}, \code{\link{determinism}}.}

\examples{
## perform False Nearest Strands tests on chaotic 
## beam data for embedding dimensions 1 through 
## 10, using a time delay embedding with a time 
## lag of 10 and an orbital lag of 15 
x <- FNS(beamchaos, dim=10, tlag=10, olag=15)

## print the results 
print(x)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

