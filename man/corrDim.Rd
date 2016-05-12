%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the corrDim function

\name{corrDim}
\alias{corrDim}
\title{Correlation dimension}
\concept{chaotic invariant, correlation dimension}
\usage{corrDim(x, dimension=5,
    tlag=timeLag(x, method="acfdecor"), olag=0, resolution=2)}
\description{Estimates the correlation dimension by forming a delay embedding
of a time series, calculating correlation summation curves (one per embedding
dimension), and subsequently fitting the slopes of these curves on a log-log scale using a robust
linear regression model. If the slopes converge at a given embedding dimension \eqn{E}, then
\eqn{E} is the correct embedding dimension and the (convergent) slope value is an estimate
of the correlation dimension for the data.}

\arguments{
\item{x}{a vector containing a uniformly-sampled real-valued time series or
a matrix containing an embedding with each column representing a different coordinate.
If the latter, the \code{dimension} input is set to the number of columns and the
\code{tlag} input is ignored.}
\item{dimension}{the maximal embedding dimension. Default: \code{5}.}

\item{olag}{the number of points along the trajectory of the
current point that must be exceeded in order for
another point in the phase space to be considered
a neighbor candidate. This argument is used
to help attenuate temporal correlation in the
the embedding which can lead to spuriously low
correlation dimension estimates. The orbital lag
must be positive or zero. Default: \code{length(x)/10} or \code{500}, whichever is smaller.}

\item{resolution}{an integer representing the spatial resolution factor.
A value of P increases the number of effective
scales by a factor of P at a cost of raising
the \eqn{\ell_\infty}{L-infinity} norm to the Pth power.
For example, setting the resolution to 2
will double the number of scales while imposing
and additional multiplication operation. The
resolution must exceed unity. Default: \code{2}.}

\item{tlag}{the time delay between coordinates.
Default: \code{timeLag(x, method="acfdecor")}, the decorrelation time of the autocorrelation function.}
}

\value{
an object of class \code{chaoticInvariant}.
}

\section{S3 METHODS}{
\describe{

\item{eda.plot}{plots an extended data analysis plot, which graphically summarizes
the process of obtaining a correlation dimension estimate. A time history,
phase plane embeddding, correlation summation curves, and the slopes of correlation summation
curves as a function of scale are plotted.}

\item{plot}{plots the correlation summation curves on a log-log scale. The following
options may be used to adjust the plot components:

\describe{
\item{type}{Character string denoting the type of data to be plotted. The \code{"stat"} option
plots the correlation summation curves while the \code{"dstat"} option plots a 3-point estimate
of the derivatives of the correlation summation curves. The \code{"slope"} option plots the estimated
slope of the correlation summation curves as a function of embedding dimension. Default: \code{"stat"}.}

\item{fit}{Logical flag. If \code{TRUE}, a regression line is overlaid for each curve. Default: \code{TRUE}.}

\item{grid}{Logical flag. If \code{TRUE}, a grid is overlaid on the plot. Default: \code{TRUE}.}

\item{legend}{Logical flag. If \code{TRUE}, a legend of the estimated slopes as a function of
embedding dimension is displayed. Default: \code{TRUE}.}

\item{...}{Additional plot arguments (set internally by the \code{par} function).}}}

\item{print}{prints a qualitiative summary of the results.}

}
}

\details{
%
To estimate the correlation dimension, correlation summation
curves must be generated and subsequently fit with a
robust linear regression model to obtain the slopes of these
curves on a log-log plot. The dimension at which these
slope estimates (appear to) converge reveals the proper
embedding dimension for the data and the slope at this
(and higher) embedding dimensions is an estimate of the
correlation dimension. The function used to fit the
correlation summation curves is \code{lmsreg} which fits a robust
linear model to the data using the method of least median of squares
regression. See the on-line help documentation for help on the \code{lmsreg}
function: in R, \code{lmsreg} is found in the \code{MASS} package while in S-PLUS it is indigenous
and appears in the \code{splus} database.

The correlation summation at scale \eqn{\varepsilon}{eps}
for a given embedding dimension is defined as
\deqn{C_2(\varepsilon)={ 2 \over (N - \gamma)(N - \gamma - 1) }
\sum_{i=1}^N\sum_{j=i+\gamma+1}^N\Theta(\varepsilon - || \mathbf{X_i} - \mathbf{X_j} ||),}{C2(eps)=2 / (N - gamma)/(N - gamma - 1) * sum{i=1:N}sum{j=i+1+gamma:N} H(eps - || Xi - Xj ||),}
where \eqn{\Theta(\cdot)}{H} is the Heavyside function
\deqn{ \Theta(x)=\left\{
\begin{array}{ll}
0,& \mbox{if $x \le 0$;}\\
1,& \mbox{otherwise}
\end{array}
\right.}{H(x)=0 if x <= 0 and H(x)=1 for x > 1,}

and \eqn{\mathbf{X_i}}{Xi} is the \eqn{i}th point of a
collection of \code{N} points in the phase space. The parameter
\eqn{\gamma}{gamma} is the orbital lag.

The algorithm used to calculate the correlation summation
is made computationally efficient by using:
\describe{
\item{1}{The \eqn{\ell_\infty}{L-infinity}
norm to calculate the distance between neighbors in the phase space as
opposed to (say) the \eqn{\ell_2}{L2} norm which involves taking
computationally intense square root and power of two
operations. The \eqn{\ell_\infty}{L-infinity} norm of the distance between
two points in the phase space is the absolute value of
the maximal difference between any of the points' respective
coordinates, i.e. if \eqn{\mathbf{X}=[z_1, z_2, z_3]^T}{X ={z1, z2, z3}}
then \eqn{||\mathbf{X}||_\infty \equiv \max_i |z_i|}{||X|| sub infinity=max{i}(zi)}.}

\item{2}{Bitwise masking and shift operations to reveal
the radix-2 exponent of the \eqn{\ell_\infty}{L-infinity} norm. This direct
means of obtaining the exponent immediately yields the
associated scale of the distance between neighbors in the
phase space while avoiding costly log operations. The bitwise
mask and shift factors are based on the IEEE standard 754
for binary floating-point arithmetic. Initial tests are
performed in the code to verify that the current machine
follows this standard.}

\item{3}{a computationally efficient routine to calculate
the resulting value of a float raised to a positive integer power.
Specifically, the \eqn{\ell_\infty}{L-infinity} norm is raised to an
integer power (\code{p}) to
effectively increase the spatial resolution
by a factor of \code{p}.}}


The correlation summation curves \eqn{C_2(E,\varepsilon)}{C2(E,eps)}
where \code{E} is the embedding dimension and
\eqn{\varepsilon}{eps} is the scale, the correlation dimension curves
\eqn{D_2(E,\varepsilon)}{D2(E,eps)} can be calculated by
\deqn{D_2(E,\varepsilon) ={\ln C_2(E,2\varepsilon) - \ln C_2(E,\varepsilon/2) \over
\ln 2\varepsilon - \ln \varepsilon/2} ={1 \over 2} \log_2{ C_2(E,2\varepsilon) \over
C_2(E,\varepsilon/2) }.}{D2(E,eps)=log2 (C2(E,2*eps) / C2(E,eps / 2)) / 2}
This formulation is used to help suppress numerical instabilities that are present in
other numerical derivative schemes such as a first order difference.

As a caveat to the user, the slope estimates of the correlation summation
curves will typically display a fair amount of variability and the range
of scales over which the slopes are approximately linear may be small. Inasmuch,
the correlation dimension estimate should always be interpretted as a subjective summary
statistic, even when the original times series is representative of a truly noise-free
chaotic response.
}
\references{
Peter Grassberger and Itamar Procaccia (1983),
Measuring the strangeness of strange attractors,
\emph{Physica D}, \bold{9}, 189--208.

Holger Kantz and Thomas Schreiber (1997),
\emph{Nonlinear Time Series Analysis},
Cambridge University Press.

Peter Grassberger and Itamar Procaccia (1983),
Characterization of strange attractors,
\emph{Physical Review Letters}, \bold{50}(5), 346--349.

Rousseeuw, P. J. (1984). Least median of squares regression. \emph{Journal
of the American Statistical Association}, \bold{79}, 871--88.
}

\seealso{
\code{\link{infoDim}}, \code{\link{embedSeries}}, \code{\link{timeLag}}, \code{\link{chaoticInvariant}}, \code{\link{lyapunov}}, \code{\link{poincareMap}}, \code{\link{spaceTime}}, \code{\link{findNeighbors}}, \code{\link{determinism}}.}

\examples{
## calculate the correlation dimension estimates 
## for chaotic beam data using a delay 
## embedding for dimensions 1 through 10, a 
## orbital lag of 10, and a spatial resolution 
## of 4. 
beam.d2 <- corrDim(beamchaos, olag=10, dim=10, res=4)

## print a summary of the results 
print(beam.d2)

## plot the correlation summation curves 
plot(beam.d2, fit=FALSE, legend=FALSE)

## plot an extended data analysis plot 
eda.plot(beam.d2)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

