%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the hurstBlock function

\name{hurstBlock}
\alias{hurstBlock}
\title{Hurst coefficient estimation in the time domain}
\concept{Hurst coefficient estimation}
\usage{hurstBlock(x, method="aggAbs", scale.min=8, scale.max=NULL,
    scale.ratio=2, weight=function(x) rep(1,length(x)), fit=lm)}
\description{Function to estimate the Hurst parameter H of a long memory time series
by one of several methods as specified in input. These methods all work
directly with the sample values of the time series (not the spectrum).

\describe{
\item{aggabs}{The series is partitioned into m groups. Within each group,
the first absolute moment about the mean of the entire series
is evaluated. A measure of the variability of this statistic between
groups is calculated. The number of groups, m, is increased and the process
is repeated. The observed variability changes with increasing m in a way
related by theory to the Hurst parameter H of the input series. For
the methods used here, a log-log plot of variability versus number
of groups is, ideally, linear, with a slope related to H, so H can be
determined by linear regression.}

\item{aggvar}{The series is partitioned into m groups. Within each group,
the variance (relative to the mean of the entire series) is evaluated.
A measure of the variability of this statistic between
groups is calculated. The number of groups, m, is increased and the process
is repeated. The observed variability changes with increasing m in a way
related by theory to the Hurst parameter H of the input series. For
the methods used here, a log-log plot of variability versus number
of groups is, ideally, linear, with a slope related to H, so H can be
determined by linear regression.}

\item{diffvar}{The series is partitioned into m groups. Within each group,
the variance, relative to the mean of the entire series, is evaluated.
The first difference of the variances is then evaluated.
A measure of the variability of this statistic between
groups is calculated. The number of groups, m, is increased and the process
is repeated. The observed variability changes with increasing m in a way
related by theory to the Hurst parameter H of the input series. For
the methods used here, a log-log plot of variability versus number
of groups is, ideally, linear, with a slope related to H, so H can be
determined by linear regression.}

\item{higuchi}{The series is assumed to have the character of a noise, not a motion.
The series is partitioned into m groups. The cumulative sums of the
series are evaluated to convert the series from a noise to a motion.
Absolute differences of the cumulative sums between groups are
analyzed to estimate the fractal dimension of the path. The number
of groups, m, is increased and the process is repeated. The result
changes with increasing m in a way related by Higuchi's theory to
the Hurst parameter H of the input series. A log-log plot of the
statistic versus number of groups is, ideally, linear, with a slope
related to H, so H can be determined by linear regression.}}}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{fit}{a function representing the linear regression scheme to use in fitting
the resulting statistics (on a log-log scale). Supported functions are: \code{lm},
\code{lmsreg}, and \code{ltsreg}. See the on-line help documentation for each of these for
more information: in R, these are found in the \code{MASS} package while in S-PLUS they are indigenous
and found in the \code{splus} database. Default: \code{lm}.}

\item{method}{a character string indicating the method to be used to estimate the Hurst coefficient (H).
Choices are:
\describe{
\item{\code{"aggabs"}}{Absolute Values of the Aggregated Series}

\item{\code{"aggVar"}}{Aggregated Variance Method}

\item{\code{"diffvar"}}{Differenced Variance Method}

\item{\code{"higuchi"}}{Higuchi's Method}}

Default: \code{"aggabs"}.}

\item{scale.max}{an integer denoting the maximum scale (block size) to use in partitioning
the series. Default: \code{length(x)}.}

\item{scale.min}{an integer denoting the minimum scale (block size) to use in partitioning
the series. Default: \code{8}.}

\item{scale.ratio}{ratio of successive scales to use in partitioning the data. For example,
if \code{scale.min=8} and \code{scale.ratio=2}, the first scale will be 8, the second scale 16, the
third scale 32, and so on. Default: \code{2}.}

\item{weight}{a function with a single required variable (\code{x}) used to weight the
resulting statistics (\code{x}) for each scale during linear regression. Currently, only supported
when \code{fit=lm}. Default: \code{function(x) rep(1,length(x))}.}
}

\value{
an object of class \code{fractalBlock}.
}
\references{
T. Higuchi (1988), Approach to an irregular time series on the basis of
the fractal theory, \emph{Physica D}, \bold{31}, 277--283.

M.S. Taqqu, V. Teverovsky, and W. Willinger, Estimators for Long-
Range Dependence: an Empirical Study (1995), \emph{Fractals}, \bold{3},
pp. 785--798.

M. S. Taqqu and V. Teverovsky, On Estimating the Intensity of Long-
Range Dependence in Finite and Infinite Variance Time Series (1998), in
\emph{A practical Guide to Heavy Tails: Statistical Techniques and
Applications}, pp. 177--217, Birkhauser, Boston.
}

\seealso{
\code{\link{fractalBlock}}, \code{\link{hurstSpec}}, \code{\link{lm}}.}

\examples{
## create test series 
set.seed(100)
x <- rnorm(1024)
walk <- cumsum(x)
diffwalk <- diff(walk)

## calculate the Hurst coefficient of a random 
## walk series using various techniques 
methods <- c("aggabs","aggvar","diffvar","higuchi")
z <- list(
  "aggabs" = hurstBlock(walk, method = "aggabs"),
  "aggvar" = hurstBlock(walk, method = "aggvar"),
  "diffvar" = hurstBlock(walk, method = "diffvar"),
  "higuchi" = hurstBlock(diffwalk, method = "higuchi"))
  
## plot results 
old.plt <- splitplot(2,2,1)
for (i in 1:4){
    if (i > 1)
       splitplot(2,2,i)
    plot(z[[i]], key=FALSE)
    mtext(paste(attr(z[[i]],"stat.name"), round(as.numeric(z[[i]]),3), sep=", H="),
       line=0.5, adj=1)
}
par(old.plt)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

