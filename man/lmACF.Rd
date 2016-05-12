%%  WARNING: This file was automatically generated from the associated 
%%  fra_model.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_model.mid file in the project MID directory. Once the 
%%  fra_model.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lmACF function

\name{lmACF}
\alias{lmACF}
\title{ACF, PACF, and ACVF for various stochastic fractal time series models}
\concept{fractional Gaussian noise (FGN) processpartial autocorrelationautocorrelationautocovariance}
\usage{lmACF(x, lag.max=32, type="correlation")}
\description{Computes the autocovariance, autocorrelation or partial
autocorrelation sequences for various stochastic fractal time series models.}

\arguments{
\item{x}{an object of class \code{"lmModel"}. Use the \code{lmModel} function
to create this input.}
\item{lag.max}{the maximum number of lags at which to compute the autocovariance,
the autocorrelation or the partial autocorrelation. Default: \code{32}.}

\item{type}{a character string defining the output type based
on the following options:
\describe{
\item{"covariance"}{autocovariance sequence}

\item{"correlation"}{autocorrelation sequence}

\item{"partial"}{partial autocorrelation sequence}}

Default: \code{"correlation"}.}
}

\value{
an object of class \code{signalSeries} containing the result.
}
\details{
%
The autocovariance sequence is computed using Equation (2.10) of Beran (1994).
The autocorrelation sequence is computed by dividing the autocovariance
sequence by the variance of the process
(i.e., the value of the autocovariance sequence at lag zero).
The partial autocorrelation sequence is computed using
the Levinson-Durbin recursions.
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
\code{\link{lmModel}}, \code{\link{lmSDF}}, \code{\link{lmSimulate}}, \code{\link[ifultools]{ACVStoPACS}}.}

\examples{
models <- c("ppl","fdp","fgn")
lag <- 100
z <- lapply(models, function(x, models, lag)
    { lmACF(lmModel(x), lag=lag)@data},
    models=models, lag=lag)
names(z) <- paste(upperCase(models), "ACF")
stackPlot(seq(0,lag), z, xlab="lag")
title("Stochastic Fractal Model ACFs")
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

