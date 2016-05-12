%%  WARNING: This file was automatically generated from the associated 
%%  fra_fdp.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_fdp.mid file in the project MID directory. Once the 
%%  fra_fdp.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the FDSimulate, print.FDSimulate, plot.FDSimulate functions

\name{FDSimulate}
\alias{FDSimulate}
\alias{print.FDSimulate}
\alias{plot.FDSimulate}
\title{Simulation of an FD process with time varying model parameters}
\concept{fractionally differenced (FD) processsimulation}
\usage{FDSimulate(delta, innovations.var=1, method="ce", seed=0)}
\description{Creates a realization of a time-varying fractionally differenced (FD)
process with a given vector of FD parameters and corresponding
vector of innovations variances.}

\arguments{
\item{delta}{a vector containing time-varying FD parameters.}
\item{innovations.var}{a numeric vector or scalar containing (time-varying) FD innovations variances.
If a scalar, the value is replicated appropriately. Otherwise, the length of this input should match the
length of the \code{delta} vector. Default: \code{1}.}

\item{method}{a character string defining the method to use in forming the FD realization.
Choices are \code{"ce"} (circulent emebdding) and \code{"cholesky"}. Default: \code{"ce"}.}

\item{seed}{a positive integer representing the initial seed value to use
for the random number generator. If \code{seed=0}, the current time is used
as a means of generating a (unique) seed value. Otherwise, the specified
seed value is used. Default: \code{0}.}
}

\value{
a vector containing a (time-varying) FD process realization
corresponding to the input FD model parameters.
}

\section{S3 METHODS}{
\describe{

\item{plot}{plot the output object.
Optional arguments include:
\describe{
\item{simulation}{Plot the simulated series. Default: \code{TRUE}.}

\item{delta}{Plot the FD parameter as a function of time. Default: \code{TRUE}.}

\item{innovations.var}{Plot the innovations variance as a function of time. Default: \code{TRUE}.}}}

\item{print}{print the output object.}

}
}

\references{
D. B. Percival and  A. T. Walden, \emph{Wavelet Methods for  Time Series Analysis}, Cambridge University Press, 2000.

D. B. Percival and  W.L.B. Constantine,
\emph{Exact Simulations of Time-Varying Fractionally Differenced Processes},
submitted to Journal of Computational and Graphical Statistics, 2002.
}

\seealso{
\code{\link{FDWhittle}}, \code{\link[wmtsa]{wavFDPBlock}}, \code{\link[wmtsa]{wavFDPTime}}.}

\examples{
## create a time-varying FD parameter, linearly 
## varying from white to pink noise, then jump 
## to a red noise plateau 
delta <- c(seq(0, 0.5, by=0.01), rep(1,100))

## set the innovations variance to unity 
innovation <- rep(1, length(delta))

## simulate a time-varying FD process 
z <- FDSimulate(delta=delta, innovation=innovation)
print(z)
plot(z)
}
\keyword{univar}

