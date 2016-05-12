%%  WARNING: This file was automatically generated from the associated 
%%  fra_chaos.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_chaos.mid file in the project MID directory. Once the 
%%  fra_chaos.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lorenz.ode function

\name{lorenz.ode}
\alias{lorenz.ode}
\title{Lorenz system ODEs}
\concept{utilities}
\usage{lorenz.ode(x, sigma=10, r=28, b=8/3)}
\description{Ordinary differential equations fro the Lorenz system. See
the help documentation for the \code{lorenz} data object for more information.
A parameter space defined by \code{sigma=10}, \code{r=28}, and \code{b=8/3} is known
to produce chaotic motion.}

\arguments{
\item{x}{a three-element numeric vector representing the current X, Y, and Z states, respectively, of the Lorenz system.}
\item{b}{the b parameter. Default: \code{8/3}.}

\item{r}{the r parameter. Default: \code{28}.}

\item{sigma}{the sigma parameter. Default: \code{10}.}
}

\value{
a vector of three values representing the Lorenz states X, Y, and Z, respectively, evaluated with the specified parameter regime.
}
\seealso{
\code{\link{lorenz}}, \code{\link{henon}}.}

\examples{
lorenz.ode(c(0.3,-0.1,1.0))
}
\keyword{models}
\keyword{nonlinear}

