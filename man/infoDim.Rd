%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the infoDim function

\name{infoDim}
\alias{infoDim}
\title{Information dimension}
\concept{chaotic invariant, information dimension}
\usage{infoDim(x, dimension=5, tlag=NULL,
    olag=0, n.density=100, metric=Inf,
    max.neighbors=as.integer(min(c(round(length(x) / 3), 100))),
    n.reference=as.integer(round(length(x) / 20)))}
\description{This function estimates the information dimension by forming a delay embedding
of a time series, calculating related statistical curves (one per embedding
dimension), and subsequently fitting the slopes of these curves on a log-log scale using a robust
linear regression model. If the slopes converge at a given embedding dimension \eqn{E}, then
\eqn{E} is the correct embedding dimension and the (convergent) slope value is an estimate
of the information dimension for the data.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{dimension}{the maximal embedding dimension. Default: \code{5}.}

\item{max.neighbors}{let \eqn{p=k/N} for \eqn{0 < p \le 1}{0 < p <= 1} be the mass density where \eqn{N}
is the number of points in the embedding and \eqn{k} is the number of neighbors found
near an arbitrary reference point in the embedding. The \code{max.neighbors} parameter
defines the maximum value for \eqn{k}, regardless of the required density.
In the case where the number of neighbors \eqn{k} required
to meet the density \eqn{p} exceeds \code{max.neighbors}, then \eqn{k}
is limited to \code{max.neighbors} and (instead) \eqn{N} is decreased accordingly to
\eqn{N'=\lfloor \mbox{max.neighbors} / p \rfloor}{N'=floor(max.neighbors / p)}.
It is important to note that only the database of neighbors (formed by an efficient
kd-tree algorithm) is reduced to \eqn{N'} points while \emph{all} \eqn{N} points in the embedding
are considered as neighbor candidates for any given reference point. The point of all this
is to reduce the computational burden. Setting \code{max.neighbors} to a larger value than
the default will increase the computational burden but will lessen the error in estimating
the average neighborhood radius of all reference points with a (specified) constant neighborhood density.
Default: \code{min(c(round(length(x) / 3), 100))}.}

\item{metric}{the metric used to define the distance between
points in the embedding. Choices are limited to \code{1}, \code{2}, or
\code{Inf} which represent an \eqn{L_1}{L1}, \eqn{L_2}{L2}, and
\eqn{L_\infty}{L-inf} norm, respectively. Default: \code{Inf}.}

\item{n.density}{the number of points to create in developing the density vector.
For a given reference point in the phase space, the density is defined by the
relation \eqn{p=k / N} where \eqn{k} is the number of neighbors in the phase space and \eqn{N}
is the total number of points in the embedding. To obtain the informaiton dimension
statistics, the density is varied logarithmically from \eqn{1/N} to \eqn{1.0}.
Default: \code{100}.}

\item{n.reference}{the number of reference points to use in forming the information dimension
statistic. This argument directly specifies the number of equi-dense neighborhoods to average in
forming the average neighborhood radius statistic. As with the \code{max.neighbors} argument,
increasing \code{n.reference} beyond the default will increase the computational burden at the benefit
of obtaining (perhaps) less variable statistics. Default: \code{round(length(x) / 20)}.}

\item{olag}{the number of points along the trajectory of the
current point that must be exceeded in order for
another point in the phase space to be considered
a neighbor candidate. This argument is used
to help attenuate temporal correlation in the
the embedding which can lead to spuriously low
correlation dimension estimates. The orbital lag
must be positive or zero. Default: \code{length(x)/10} or \code{500}, whichever is smaller.}

\item{tlag}{the time delay between coordinates. Default: the decorrelation time of the autocorrelation function.}
}

\value{
an object of class \code{chaoticInvariant}.
}

\section{S3 METHODS}{
\describe{

\item{eda.plot}{plots an extended data analysis plot, which graphically summarizes
the process of obtaining a information dimension estimate. A time history,
phase plane embeddding, information dimension curves, and the slopes of information dimension
curves as a function of scale are plotted.}

\item{plot}{plots the information dimension curves on a log-log scale. The following
options may be used to adjust the plot components:

\describe{
\item{type}{Character string denoting the type of data to be plotted. The \code{"stat"} option
plots the information dimension curves while the \code{"dstat"} option plots a 3-point estimate
of the derivatives of the information dimension curves. The \code{"slope"} option plots the estimated
slope of the information dimension curves as a function of embedding dimension. Default: \code{"stat"}.}

\item{fit}{Logical flag. If \code{TRUE}, a regression line is overlaid for each curve. Default: \code{TRUE}.}

\item{grid}{Logical flag. If \code{TRUE}, a grid is overlaid on the plot. Default: \code{TRUE}.}

\item{legend}{Logical flag. If \code{TRUE}, a legend of the estimated slopes as a function of
embedding dimension is displayed. Default: \code{TRUE}.}

\item{...}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints a qualitiative summary of the results.}

}
}

\details{
%
The information dimension (\eqn{D_1}{D1}) is one of an infinite
number of fractal dimensions of a chaotic system.
For generalized fractal dimension estimations,
correlation integral
moments are determined as an average of the contents of
neighbohoods in the phase space of equal radius eps.
Using this approach. the information dimension
for a given embedding dimension \eqn{E} is estimated via
\eqn{D_1(E)=<\ln(p)> / \ln(\varepsilon)}{D1(E)=< ln(p) > / ln(eps)}
in the limit as \eqn{\varepsilon}{eps} approaches zero,
where \eqn{\varepsilon}{eps} is the radius of an E-dimensional hypersphere,
p is the density (also known as the mass fraction),
and \eqn{<\ln(p)>}{< ln(p) >} is the average Shannon information needed
to specify an arbitrary point in the phase space with
accuracy \eqn{\varepsilon}{eps}.

Alternatively, the neighborhoods can be constructed with
variable radii but with constant density. The scaling behavior
of the average radii of these neighborhoods as a function of density
is then used to estimate the fractal dimensions.
In this function, we use this constant density approach
to calculate the statistics for estimating the information
dimension.

For single variable time series, the
phase space is approximated with a delay embedding and
\eqn{D_1(E)}{D1(E)} is thus estimated over statistics gathered for
dimensions \eqn{1,\ldots,E}{1,...,E}. For chaotic
systems, these statistics will `saturate' at a finite
embedding dimension, revealing both the (estimated)
information dimension and an appropriate
embedding dimension for the system. A linear regression
scheme should be to estimate the  \eqn{D_1(E)}{D1(E)} using the
statistics returned by this function.
}
\references{
Peter Grassberger and Itamar Procaccia (1983),
Measuring the strangeness of strange attractors,
\emph{Physica D}, \bold{9}, 189--208.

Holger Kantz and Thomas Schreiber (1997),
\emph{Nonlinear Time Series Analysis},
Cambridge University Press.
}

\seealso{
\code{\link{corrDim}}, \code{\link{embedSeries}}, \code{\link{timeLag}}, \code{\link{chaoticInvariant}}, \code{\link{lyapunov}}, \code{\link{poincareMap}}, \code{\link{spaceTime}}, \code{\link{findNeighbors}}, \code{\link{determinism}}.}

\examples{
## calculate the information dimension estimates 
## for chaotic beam data using a delay 
## embedding for dimensions 1 through 10 
beam.d1 <- infoDim(beamchaos, dim=10)

## print a summary of the results 
print(beam.d1)

## plot the information dimension curves without 
## regression lines 
plot(beam.d1, fit=FALSE, legend=FALSE)

## plot an extended data analysis plot 
eda.plot(beam.d1)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

