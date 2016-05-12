%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the RoverS function

\name{RoverS}
\alias{RoverS}
\title{Estimate the Hurst coefficient by rescaled range (R/S) method}
\concept{Hurst coefficient estimation}
\usage{RoverS(x, n.block.min=2, scale.ratio=2, scale.min=8)}
\description{The series is partitioned into m groups. The R/S statistic is computed
as described in the references, the number of groups is increased, and
the calculation is repeated. A log-log plot of R/S versus number
of groups is, ideally, linear, with a slope related to H, so H can be
determined by linear regression.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{n.block.min}{minimum number of blocks in partitioning the data. Must be at
least 2. Default: \code{2}.}

\item{scale.min}{minimum number of data values allowed in a block This may be restricted so
the statistic evaluated within each group is from a reasonable sample.
Default: \code{8}.}

\item{scale.ratio}{ratio of successive scales to use in partitioning the data. For example,
if \code{scale.min=8} and \code{scale.ratio=2}, the first scale will be 8, the second scale 16, the
third scale 32, and so on. Default: \code{2}.}
}

\value{
estimated Hurst parameter H of the time series.
}
\references{
B.B. Mandelbrot and J.R. Wallis (1969), \emph{Water Resources Research},
\bold{5}, 228--267.

See summary in M.S. Taqqu and V. Teverovsky (1998), On Estimating the
Intensity of Long-Range Dependence in Finite and Infinite Variance Time
Series, in \emph{A practical Guide to Heavy Tails: Statistical Techniques and
Applications}, 177--217, Birkhauser, Boston.
}

\seealso{
\code{\link{hurstBlock}}, \code{\link{hurstACVF}}, \code{\link{dispersion}}.}

\examples{
RoverS(wmtsa::ocean)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

