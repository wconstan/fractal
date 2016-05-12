%%  WARNING: This file was automatically generated from the associated 
%%  fra_hurst.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_hurst.mid file in the project MID directory. Once the 
%%  fra_hurst.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the HDEst function

\name{HDEst}
\alias{HDEst}
\title{Hurvich-Deo estimate of number of frequencies to use in a periodogram regression}
\concept{spectral regression}
\usage{HDEst(NFT, sdf, A=0.3, delta=6/7)}
\description{Estimates the number of frequencies to use in a periodogram
regression estimate of the Hurst parameter H of a long memory
time series. Based on estimated spectrum of time series.}

\arguments{
\item{NFT}{number of points used in the Fourier transform to generate the spectrum.}

\item{sdf}{estimate of the spectrum of the time series (power, NOT dB).}
\item{A}{parameter A of Hurvich-Deo model. Default: \code{0.3} (recommended).}

\item{delta}{parameter delta of Hurvich-Deo model. Default: \code{6/7} (recommended).}
}

\value{
estimated optimum number of frequencies "m" to use
in a periodogram regression estimate of the Hurst parameter H.
}
\references{
C.M. Hurvich and R.S. Deo (1999), Plug-in Selection of the Number of
Frequencies in Regression Estimates of the Memory Parameter of a
Long Memory Time Series, \emph{J. Time Series Analysis},
\bold{20}(3), 331--341.
}

\seealso{
\code{\link{hurstBlock}}.}

\examples{
S <- sapa::SDF(beamchaos)
HDEst(NFT=length(S),as.vector(S))
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

