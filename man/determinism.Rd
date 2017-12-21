%%  WARNING: This file was automatically generated from the associated 
%%  fra_detm.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_detm.mid file in the project MID directory. Once the 
%%  fra_detm.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the determinism, eda.plot.determinism, plot.determinism, print.determinism, summary.determinism functions

\name{determinism}
\alias{determinism}
\alias{eda.plot.determinism}
\alias{plot.determinism}
\alias{print.determinism}
\alias{summary.determinism}
\title{Detecting determinism in a time series}
\concept{determinism}
\usage{determinism(x, dimension=6, tlag=NULL,
    olag=1, scale.min=NULL, scale.max=NULL,
    resolution=NULL, method="ce",
    n.realization=10, attach.summary=TRUE,
    seed=0)}
\description{Infers the existence of deterministic structure
in a given time series. If fractal strucutre exists, this
function is useful in helping the user decide whether
a deterministic chaotic model or stochastic fractal time series model
is appropriate for their data.}

\arguments{
\item{x}{a numeric vector or matrix containing uniformly-sampled real-valued time series.}
\item{attach.summary}{a logical flag. If \code{TRUE}, a summary of the
results is calculated and attached to returned object as an attribute
named \code{"summary"}. The summary statistics are calculated using the
\code{summary} method. Default: \code{TRUE}.}

\item{dimension}{an integer defining the maximum embedding dimension to use
in analyzing the data. Default: \code{6}.}

\item{method}{a character string representing the method to be used to generate surrogate data. Choices are:
\describe{
\item{\code{"aaft"}}{Theiler's Amplitude Adjusted Fourier Transform.}

\item{\code{"phase"}}{Theiler's phase randomization.}

\item{\code{"ce"}}{Davies and Harte's Circulant Embedding.}

\item{\code{"dh"}}{Davison and Hinkley's phase and amplitude randomization.}}

Default: \code{"ce"}.}

\item{n.realization}{an integer denoting the number of surrogate realizations to create
and analyze for comparison to the ensmeble of E-statistics. Default: \code{10}.}

\item{olag}{the number of points along the trajectory of the
current point that must be exceeded in order for
another point in the phase space to be considered
a neighbor candidate. This argument is used
to help attenuate temporal correlation in the
the embedding which can lead to spuriously low
correlation dimension estimates. The orbital lag
must be positive or zero. Default: \code{length(x)/10} or \code{500}, whichever is smaller.}

\item{resolution}{a numeric value representing the spacing between scales (Euclidean bin size).
Default: \code{diff(range(x))/1000}.}

\item{scale.max}{a numeric value defining the maximum scale over which the results should
be returned. Default: \code{diff(range(x)) * sqrt(dimension)}.}

\item{scale.min}{a numeric value defining the minimum scale over which the results should
be returned. Default: \code{min(diff(sort(x)))/1000}.}

\item{seed}{a positive integer representing the initial seed value for generating
surrogate realizations of the original input time series. These surrogates are used
to collect an ensemble of determinism statistics (see DETAILS section for more information).
If the specified \code{seed} value is positive, the seeds used for generating
the surrogate ensemble will be calculated via
\code{set.seed(seed)};\code{rsample(.Machine\$integer.max, size=n.realization)}.
This argument should only be used (by specifying a positive seed value) if the
user wishes to replicate a particular set of results, such as those illustrated
in the casebook examples. If \code{seed=0}, then the random seeds will be generated
based on the current time. Default: \code{0} (generate the random seeds based on the current time).}

\item{tlag}{the time delay between coordinates.
Default: the decorrelation time of the autocorrelation function.}
}

\value{
an object of class \code{determinism}.
}

\section{S3 METHODS}{
\describe{

\item{eda.plot}{plots a barplot of the determinism level (expressed as a percentage on [0,100])
based on the fraction of overlap between the E-statistics for the original series and that of the ensmeble of surrogates.
The amount of non-overlap is calculated relative to both the first quartile and extreme
values of the E-statistics for the surrogate ensemble.}

\item{plot}{plots the E-statistics at small scales of the original series overlaid
with those of the ensmeble of surrogates (illustrated using boxplots
over a subsampled set of the surrogate E-statistics).}

\item{print}{print a sumamry of the analysis.}

\item{summary}{produces a summary of the E-statistics for use in the \code{print},
and \code{plot}, and \code{eda.plot} methods.}

}
}

\details{
%
This function calculates the so-called delta-epsilon
test for detecting deterministic structure in a time series by exploiting
(possible) continuity of orbits comprising a phase space topology created
by a time-delayed embedding of the original time series.
This phase space continuity is non-existent for stochastic white noise
processes. The delta-epsilon test works by
\describe{
\item{1}{an ensemble
of randomized realizations of the original time series, i.e.,
surrogate data is created.}

\item{2}{an appropriate phase space statistic (called the E-statistic)
is calculated for both the time-delayed embedding of the original
time series and the ensemble of surrogates.}

\item{3}{a comparison of the E-statistic for the original series
and the ensemble of surrogate data is made. If there is a separation of
the original E-statistic from that of the ensemble, it implies the existence
of deterministic structure in the original time series. Conversely,
an overlap of E-statstics implies that the original series cannot be
discriminated from the ensemble of randomized surrogates and thus
it is inferred that the original series is a realization of a random
process.}}


The discriminating E-statistic is calculated as follows:
Define \deqn{\delta _{j,k} = |z_{j} - z_{k}|}{delta(j,k) = |z(j) - z(k)|}
\deqn{\epsilon _{j,k} = |z_{j+ \kappa} - z_{k+\kappa}|}{epsilon(j,k) = |z(j + kappa) - z(k + kappa)|}
\deqn{e(r) \equiv \overline{\epsilon _{j,k}} \qquad\hbox{for $j,k$ s.t. } r
\leq \delta_{j,k} < r + \Delta r
}{e(r) = mean(epsilon(j,k)) over scales r <= delta(j,k) < r + dr}

where \eqn{\delta_{j,k}}{delta(j,k)} is the Euclidean distance (using an infinity-norm metric) between
phase space points \eqn{z_j}{z(j)} and \eqn{z_k}{z(k)}, and \eqn{\epsilon_{j,k}}{epsilon(j,k)}
is the corresponding separation distance between the points at a times \eqn{\kappa}{kappa} points
in the future along their respective orbits. These future points are referred to as \emph{images}
of the original pair. The variable \eqn{\kappa}{kappa} is referred to as the orbital lag.
The increment \eqn{\Delta r}{dr} is the width of a specificed
Euclidean bin size. Given \eqn{\Delta r}{dr}, the distance
\eqn{\delta_{j,k}}{delta(j,k)} is used solely
to identify the proper bin in which to store the image distance \eqn{\epsilon_{j,k}}{epsilon(j,k)}.
The average of each bin forms the \eqn{e(r)} statistic. Finally, the E-statistic is formed
by calculating a cumulative summation over the the \eqn{e(r)} statistic, i.e.,
\deqn{E(r) \equiv \sum \overline{e(r)}. }{E(r) = cumsum(e(r))}

If there exists a distinct separation of the E-statstics for the original time series and
the ensemble of surrogate data, it implies that the signal
is deterministic.
The orbital lag \eqn{\kappa}{kappa} should be chosen large enough to sufficiently
decorrelate the points evaluated along a given orbit.
}
\references{
Kaplan, D. (1994),
\emph{Exceptional Events as Evidence for Determinism},
Physica D, \bold{73}, 38--48.
}

\seealso{
\code{\link{embedSeries}}, \code{\link{timeLag}}, \code{\link{spaceTime}}, \code{\link{surrogate}}.}

\examples{
\dontrun{
## perform a determinism test for the beamchaos 
## series. in order to do so, it is vitally 
## important to provide the proper orbital lag, 
## which can be estimated as the lag value 
## associated with the first common maxima over 
## all contours in a spaceTime plot. 
plot(spaceTime(beamchaos))

## we esimate an appropriate olag of 30, and 
## subsequently perform the deterrminism test 
beam.det <- determinism(beamchaos, olag=30)
print(beam.det)
plot(beam.det)

eda.plot(beam.det)

## perform a similar analysis for a Gaussian white 
## noise realization 
rnorm.det <- determinism(rnorm(1024),olag=1)
print(rnorm.det)
plot(rnorm.det)

eda.plot(rnorm.det)
}
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

