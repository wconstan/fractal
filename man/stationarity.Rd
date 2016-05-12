%%  WARNING: This file was automatically generated from the associated 
%%  fra_stny.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_stny.mid file in the project MID directory. Once the 
%%  fra_stny.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the stationarity, as.list.stationarity, print.stationarity, print.summary.stationarity, summary.stationarity functions

\name{stationarity}
\alias{stationarity}
\alias{as.list.stationarity}
\alias{print.stationarity}
\alias{print.summary.stationarity}
\alias{summary.stationarity}
\title{Testing for stationarity in a time series}
\concept{stationarity tests}
\usage{stationarity(x, n.taper=5,
    n.block=max(c(2, floor(logb(length(x), base=2)))), significance=0.05,
    center=TRUE, recenter=FALSE)}
\description{The Priestley-Subba Rao (PSR) test for nonstationarity is based upon examining how homogeneous
a set of spectral density function (SDF) estimates are across time, across frequency, or both.
The original test was formulated in the terms of localized lag window SDF estimators,
but such estimators can suffer from bias due to leakage. To circumvent this potential problem,
the SDF estimators are averages of multitaper SDF estimates using orthogonal sinusoidal tapers.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{center}{a logical value. If \code{TRUE}, The mean value of the data is subtracted from the original series
prior to analyis. Default: \code{TRUE}.}

\item{n.block}{the number of non-overlapping blocks with which the
time series will be uniformly divided. If the number of samples in the time series
is not evenly divisible by \code{n.block}, then those samples at the of the time series that do not fit into
the last block are ignored (rejected for analysis). Default: \code{max(c(2, floor(logb(length(x), base=2))))}.}

\item{n.taper}{an integer specifying the number of sinusoidal tapers to use in developing
the eigenspectra for each block of the time series. Default: 5.}

\item{recenter}{a logical value. If \code{TRUE}, the mean value of the data is subtracted
from the tapered series prior to forming a mutltiaper SDF estimate of the input time series. Default: \code{TRUE}.}

\item{significance}{the significance is the number of times you expect the
underlying hypothesis of stationarity to fail even
though stationarity remains true. Essentially, you are
allowing for error in the result. A significance of
0.05 means that you are allowing 5 percent error, i.e., you are 95 percent confident in the result.
Default: 0.05.}
}

\value{
an object of class \code{stationarity}.
}

\section{S3 METHODS}{
\describe{

\item{as.list}{convert output to a list.}

\item{print}{prints the object. Available options are:
\describe{
\item{justify}{text justification ala \code{prettPrintList}. Default: \code{"left"}.}

\item{sep}{header separator ala \code{prettyPrintList}. Default: \code{":"}.}

\item{n.digits}{number of digits ala \code{prettyPrintList}. Default: 5.}

\item{...}{Additional print arguments sent directly to the \code{prettyPrintList} function).}}}

\item{summary}{prints a summary of the stationarity test results.}

}
}

\details{
%
The algorithms is outlined as follows:

\describe{
\item{1. Re-centering}{The time series \code{x} is recentered by subtracting the sample mean.}

\item{2. Blocking}{The recentered series is then segmented into \code{n.block} non-overlapping blocks in time.}

\item{3. Mutitaper SDF estimation}{For each block, \code{n.taper} eigenspectra are formed by calculating the periodogram
of the block windowed by each of the \code{n.taper} tapers. These eiegenspectra are then averaged to form a multitaper
SDF estimator for the current block.}

\item{4. ANOVA table}{A subset of each multitaper SDF estimate is formed by extracting only those values
corresponding to frequencies which are approximately uncorrelated (the details of this exercise can be found
in the references). Each subset (one per block) is stacked in rows such that an \code{n.block} x \eqn{M} matrix (\bold{S})
is formed, where \eqn{M} is the number of (subset) Fourier frequencies. The (two-factor) ANOVA table (\bold{Y}) is then formed via
\eqn{\mathbf{Y} \equiv \log(\mathbf{S}) - \psi(\mbox{n.taper}) + \log(\mbox{n.taper})}{Y=log(S) - psi(n.taper) + log(n.taper)},
where \eqn{\psi(\cdot)}{psi()} is the digamma function and \eqn{log} is the natural logarithm function.}

\item{5. PSR statistics}{Using the ANOVA table and (row, column, and grand) means of the
ANOVA table, the Priesltey-Subba Rao statistics are generated: one for investigating
time effects, one for investigating frequency effects, and one which combines the
two to test time-frequency effects. See references for details.}

\item{6. Stationarity tests}{The PSR statisitcs are then compared to corresponding chi-square (\code{(1 - significance)} x 100) percentiles
(normalized by \eqn{\psi'(\mbox{n.taper})}{psi'(n.taper)} where \eqn{\psi'(\cdot)}{psi'()} is the trigamma function).
Specifically, if the PSR statistic is found to be greater than the corresponding chi-square percentile, it indicates
that there is a  \code{1 - significance} probability that the data is nonstationary.}}
}
\references{
Priestley, M. B. and Subba Rao, T. (1969)
``A Test for Stationarity of Time Series",
\emph{Journal of the Royal Statistical Society},
Series B, \bold{31}, pp. 140--9.
}

\seealso{
\code{\link{hurstBlock}}.}

\examples{
## assess the stationarity of the ecgrr series 
z <- stationarity(ecgrr, n.block=8)

## print the result, noting that all tests fail. 
## The strongest failure attributed to the 
## time-based fluctations of the eigenspectra 
print(z)

## print a summary of the results, including the 
## ANOVA table of the eigenspectra 
summary(z)
}
\keyword{univar}
\keyword{ts}
\keyword{htest}

