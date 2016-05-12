%%  WARNING: This file was automatically generated from the associated 
%%  fra_dim.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_dim.mid file in the project MID directory. Once the 
%%  fra_dim.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the spaceTime, as.matrix.spaceTime, eda.plot.spaceTime, plot.spaceTime, print.spaceTime functions

\name{spaceTime}
\alias{spaceTime}
\alias{as.matrix.spaceTime}
\alias{eda.plot.spaceTime}
\alias{plot.spaceTime}
\alias{print.spaceTime}
\title{Space time separation plot}
\concept{topologyorbital lag estimationembedding parameter estimation}
\usage{spaceTime(x, dimension=2, tlag=timeLag(x, method="acfdecor"),
    olag.max=as.integer(min(500,length(x)/20)), probability=0.1)}
\description{This function can be used to generate contours of a space time
separation plot. This plot type is a visual tool which can help to
determine the correlation time for a particular delay embedding of a
given time series.}

\arguments{
\item{x}{a vector holding a scalar time series}
\item{dimension}{the desired embedding dimension. Default: \code{2}.}

\item{olag.max}{an integer representing the maximum orbital lag
ot use in forming the results. Default: \code{as.integer(min(500,length(x)/20))}.}

\item{probability}{a positive numeric scalar on the interval (0,1) which
gives the probability associated with the first contour. This input
determines the number of contours to be generated (see the output
description below). Default: \code{0.1}.}

\item{tlag}{the delay used to create the delay embedding. Default: \code{timeLag(x, method="acfdecor")}.}
}

\value{
an object of class \code{spaceTime}.
}

\section{S3 METHODS}{
\describe{

\item{as.matrix}{convert the output to a matrix.}

\item{eda.plot}{plot a summary of the space-time contours including a density function estimate
of the median contour in addition to a suggested range of suitable orbital lags. In the latter case,
the most populous values of the median contour are highlighted by a cross-hatched area that covers a plot
of the median curve. The suggested range for a suitable orbital lag is based on the range of values that first
escape this cross-hatched region. Optional parameters include:
\describe{
\item{type}{An integer denoting the type of line to plot ala the \code{par} function. Default: \code{"l"} (solid line).}

\item{density}{The density of the cross-hatched area ala the \code{polygon} function. Default: \code{10}.}

\item{add}{A logical flag. If \code{TRUE}, the plot is added using the current \code{par} settings.
Otherwise, the \code{par} settings are adjusted as needed. Default: \code{FALSE}.}

\item{...}{Additional parameters sent directly to the \code{par} function.}}}

\item{plot}{plot the space-time contours for the given \code{spaceTime} object.
Optional arguments include:
\describe{
\item{lty}{Line type ala the \code{par} function. Default: \code{1}.}

\item{color}{A vector of integers defining the contour line colors. Default: \code{1:8}.}

\item{xlab}{A character string denoting the x-axis label. Default: \code{"Orbital Lag"}.}

\item{ylab}{A character string denoting the y-axis label. Default: \code{"Spatial Separation"}.}

\item{main}{A character string denoting the title label. Default: \code{NULL} (no title).}

\item{cex}{Character expansion value ala \code{par}. Default: \code{1}.}

\item{pch}{An integer representing the plot character ala \code{par}. Default: \code{"."}.}

\item{add}{A logical flag. If \code{TRUE}, the plot is added using the current \code{par} settings.
Otherwise, the \code{par} settings are adjusted as needed. Default: \code{FALSE}.}

\item{...}{Additional parameters sent directly to the \code{par} function.}}}

\item{print}{print a summary of the \code{spaceTime} object.}

}
}

\details{
%
Each contour, \eqn{C_p(\Delta t)}{C(p,dt)}, in a space time
separation plot corresponds to a particular probability, \eqn{p},
and gives spatial distance between pairs of phase space vectors as a
function of their temporal separation. In
particular, any pair of vectors seperated in time by
\eqn{\Delta t}{dt} are separated in the phase space by distance
\eqn{C_p(\Delta t)}{C(p,dt)} with probability \eqn{p}.
}
\references{
Holger Kantz and Thomas Schreiber, \emph{Nonlinear Time Series Analysis},
Cambridge University Press, 1997.
}

\seealso{
\code{\link{embedSeries}}, \code{\link{determinism}}, \code{\link{timeLag}}.}

\examples{
## Using the beamchaos data calculate the space 
## time separation contours for probabilities 
## 1/10, 2/10, ..., 1, for a 3-dimensional 
## delay embedding with delay of 10. Plot the 
## resulting contours, which will reveal 
## periodicity in the data. From the top 
## contour in the plot, which corresponds to 
## probability 1, we can conclude that any two 
## vectors in the chosen delay embedding which 
## are separated in time by approximately 90 
## time steps are separated by a distance of at 
## least 8 in the phase space. 
z <- spaceTime(beamchaos, dim=3, tlag=10,
    olag.max=500, probability=1/10)

## print the results 
print(z)

## plot the results 
plot(z)

## extended data analysis plot 
eda.plot(z)
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

