%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the hurstACVF function

\name{hurstACVF}
\alias{hurstACVF}
\title{Estimate the Hurst coefficient by regression of scaled asinh plot of ACVF vs log(lag)}
\concept{Hurst coefficient estimation}
\usage{hurstACVF(x, Ascale=1000, lag.min=1, lag.max=64)}
\description{Estimates long memory parameters beta (ACVF decay exponent),
alpha (Equivalent PPL model spectral density exponent), and H
(Equivalent Hurst parameter) by linear regression of scaled asinh
of ACVF versus log(lag) over intermediate lag values.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series.}
\item{Ascale}{scale factor for use in the scaled asinh plot. Default: \code{1000}.}

\item{lag.max}{maximum lag for use in linear regression. Default: \code{64}.}

\item{lag.min}{minimum lag for use in linear regression. Default: \code{1}.}
}

\value{
a list with three components:

\item{beta}{decay exponent of autocovariance function}

\item{alpha}{spectral density exponent of equivalent PPL model}

\item{H}{Hurst exponent for equivalent ACVF decay rate}
}
\details{
%
Evaluates autocovariance function (ACVF) of input time series by call to S-Plus
function \code{acf}. Constructs sequence asinh(Ascale * ACVF) / asinh(Ascale)
and does linear regression (via S-Plus function "lsfit") of this sequence
versus log(lag) from \code{lag.min} to \code{lag.max}. Draws a plot of the sequence and
the fit line. Recommended usage: look at resulting plot. Is the intermediate
range approximately linear? If plot is too flat, decrease Ascale. If it
decreases to zero too quickly, increase Ascale. Values of Ascale from 10
to \eqn{10^6} have been found useful. If \code{lag.min}
and \code{lag.max} do not bound the range where the sequence is
approximately linear then change them and rerun the function to produce a better fit.
}
\references{
A. G. Gibbs and D. B. Percival, Forthcoming paper on the autocovariance
of the PPL (pure power law) model. A section of the paper discusses
the usefulness of scaled asinh plots.
}

\seealso{
\code{\link{hurstBlock}}.}

\examples{
hurstACVF(wmtsa::nile, Ascale=1000000, lag.min=3, lag.max=68)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

