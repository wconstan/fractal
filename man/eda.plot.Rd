\name{eda.plot}
\alias{eda.plot}
\title{Generic function for generating extended data analysis plots}
\concept{wavelet}
\usage{eda.plot(x, ...)}
\description{Data analysis plots are used to visually summarize the salient features
of the output and typically involve a combination of plots
in a single plot frame.}

\arguments{
\item{x}{any object. Missing values ( NAs) are allowed.}
\item{...}{optional arguments to be passed directly to the
inherited function without alteration and with the original names preserved.}
}
\note{An extended data analysis plot is shown.}

\seealso{
\code{\link{wavMRD}}, 
\code{\link{determinism}}, 
\code{\link{chaoticInvariant}}, 
\code{\link{embedSeries}}, 
\code{\link{fractalBlock}},
\code{\link{KDE}}, 
\code{\link{spaceTime}}, 
\code{\link{surrogate}}.
}

\examples{
methods(eda.plot)
}
\keyword{methods}

