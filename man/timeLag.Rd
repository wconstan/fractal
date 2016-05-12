%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the timeLag function

\name{timeLag}
\alias{timeLag}
\title{Estimate the proper time lag for single variable delay embeddings}
\concept{topologyaverage mutual informationtime lag estimationembedding parameter estimation}
\usage{timeLag(x, method="acfzero", plot.data=FALSE)}
\description{Given the time series \eqn{X_t}{X(t)},
the embedding dimension \eqn{E},
and the time lag \eqn{\tau}{tau},
the embedding coordinates are defined as
\eqn{X_t$, $X_{t-\tau}$, $\ldots$, $X_{t - (E-1) \tau}}{X(t), X(t + tau), ... , X(t + (E - 1)*tau)}.
This function can be used to estimate the time lag \eqn{\tau}{tau} using
a variety of statistical methods.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{method}{character string denoting the method to use in estimating
the time delay. Supported methods are:
\describe{
\item{\code{"acfzero"}}{First zero crossing of the autocorrelation function.}

\item{\code{"acfdecor"}}{First \eqn{1/\exp}{1/e} of the autocorrelation function.}

\item{\code{"acfnadir"}}{First nadir of the autocorrelation function.}

\item{\code{"mutual"}}{First nadir of the average mutual information function.}}

Default: \code{"acfzero"}.}

\item{plot.data}{a logical value. If \code{TRUE}, a plot of the time lag selection process is displayed. Default: \code{FALSE}.}
}

\value{
an integer representing the the estimated time lag.
}
\details{
%
Currently, there exists no single method which yields
an optimal time lag estimation although there are some basic
criteria that are used: if the lag is chosen too
small, the coordinates will be too highly correlated and the embedding
will cluster tightly around the diagonal in the phase space. If the
lag is chosen too large, the resulting coordinates may be almost uncorrelated
and the resulting embedding may become unduly complicated, even
if the underlying attractor is not. The goal is to find a lag which
falls in-between these scenarios.

In addition the autocorrelation-based methods this function supports
an estimation method based on the time-delayed mutual infomation (TDMI),
which can be thought of as a nonlinear generalization of the autocorrelation
function. For a random process \eqn{X_t}{X(t)} the TDMI,
\eqn{I(\tau)}{I(tau)}, is a measure of the information about
\eqn{X_{t+\tau}}{X(t+tau)} contained in \eqn{X_t}{X(t)}. The first
nadir of \eqn{I(\tau)}{I(tau)} gives the delay,
\eqn{\tau_0}{tau0}, such that \eqn{X_{t+\tau_0}}{X(t+tau0)}
adds maximal information to that already known from
\eqn{X_t}{X(t)}. This \eqn{\tau_0}{tau0} is returned as an
estimate of the proper time lag for a delay embedding of the given
time series.
}
\references{
Holger Kantz and Thomas Schreiber (1997),
\emph{Nonlinear Time Series Analysis},
Cambridge University Press.

J.B. Bassingthwaighte and L.S. Liebovitch and B.J. West (1994),
\emph{Fractal Physiology}, Oxford University Press, New York.

A.M. Fraser and H.L. Swinney (1986),
Independent coordinates for strange attractors from mutual information,
\emph{Physical Review A}, \bold{33}, 1134--40.

M. Casdagli, S. Eubank, J. D. Farmer, and J. Gibson (1991),
State Space Reconstruction in the Presence of Noise, \emph{Physica D}, \bold{51}, 52- 98.
}

\seealso{
\code{\link{embedSeries}}, \code{\link{infoDim}}, \code{\link{corrDim}}, \code{\link{lyapunov}}, \code{\link{findNeighbors}}, \code{\link{KDE}}, \code{\link{determinism}}.}

\examples{
## estimate the proper time lag for an embedding 
## of the beamchaos data using the first zero 
## crossing of the ACF 
as.numeric(timeLag(beamchaos, method="acfzero", plot=TRUE))
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

