%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the hurstSpec function

\name{hurstSpec}
\alias{hurstSpec}
\title{Hurst coefficient estimation via spectral regression}
\concept{Hurst coefficient estimationspectral regression}
\usage{hurstSpec(x, method="standard", freq.max=0.25, dc=FALSE, n.block=NULL,
    weight=function(x) rep(1,length(x)), fit=lm, sdf.method="direct", ...)}
\description{Function to estimate the Hurst parameter H of a time series by linear
regression of the log(spectrum) versus log(frequency) with frequency
points accumulated into boxes of equal width on a logarithmic scale
and spectrum values averaged over each box.

\describe{
\item{standard}{Given an estimate of the SDF for the input time series, this function estimates the Hurst coefficient
of the time series by performing a linear regression of log(SDF)
versus log(frequency). The range of frequencies to be included in the
regression is specified by the \code{dc} and \code{freq.max} input arguments.}

\item{smoothed}{Given an estimate of the SDF for the input time series,
this function estimates the Hurst coefficient
of the time series by performing a linear regression of log(SDF)
versus log(frequency). The range of frequencies to be included in the
regression is specified by the \code{dc} and \code{freq.max} input arguments.
Frequencies are partitioned into blocks of equal width on a logarithmic
scale and the SDF is averaged over each block. The number of blocks
is controlled by the \code{n.block} argument.}

\item{robinson}{Estimates the Hurst coefficient by Robinson's SDF integration method.
Given an estimate of the SDF for the input time series, this function estimates the Hurst coefficient
of a time series by applying Robinson's integral method (typically) to the low-
frequency end of the SDF. Use the \code{freq.max} argument to define the low-frequency
cutoff.}}}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{...}{optional SDF estimation arguments passed directly to the \code{sdf} function.
See help documentation for the \code{SDF} function for more information.}

\item{dc}{a logical value. If \code{FALSE}, the DC component of the spectrum (corresponding to the sample
mean of the series) is not used in fitting the resulting statistics to estimate the Hurst coefficient.
Default: \code{FALSE}.}

\item{fit}{a function representing the linear regression scheme to use in fitting
the resulting statistics (on a log-log scale). Supported functions are: \code{lm},
\code{lmsreg}, and \code{ltsreg}. See the on-line help documentation for each of these for
more information: in R, these are found in the \code{MASS} package while in S-PLUS they are indigenous
and found in the \code{splus} database. Only used when \code{method="standard"} or \code{method="smoothed"}.
Default: \code{lm}.}

\item{freq.max}{the largerst normalized frequency to include in the regression scheme.
Default: \code{0.25}.}

\item{method}{a character string indicating the method to be used in estimating the Hurst coefficient (H).
Choices are:
\describe{
\item{\code{"standard"}}{Regression of SDF estimate.}

\item{\code{"smoothed"}}{Regression of block averages of the SDF estimate taken over dyadic partitions in frequency.}

\item{\code{"robinson"}}{Robinson's SDF integration method.}}

Default: \code{"standard"}.}

\item{n.block}{an integer denoting the number of logarithmic frequency divisions to use
in partitioning the estimated SDF. This input argument is only used if \code{method="smoothed"}.
Default: \code{as.integer(floor(logb(length(x),base=2)))}, which corresponds to the maximum
number of decomposition levels possible for a discrete wavelet transformation of the
input time seres.}

\item{sdf.method}{a character string denoting the method to use in estimating the SDF.
Choices are \code{"direct"}, \code{"lag window"}, \code{"wosa"} (Welch's Overlapped Segment Averaging),
\code{"multitaper"}. See help documentation for the \code{sdf} function for more information. Default: \code{"direct"}.}

\item{weight}{a function with a single required variable (\code{x}) used to weight the
resulting statistics (\code{x}) for each scale during linear regression. Currently, only supported
when \code{fit=lm} and is only used when \code{method="standard"} or \code{method="smoothed"}.
Default: \code{function(x) rep(1,length(x))}.}
}

\value{
an object of class \code{fractalBlock}.
}
\references{
P.M. Robinson (1994), Semiparametric analysis of long-memory time series,
\emph{Annals of Statistics}, \bold{22}, 515--539.

I. Lobato and P.M. Robinson (1996), Averaged periodogram estimation of long
memory, \emph{Journal of Econometrics}, \bold{73}, 303--324.

J. Geweke and Susan Porter-Hudak (1983), The Estimation and Application of
Long Memory Time Series Models, \emph{Journal of Time Series Analysis},
\bold{4}, 221--237.

Murad S. Taqqu, Vadim Teverovsky, and Walter Willinger (1995), Estimators
for Long-Range Dependence: An Empirical Study, \emph{Fractals},
\bold{3}, 785--798.
}

\seealso{
\code{\link{hurstBlock}}, \code{\link{fractalBlock}}, \code{\link{HDEst}}, \code{\link{lm}}.}

\examples{
## create test series 
set.seed(100)
x <- rnorm(1024)
walk <- cumsum(x)

## calculate the Hurst coefficient of a random 
## walk series using various techniques. use a 
## multitaper SDF 
methods <- c("standard","smoothed")
z <- lapply(methods, function(method, walk){
    hurstSpec(walk, method=method, sdf.method="multitaper")
},walk=walk )
names(z) <- methods

## plot results 
old.plt <- par("plt")
for (i in 1:2){
    splitplot(2,1,i)
    plot(z[[i]])
}
par(plt=old.plt)

## Robinson's method 
hurstSpec(walk, method="robinson", sdf.method="multitaper")
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

