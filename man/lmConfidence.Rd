%%  WARNING: This file was automatically generated from the associated 
%%  fra_model.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_model.mid file in the project MID directory. Once the 
%%  fra_model.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lmConfidence function

\name{lmConfidence}
\alias{lmConfidence}
\title{Confidence intervals for unknown mean}
\concept{fractional Gaussian noiseconfidence intervalspure power lawfractional Brownian motionfractionally differenced process}
\usage{lmConfidence(x, model, conf.level=0.95,
    parm.known=FALSE, n.rep=100000)}
\description{Estimates confidence intervals for an unknown
process mean of a time seeries well modeled by a stochastic fractal
process.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series or an
object of class \code{wavTransform}.}

\item{model}{an object of class \code{"lmModel"}. Use the \code{lmModel} function
to create this input.}
\item{conf.level}{confidence interval probability on the interval (0,1). Default: \code{0.95}.}

\item{n.rep}{number of repititions in a Monte Carlo study. Default: \code{100000}.}

\item{parm.known}{a logical value. Default: \code{FALSE}.}
}

\value{
an two-element vector defining the low and high limits
of the estimated confidence interval.
}
\references{
D. Percival and A. Walden (2000),
\emph{Wavelet Methods for Time Series Analysis},
Cambridge University Press, Chapter 7.
}

\seealso{
\code{\link{lmSimulate}}.}

\examples{
model <- lmModel("ppl",alpha=-0.9)
lmConfidence(lmSimulate(model), model)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

