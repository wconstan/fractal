%%  WARNING: This file was automatically generated from the associated 
%%  fra_model.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_model.mid file in the project MID directory. Once the 
%%  fra_model.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lmSimulate function

\name{lmSimulate}
\alias{lmSimulate}
\title{Stochastic fractal time series simulation}
\concept{fractional Gaussian noisespectral density function generationpure power lawfractional Brownian motionfractionally differenced process}
\usage{lmSimulate(x, sampling.interval=1,
    mean=0, n.sample=128, generate.Sj=FALSE,
    Sj=NULL, rn=NULL)}
\description{Create a simulation of a stochastic fractal time series according
to a specfied model.}

\arguments{
\item{x}{an object of class \code{"lmModel"}. Use the \code{lmModel} function
to create this input.}
\item{Sj}{a numeric vector of Davies-Harte frequency
domain weights used to create the simulation(s). These weights
are calculated if not supplied. Default: \code{NULL} (not supplied).}

\item{generate.Sj}{a logical value. If \code{TRUE}, the Davies-Harte frequency
domain weights (Sj) are returned instead of a simulated series. See the references
for details. Default: \code{FALSE}.}

\item{mean}{the mean value of of the resulting simulation. Default: \code{0.0}.}

\item{n.sample}{length of a time series.
Default: \code{128}.}

\item{rn}{a vector of random normal deviates used to generate
uncorrelated random variables for the Davies-Harte simulator.
Default: \code{rnorm(2 * length(Sj) - 2)}.}

\item{sampling.interval}{the sampling interval for the process.
The SDF is computed for frequencies on the interval [0, Nyquist]
where Nyquist is \code{1/(2*sampling.interval)}.
The value of \code{sampling.interval} must be a positive number. Default: \code{1}.}
}

\value{
an object of class \code{signalSeries} containing the simulated series.
}
\details{
%
Simulates a stochastic fractal time series via the Davies-Harte
technique, which randomizes spectral weights and inverts the result
back to the time domain. See the references for more details.
}
\references{
D. Percival and A. Walden (2000),
\emph{Wavelet Methods for Time Series Analysis},
Cambridge University Press, Chapter 7.

J. Beran (1994),
\emph{Statistics for Long-Memory Processes},
Chapman and Hall, Chapter 2.

D. Percival and A. Walden (1993),
\emph{Spectral Analysis for Physical Applications},
Cambridge University Press, 1993, Chapter 9.

Davies,R.B.and Harte,D.S.(1987). Tests for the Hurst
effect, \emph{Biometrika}, \bold{74}, 95--102.
}

\seealso{
\code{\link{lmModel}}, \code{\link{lmACF}}, \code{\link{lmSDF}}, \code{\link{lmConfidence}}, \code{\link{FDSimulate}}.}

\examples{
old.plt <- par("plt")
models <- c("ppl","fdp","fgn","dfbm")
for (i in seq(along=models)){
    splitplot(2,2,i)
    plot(lmSimulate(lmModel(models[i])),
    reference.grid=FALSE)
}
par(plt=old.plt)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

