%%  WARNING: This file was automatically generated from the associated 
%%  fra_data.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_data.mid file in the project MID directory. Once the 
%%  fra_data.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the beamchaos function

\name{beamchaos}
\alias{beamchaos}
\title{Chaotic beam data}
\concept{simulated time series}
\description{A flexible thin steel beam was mounted vertically to a
electromechanical shaker which provided a transverse
sinusoidal excitation.  The beam tip was placed near two rare
earth magnets so as to provide nonlinear buckling forces. The
beam was treated with a viscoelastic strip adhered to one side
to provide a little damping. The addition of the damping
treatment helps to form a more distinguishable fractal
structure in phase space embeddings.  A laser vibrometer was
used to record the beam tip velocity and the analog signal
streamed to a National Instruments data acquisition board. The
data was sampled at 1000 Hz. The gain of excitation was adjusted
until (seemingly) chaotic motion was observed.}

\references{
William Constantine (1999),
Ph.D. Dissertation: \emph{Wavelet Techniques for Chaotic and Fractal Dynamics},
Mechanical Engineering Department, University of Washington.
}

\seealso{
\code{\link{ecgrr}}, \code{\link{eegduke}}, \code{\link{lorenz}}, \code{\link{pd5si}}.}

\examples{
plot(beamchaos)
}
\keyword{data}

