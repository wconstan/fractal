%%  WARNING: This file was automatically generated from the associated 
%%  fra_model.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_model.mid file in the project MID directory. Once the 
%%  fra_model.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lmSDF function

\name{lmSDF}
\alias{lmSDF}
\title{SDF for various stochastic fractal time series models}
\concept{fractional Gaussian noisespectral density function generationpure power lawfractional Brownian motionfractionally differenced process}
\usage{lmSDF(x, sampling.interval=1, n.freq=NULL,
    n.sample=NULL, with.Nyquist=NULL)}
\description{Compute a discretized version of a single-sided parametric spectral density function (SDF)
for various stochastic fractal time series models.}

\arguments{
\item{x}{an object of class \code{"lmModel"}. Use the \code{lmModel} function
to create this input.}
\item{n.freq}{the number of frequencies at which the SDF is computed
(this argument should not be supplied if \code{n.sample} is supplied).
If \code{n.sample} is non-NULL supplied but \code{n.freq} is NULL,
the actual grid of frequencies is determined by the argument
with.Nyquist. Default: if neither \code{n.sample} nor \code{n.freq} is specified,
\code{n.freq} defaults to 32.}

\item{n.sample}{length of a time series.
If non-NULL, the spectral resolution is set to \code{1/(n.sample * sampling.interval)}.
Default: \code{NULL} (\code{n.freq} is used to set the specral resolution instead).}

\item{sampling.interval}{the sampling interval for the process.
The SDF is computed for frequencies on the interval [0, Nyquist]
where Nyquist is \code{1/(2*sampling.interval)}.
The value of \code{sampling.interval} must be a positive number. Default: \code{1}.}

\item{with.Nyquist}{a logical flag. If \code{TRUE},
the grid of frequencies over which the SDF is evaluated
ranges from 1/2*n.freq*sampling.interval up to the Nyquist frequency;
otherwise,
the range is from 1/(2*n.freq + 1)*sampling.interval to just below
the Nyquist frequency.
The intent of this argument is to mimic the grid
of Fourier frequencies for time series with
an even or odd sample size
by setting with.Nyquist
to, respectively,
\code{TRUE} or \code{FALSE}.
This argument is only really intended to be used
if \code{n.sample} is not supplied, but \code{n.freq} is. Default: \code{TRUE}.}
}

\value{
an object of class \code{signalSeries} containing the SDF.
}
\details{
%
The SDF is computed as described in Section 7.6 of Percival and Walden (2000),
after a possible change of variable to take into account
the sampling interval (the discussion in the reference assumes a unit sampling interval).
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
}

\seealso{
\code{\link{lmModel}}, \code{\link{lmACF}}, \code{\link{lmSimulate}}.}

\examples{
old.plt <- par("plt")
models <- c("ppl","fdp","fgn","dfbm")
for (i in seq(along=models)){
    splitplot(2,2,i)
    plot(lmSDF(lmModel(models[i])),
    reference.grid=FALSE, log.axes="xy")
}
par(plt=old.plt)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

