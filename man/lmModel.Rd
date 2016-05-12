%%  WARNING: This file was automatically generated from the associated 
%%  fra_model.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_model.mid file in the project MID directory. Once the 
%%  fra_model.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lmModel function

\name{lmModel}
\alias{lmModel}
\title{Constructor function for objects of class "lmModel"}
\concept{fractional Gaussian noisespectral density function generationpure power lawfractional Brownian motionfractionally differenced process}
\usage{lmModel(model, variance.=1.0, delta=0.45,
    alpha=-0.9, HG=0.95, HB=0.95,
    innovations.var=NULL, Cs=NULL,
    bterms=10, dterms=10, M=100)}
\description{Packs the parameters defining a specfied stochastic fractal time series
model into a list an returns the result.}

\arguments{
\item{model}{a character string defining the model type. Choices are
\describe{
\item{\code{"ppl"}}{Pure power law (PPL) process. A process \eqn{\{X_t\}}{{X(t)}}
is a PPL process if its SDF is given by
\deqn{
S_X(f) = C_S |f|^\alpha,
\quad\hbox{$|f| \le {1/2}$},
}{S(X,f) = Cs * |f|\eqn{\mbox{\textasciicircum}}{^}alpha}
where \eqn{C_S > 0}{Cs > 0}. The innovations variance for this process
is given by
\eqn{C_s e^{-\alpha(\log(2)+1)}}{Cs * exp(-alpha*(log(2)+1))}
(this is the variance of the best linear predictor of the process
given its infinite past).}

\item{\code{"fdp"}}{Fractionally differenced (FD) process. A process \eqn{\{X_t\}}{{X(t)}}
is a FD process if its SDF is given by
\deqn{ S_X(f) ={\sigma_\varepsilon^2 \over [4 \sin^2 (\pi f) ]^{\delta}}, \quad\hbox{$|f| \le {1/2}$}
}{S(X,f) = sigma^2 / (2 * sin(pi*f) )^(2 * delta) for |f| <= 1/2}
where \eqn{\sigma_\varepsilon^2}{sigma^2} is the
innovations variance, and \eqn{\delta}{delta} is the FD parameter.
Thus, an FD model is completely defined by the innovations variance
and FD parameter.}

\item{\code{"fgn"}}{Fractional Gaussian noise (FGN) process. An FGN process \eqn{\{X_t\}}{{X(t)}}
is a \emph{stationary} Gaussian process if its ACVF is given by
\deqn{
s_{X,\tau} = {\sigma^2_X\over 2} \left(|
\tau + 1 |^{2H_G} - 2 | \tau |^{2H_G} + | \tau - 1 |^{2H_G}
\right),
}{s(X,k) = var{X}/2 *(|k + 1|^(2*Hg) - 2*|k|^(2*Hg) + |k + 1|^(2*Hg))}
where \eqn{\sigma^2_X > 0}{var{X} > 0} is the variance of the process,
while \eqn{0 < H_G <1}{Hg} is the so-called Hurst coefficient.
The coefficient \eqn{H_G}{Hg} is sometimes called
the self-similarity parameter for a FGN process
and is usually designated in the literature as simply \eqn{H}.}

\item{\code{"dfbm"}}{Discrete Fractional Brownian Motion. i.e., regularly-spaced samples from a FBM process
that is defined over the entire real axis.}}}
\item{Cs}{pure power law constant.
If supplied, this argument is used to compute \code{variance} and \code{innovations.var}.
If not supplied and \code{innovations.var} is supplied, then \code{Cs} and
\code{variance} are determined from the \code{innovations.var}.
Default: \code{NULL}.}

\item{HB}{the Hurst coefficient for a DFBM process. Default: \code{0.95}.}

\item{HG}{the Hurst coefficient for an FGN process. Default: \code{0.95}.}

\item{M}{sets the number of terms used
in the Euler-Maclaurin summation
for calculating the SDF of an FGN process and DFBM process.
The default value should be adequate
for all values of the Hurst coefficient.
Default: \code{100}.}

\item{alpha}{power law exponent for a PPL model. Default: \code{-0.9}.}

\item{bterms}{an integer used to control the number of primary terms cumulatively summed in computing an ACVS for a PPL process. Default: \code{10}.}

\item{delta}{the FD parameter. Default: \code{0.45}.}

\item{dterms}{an integer used to control the number of secondary terms cumulatively summed in computing an ACVS for a PPL process. Default: \code{10}.}

\item{innovations.var}{innovations variance for an FD or PPL model.
If supplied, this argument is used to compute \code{variance} and, for a PPL model, \code{Cs}.
If not supplied and \code{Cs} is supplied for a PPL model, then \code{Cs}
determines \code{innovations.var}.
If not supplied and \code{Cs} is also not supplied for a PPL model or if not supplied for an FD model,
then \code{variance} determines \code{innovations.var}.
Default: \code{NULL}.}

\item{variance.}{the process variance with a default of unity.
If \code{cs} or \code{innovations.var} is specified, this parameter is set in agreement with those.
If the process is nonstationary but has stationary differences, i.e., incrementally stationary,
then the process variance is taken to be the variance of the stationary
process that is formed by appropriately differencing the nonstationary process.}
}

\value{
an object of class \code{lmModel} containing a list of model parameters.
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
\code{\link{lmACF}}, \code{\link{lmSDF}}, \code{\link{lmSimulate}}, \code{\link{lmConvert}}, \code{\link{lmConfidence}}, \code{\link{FDWhittle}}.}

\examples{
lmModel("ppl", alpha=-2.0)
lmModel("fdp", delta=0.45, innov=1.3)
lmModel("fgn", HG=0.98)
lmModel("dfbm", HB=0.35)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

