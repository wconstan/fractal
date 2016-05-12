%%  WARNING: This file was automatically generated from the associated 
%%  fra_data.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_data.mid file in the project MID directory. Once the 
%%  fra_data.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lorenz function

\name{lorenz}
\alias{lorenz}
\title{Chaotic response of the Lorenz system}
\concept{simulated time series}
\description{The Lorenz system is defined by the third order set of
ordinary differential equations:
\deqn{\dot{x} = \sigma(y-x)}{dx/dt = sigma( y - x ),}
\deqn{\dot{y} = rx-y-xz}{dy/dt = rx - y - xz,}
\deqn{\dot{z} = -bz + xy}{dz/dt = -bz + xy}.

If the parameter set is \eqn{\sigma=10$, $r=28$, $b=8/3}{sigma=10, r=28, b=8/3},
then the system response is chaotic. The Lorenz is one the hallmark examples
used in illustrating nonlinear deterministic chaotic motion.}

\seealso{
\code{\link{beamchaos}}, \code{\link{ecgrr}}, \code{\link{eegduke}}, \code{\link{pd5si}}.}

\examples{
plot(lorenz[,1], lorenz[,3], pch=".", col="blue")
}
\keyword{data}

