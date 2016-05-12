%%  WARNING: This file was automatically generated from the associated 
%%  fra_kde.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_kde.mid file in the project MID directory. Once the 
%%  fra_kde.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the KDE, eda.plot.KDE, plot.KDE, print.KDE functions

\name{KDE}
\alias{KDE}
\alias{eda.plot.KDE}
\alias{plot.KDE}
\alias{print.KDE}
\title{Nonparametric multidimensional probability density function estimation}
\concept{embedding parameter estimationaverage mutual information}
\usage{KDE(x, at=NULL, n.grid=100)}
\description{Given a training matrix, this function estimates a multidimensional probability density function
using the Epanechnikov kernel as a smoother. The density function
is estimated at a specified and arbitrary set of points, i.e., at
points not necessarily members of the training set.}

\arguments{
\item{x}{a matrix whose columns contain the coordinates for each dimension.
Each row represents the location of a single point in a multidimensional embedding.}

\item{at}{the locations of the points over which the KDE is to be
calculated. Default: a multidimensional uniform grid of points spanning
the training data space (defined by \code{x}).}
\item{n.grid}{the number of divisions per dimension to using in forming
the default grid when the \code{at} input is unspecified. Default: \code{100}.}
}

\value{
an object of class \code{KDE}.
}

\section{S3 METHODS}{
\describe{

\item{eda.plot}{extended data analysis plot showing the original data along with a
perspective and contour plot of the resulting KDE. In the case that the primary input \code{x} is a single variable
(a time series), only the KDE is plotted.}

\item{plot}{plot the KDE or original (training) data.
Options are:
\describe{
\item{style}{a character string denoting the type of plot to produce. Choices
are \code{"original"}, \code{"perspective"}, and \code{"contour"} for plotting the
original training data, a perspective plot of the KDE, or a contour plot of
the KDE over the specifed dimensions.  In the case that the primary input \code{x} is a single variable
(a time series), this parameter is automatically set to unity and a KDE is plotted.
Default: \code{"original"}.}

\item{dimensions}{a two-element integer vector denoting the dimensions/variables/columns
to select from the training data and resulting multidimensional KDE for perspective
and contour plotting. In the case that the primary input \code{x} is a single variable
(a time series), this parameter is automatically set to unity and a KDE is plotted.
Default: \code{1:2} for multivariate training data, 1 for univariate training data.}

\item{xlab}{character string defining the x-axis label. Default: \code{dimnames} of the specified
\code{dimensions} of the training data. If missing, \code{"X"} is used. For univariate training data,
the x-axis label is set to the name of the original time series.}

\item{ylab}{character string defining the y-axis label. Default: \code{dimnames} of the specified
\code{dimensions} of the training data. If missing, \code{"Y"} is used. For univariate training data,
the y-axis label is set to \code{"KDE"}.}

\item{zlab}{character string defining the z-axis label for perspective plots. Default: \code{"KDE"}.}

\item{grid}{a logical flag. If \code{TRUE}, a grid is plotted for the \code{"original"} style plot.
Default: \code{"FALSE"}.}

\item{...}{Optional arguments to be passed directly to the specified plotting routine.}}}

\item{print}{a summary of the KDE object is printed.. Available options are:
\describe{
\item{justify}{text justification ala \code{prettPrintList}. Default: \code{"left"}.}

\item{sep}{header separator ala \code{prettyPrintList}. Default: \code{":"}.}

\item{...}{Additional print arguments sent directly to the \code{prettyPrintList} function).}}}

}
}

\details{
%
The kernel bandwidth is constant (non-adaptive) and is
determined by first computing the minimum variance
of all dimensions (columns) of \code{x}. This minimum variance
is then used in Scott's Rule to compute the final bandwidth.

This function is primarily used for estimating the mutual
information of a time series and is included here for illustrative
purposes.
}
\seealso{
\code{\link{timeLag}}.}

\examples{
## create a mixture of 2-D Gaussian distributed 
## RVs with different means, standard 
## deviations, point density, and orientation. 
n.sample <- c(1000, 500, 300)
ind      <- rep(1:3, n.sample)
x <- rmvnorm(sum(n.sample),
    mean = rbind(c(-10,-20), c(10,0), c(0,0))[ ind, ],
    sd   = rbind(c(5,3), c(1,3) , c(0.3,1))[ ind, ],
    rho  = c(0.5, 1, -0.4)[ind])

## perform the KDE 
z <- KDE(x)
print(z)

## plot a summary of the results 
eda.plot(z)

## form KDE of beamchaos series 
plot(KDE(beamchaos),type="l")
}
\keyword{multivariate}
\keyword{distribution}

