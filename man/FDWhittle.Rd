%%  WARNING: This file was automatically generated from the associated 
%%  fra_fdp.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_fdp.mid file in the project MID directory. Once the 
%%  fra_fdp.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the FDWhittle function

\name{FDWhittle}
\alias{FDWhittle}
\title{Estimate the Hurst coefficient by Whittle's method}
\concept{Hurst coefficient estimation}
\usage{FDWhittle(x, method="continuous", dc=FALSE, freq.max=0.5,
    delta.min=-1,delta.max=2.5, sdf.method="direct", ...)}
\description{Using an estimate of the spectral density function for an input time series,
Whittle's method fits the parameters of a specified
SDF model to the data by optimizing an appropriate functional.
In this case, the SDF for a fractionally differenced (FD) process model is used
and an estimate of (\eqn{\delta}{delta}),
the FD parameter, is returned.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{...}{optional SDF estimation arguments passed directly to the \code{SDF} function.
See help documentation for the \code{SDF} function for more information.}

\item{dc}{a logical value. If \code{FALSE}, the DC component of the SDF (corresponding to the sample
mean of the series) is not used in optimizing the Whittle functional.
Default: \code{FALSE}.}

\item{delta.max}{the maximum value for the FD parameter to use in the
constrained optimization problem. Default: \code{2.5}.}

\item{delta.min}{the minimum value for the FD parameter to use in the
constrained optimization problem. Default: \code{-1}.}

\item{freq.max}{the largerst normalized frequency of the SDFs use in the analysis.
Default: \code{0.25}.}

\item{method}{a character string indicating the method to be used in estimating the Hurst coefficient (H).
Choices are:
\describe{
\item{\code{"continuous"}}{Whittle's method using a continuous model approach to form
the optimization functional. This functional is subsequently implemented via a
discrete form of the SDF for an FD process.}

\item{\code{"discrete"}}{Whittle's method using (directly) a discrete form of the SDF for an
FD process.}}

Default: \code{"continuous"}.}

\item{sdf.method}{a character string denoting the method to use in estimating the SDF.
Choices are \code{"direct"}, \code{"lag window"}, \code{"wosa"} (Welch's Overlapped Segment Averaging),
\code{"multitaper"}. See help documentation for the \code{SDF} function for more information. Default: \code{"direct"}.}
}

\value{
estimate of the FD parameter of the time series.
}
\references{
M. S. Taqqu and V. Teverovsky, On Estimating the Intensity of Long-
Range Dependence in Finite and Infinite Variance Time Series (1998), in
\emph{A practical Guide to Heavy Tails: Statistical Techniques and
Applications}, pp. 177--217, Birkhauser, Boston.
}

\seealso{
\code{\link{hurstSpec}}, \code{\link{FDSimulate}}.}

\examples{
set.seed(100)
walk <- cumsum(rnorm(1024))
FDWhittle(walk, method="discrete", sdf.method="multitaper")
FDWhittle(walk, method="continuous", sdf.method="multitaper")
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

