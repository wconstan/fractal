%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the DFA function

\name{DFA}
\alias{DFA}
\title{Detrended fluctuation analysis}
\usage{DFA(x, detrend="poly1", sum.order=0, overlap=0,
    scale.max=trunc(length(x)/2), scale.min=NULL,
    scale.ratio=2, verbose=FALSE)}
\description{Performs a detrended fluctuation analysis (DFA) and
estimates the scaling exponent from the results. DFA
is used to characterize long memory dependence in
stochastic fractal time series.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{detrend}{a character string denoting the type of detrending to use on each
block of the time series. Supported types are:

\describe{
\item{\code{"poly}\emph{K}\code{"}}{specifies a polynomial fit where
\emph{K} is an integer denoting the order of the polynomial.
For example, if \code{detrend="poly2"},
a second order polynomial of the form
\eqn{x_t=b_0 + b_1t + b_2t^2}{x(t)=b0 + b1*t + b2*t^2}
will be used to fit the data in each block using least squares. The
polynomial order must be positive or zero.}

\item{\code{"bridge"}}{specifies bridge detrending. A line
connecting the endpoints of each block is subtracted.}

\item{\code{"none"}}{instructs the function to not detrend the data.}}

Default: \code{"poly1"}.}

\item{overlap}{the overlap of blocks in partitioning the time data
expressed as a fraction in [ 0,1). A positive overlap will slow down the
calculations slightly with the (possible) effect of generating less biased
results. Default: \code{0}.}

\item{scale.max}{an integer denoting the maximum block size to use in partitioning
the data. Default: \code{trunc(length(x)/2)}.}

\item{scale.min}{an integer denoting the minimum block size to use in partitioning
the data. Default: for polynomial detrending the default value is
2*(K+1). For all other detrending techniques, the default value is
4 or \code{length(x)/4}, whichever is smaller.}

\item{scale.ratio}{the ratio of successive scales. This argument is used as an input
to the \code{logScale} function. Default: \code{2}.}

\item{sum.order}{an integer denoting the number of differences or
cumulative summations to perform on the original data before performing
a DFA. Differences are specified by negative integers and cumulative summations
by positive integers. For example, to perform a second order difference, set
\code{sum.order=-2}. Default: \code{0}.}

\item{verbose}{a logical value. If \code{TRUE}, the detrending model
and processing progress information is displayed. Default: \code{FALSE}.}
}

\value{
an object of class \code{fractalBlock}.
}
\details{
%
The DFA algorithm is implemented as follows:

\describe{
\item{1}{DFA is useful for characterizing long-memory
correlations in stochastic fractal time series, i.e. sequences
whose spectral density function \eqn{S(f)} obeys
a power law \eqn{S \sim |f|^\alpha}{S~|f|^alpha}
at low frequencies where
\eqn{0 \le f \le 1/2}{0 <= f <= 1/2} is the normalized
frequency variable and \eqn{\alpha \le -1}{alpha <= -1} is the
long memory (scaling) exponent. If the scaling exponent for
an original time series is \eqn{\alpha > -1}{alpha > -1},
then (possibly multiple) cumulative summations of the original
time series must be performed to increase the scaling exponent
(each cumulative summation decreases the exponent by 2). For example,
a (single) cumulative summation must be performed on a white noise
realization since its scaling exponent is zero. We also provide the
user with the ability to perform (consecutive) first order
differencing operations on the original time series prior to
a DFA. Each differencing operation raises the scaling exponent
by 2. Differencing a series is acceptable prior to DFA as
long as the resulting scaling exponent is less than -1.}

\item{2}{The series resulting from stage one is
uniformly partitioned into blocks of a specified minimum size
\code{(scale.min)}, and each block
is (optionally) detrended. The variance of the detrended sequence
in each block is calculated and the collection of variances
is averaged to form the scalar value \eqn{F^2}\code{(scale.min)}
which summarizes the variability of the sequence at the
current scale.}

\item{3}{Stage two is repeated using successively
larger blocks until the largest scale
\code{(scale.max)} has been reached.}

\item{4}{For long-memory processes, we expect
to find a linear relation between
\eqn{\log F(scale)}{log F(scale)} and
\eqn{\log scale}{log scale}. The slope of the
line which best fits a plot of
\eqn{\log F(scale)}{log F(scale)} versus
\eqn{\log scale}{log scale} is defined
as the \emph{scaling exponent}.}}
}
\references{
Peng C-K, Buldyrev SV, Havlin S, Simons M, Stanley HE, and Goldberger AL (1994),
Mosaic organization of DNA nucleotides, \emph{Physical Review E}, \bold{49}, 1685--1689.

Peng C-K, Havlin S, Stanley HE, and Goldberger AL (1995),
Quantification of scaling exponents and crossover phenomena in nonstationary heartbeat time series,
\emph{Chaos}, \bold{5}, 82--87.

Goldberger AL, Amaral LAN, Glass L, Hausdorff JM, Ivanov PCh, Mark RG, Mietus JE, Moody GB,
Peng C-K, Stanley HE (2000, June 13), PhysioBank, PhysioToolkit, and Physionet:
Components of a New Research Resource for Complex Physiologic Signals,
\emph{Circulation}, \bold{101}(23), e215-e220.
}

\seealso{
\code{\link[ifultools]{logScale}}, \code{\link{fractalBlock}}.}

\examples{
## calculate the scaling exponent for a random 
## walk realization 
DFA.walk <- DFA(rnorm(1024), detrend="poly1", sum.order=1)

## print the results 
print(DFA.walk)

## plot a summary of the results 
eda.plot(DFA.walk)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

