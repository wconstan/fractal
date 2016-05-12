%%  WARNING: This file was automatically generated from the associated 
%%  fra_chaos.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_chaos.mid file in the project MID directory. Once the 
%%  fra_chaos.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the henon function

\name{henon}
\alias{henon}
\title{Henon map}
\concept{chaotic maps}
\usage{henon(start=rnorm(2), a=1.4, b=0.3, n.sample=2000, n.transient=10)}
\description{Calculates the Henon map states using the specifed parameter set.
The Henon map is defined as
\deqn{ x_n = a - x_{n - 1}^2 + b y_{n - 1}}{x[n] = a - x[n - 1]^2 + b * y[n - 1]}
\deqn{ y_n = x_{n - 1}}{y[n] = x[n - 1].}

A parameter set of \eqn{a=1.4} and \eqn{b=0.3} is known to
produce a deterministic chaotic response.}

\arguments{
\item{start}{a two-element vector of numeric values denoting the starting
values for the X and Y Henon coordinates, respectively.}
\item{a}{the \bold{a} parameter. Default: \code{1.4}.}

\item{b}{the \bold{b} parameter. Default: \code{0.3}.}

\item{n.sample}{an integer denoting the number of iterates to create beyond that
specified by \code{n.transient}. Default: \code{2000}.}

\item{n.transient}{an integer denoting the number of transient points.
These transients are removed from the output. Default: \code{10}.}
}

\value{
a list of vectors named \code{x} and \code{y} corresponding to the X- and Y states of the Henon map, respectively.
}
\seealso{
\code{\link{lorenz}}, \code{\link{lorenz.ode}}.}

\examples{
plot(henon(),pch=".",cex=0.1)
}
\keyword{models}
\keyword{nonlinear}

