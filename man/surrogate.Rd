%%  WARNING: This file was automatically generated from the associated 
%%  fra_surr.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_surr.mid file in the project MID directory. Once the 
%%  fra_surr.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the surrogate, eda.plot.surrogate, plot.surrogate, print.surrogate functions

\name{surrogate}
\alias{surrogate}
\alias{eda.plot.surrogate}
\alias{plot.surrogate}
\alias{print.surrogate}
\title{Surrogate data generation}
\concept{surrogate data generationsimulationbootstrapping}
\usage{surrogate(x, method="ce", sdf=NULL, seed=0)}
\description{This function can be used to generate surrogate time series via
various frequency domain bootstrapping
techniques. Bootstrapping has been used (in the statistics community)
to assess the sampling variability of certain statistics. The nonlinear
dynamics community typically uses bootstrapping to detect nonlinear structure
in stationary time series. Given a time series, this function is used to
generate surrogate series via Theiler's Amplitude Adjusted Fourier
Transform (AAFT), Theiler's phase randomization, Davies
and Harte's Circulant Embedding (CE) technique, or
Davison and Hinkley's (DH) phase and amplitude randomization technique.

Theiler's techniques produce so-called \emph{constrained realizations}
since some statistical aspect of the original data preserved
(the histogram for the AAFT and the periodogram for the phase randomization).
The other techniques, ciruclant embedding and Davison-Hinkley,
are non-constrained as both the amplitudes and phases
of the original series are randomized.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{method}{a character string representing the method to be used to generate surrogate data. Choices are:
\describe{
\item{\code{"aaft"}}{Theiler's Amplitude Adjusted Fourier Transform.}

\item{\code{"phase"}}{Theiler's phase randomization.}

\item{\code{"ce"}}{Davies and Harte's Circulant Embedding.}

\item{\code{"dh"}}{Davison and Hinkley's phase and amplitude randomization.}}

Default: \code{"ce"}.}

\item{sdf}{an object of class \code{SDF}, containing a single-sided
spectral density function estimation (corresponding to the original data)
over normalized frequencies \eqn{f_k=k/(2N)}{f(k)=k/(2N)}
for \eqn{k=0,\ldots,N}{k=0,...,N} where \eqn{N} is the number
of samples in the original time series. This argument is only
used for the circulant embedding method.
Default: \code{NULL} unless the circulant embedding method is used, and then it is \code{sapa::SDF(x, method="multitaper", recenter=TRUE, taper=h, single.sided=T)} where
\code{h = taper(type="sine", n.sample=N, n.taper=5, norm=TRUE)}.}

\item{seed}{a positive integer representing the initial seed value to use
for the random number generator. If \code{seed=0}, the current time is used
as a means of generating a (unique) seed value. Otherwise, the specified
seed value is used. Default: \code{0}.}
}

\value{
an object of class \code{surrogate}.
}

\section{S3 METHODS}{
\describe{

\item{plot}{plots the surrogate data realizations. The following
options may be used to adjust the plot components:

\describe{
\item{show.}{A character string defining the data to display.
Choices are \code{"series"}, \code{"surrogate"}, or \code{"both"} for plots
corresponding to the original series, surrogate series, or both, respectively.
Default: \code{"surrogate"}.}

\item{type}{Character string denoting the type of data to plot. Options are
\code{"time"} for time history, \code{"sdf"} for a multitaper spectral density function estimation,
\code{"pdf"} for a probability density function estimation, and \code{"lag"} for a two-dimensional embedding (lag plot.
Default: \code{"time"}.}

\item{stack}{A logical flag. If \code{TRUE}, the \code{stackPlot} function is called as opposed to
the default plot function. As \code{stackPlot} requires a common abscissa, this option is only
available for \code{type="time"} (time history) or \code{type="sdf"} (spectral density function plot).
Default: \code{TRUE}.}

\item{xlab}{Character string denoting the x-axis label for
the \code{"time"} and \code{"sdf"} \code{"pdf"} types.
Default: "Time", the series name, and "Frequency (Hz)", respectively.}

\item{ylab}{Character string denoting the y-axis label for
the \code{"time"} style. Default: the series name.}

\item{cex}{Character expansion factor (same as the \code{cex} argument of the \code{par} function). Default: \code{1}.}

\item{adj.main}{Title adjustment ala the \code{adj} argument of the \code{par} function). Default: \code{1}.}

\item{line.main}{Line spacing for title ala the \code{line} argument of the \code{text} function). Default: \code{0.5}.}

\item{col.series}{A character string or integer denoting the color to use when
plotting data corresponding to the original series. See the \code{colors} function
for more details. Default: \code{"black"}.}

\item{col.surrogate}{A character string or integer denoting the color to use when
plotting data corresponding to the surrogate series. See the \code{colors} function
for more details. Default: \code{"red"}.}

\item{...}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints a summary of the surrogate data realization. Available options are:
\describe{
\item{...}{Additional print arguments used by the standard \code{print} function.}}}

}
}

\details{
%
The algorithms are detailed as follows:

\describe{
\item{phase}{The discrete Fourier transform of a time series is calculated
and the phase at each frequency is randomized to be uniformly distributed
on \eqn{[0,2\pi]}{[0, 2*PI]}. Phase symmetry is preserved so that an
inverse DFT forms a purely real surrogate.
Null hypothesis: the original data come from a linear Gaussian process.
Side effect: the periodogram of the
surrogate and original time series are the same.}

\item{aaft}{An \eqn{N}-point normally distributed realization of a white noise process is created,
where \eqn{N} is the length of \code{x}, and sorted to have the same rank as \code{x} (e.g.,
if \eqn{\mbox{rank}(x_t) = 5}{rank(x[t]) = 5} it means that \eqn{x_t}{x[t]} is the
fifth smallest element of \code{x}). The result is
then phase randomized and its rank (\eqn{r}) is then calculated.
The surrogate is then created by rank ordering \code{x} using \eqn{r}.
Null hypothesis: the observed time series is a monotonic nonlinear transformation of a Gaussian process.
Side effect: the amplitude distribution (histogram) of the surrogate and original time series are the same.}

\item{ce}{The circulant embedding technique is based upon generating surrogates
whose estimated SDF (e.g., a periodogram) is not constrained
to be the same as that of the original series
(for references for details).}

\item{dh}{The Davison-Hinkley technique is based upon generating surrogates
by randomizing both the phases and the amplitudes in the frequency
domain followed by an inversion back to the time domain.}}
}
\references{
J. Theiler and S. Eubank and A. Longtin and B. Galdrikian and J.D. Farmer (1992),
Testing for nonlinearity in time series:  the method of surrogate data,
\emph{Physica D: Nonlinear Phenomena}, \bold{58}, 77--94.

Davies,R.B.and Harte,D.S.(1987). Tests for the Hurst
effect, \emph{Biometrika}, \bold{74}, 95--102.

D.B. Percival and W.L.B. Constantine (2002),
Exact Simulation of Gaussian Time Series from Nonparametric
Spectral Estimates with Application to Bootstrapping,
\emph{Statistics and Computing}, under review.

D.B. Percival and A. Walden (1993),
\emph{Spectral Analysis for Physical Applications: Multitaper
and Conventional Univariate Techniques},
Cambridge University Press, Cambridge, UK.

D. B. Percival, S. Sardy and A. C. Davison,
\emph{Wavestrapping Time Series: Adaptive Wavelet-Based Bootstrapping},
in W. J. Fitzgerald, R. L. Smith, A. T. Walden and P. C. Young (Eds.),
\emph{Nonlinear and Nonstationary Signal Processing},
Cambridge, England: Cambridge University Press, 2001.

D.T. Kaplan (1995), Nonlinearity and Nonstationarity: The Use of Surrogate
Data in Interpreting Fluctuations in Heart Rate, \emph{Proceedings of the 3rd Annual
Workshop on Computer Applications of Blood Pressure and Heart Rate Signals},
Florence, Italy, 4--5 May.
}

\seealso{
\code{\link{infoDim}}, \code{\link{corrDim}}.}

\examples{
## create surrogate data sets using circulant 
## embedding method 
surr <- surrogate(beamchaos, method="ce")

## print the result 
print(surr)

## plot and compare various statistics of the 
## surrogate and original time series 
plot(surr, type="time")
plot(surr, type="sdf")
plot(surr, type="lag")
plot(surr, type="pdf")

## create comparison time history 
plot(surr, show="both", type="time")
}
\keyword{datagen}

