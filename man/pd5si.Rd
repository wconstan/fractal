%%  WARNING: This file was automatically generated from the associated 
%%  fra_data.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_data.mid file in the project MID directory. Once the 
%%  fra_data.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the pd5si function

\name{pd5si}
\alias{pd5si}
\title{Gait stride intervals for a patient with Parkinson's Disease}
\concept{measured time series}
\description{These data are from the file \code{pd5-si.txt}
in the `gait in aging and disease' database
of PhysioBank,
which is a large collection
of physiologic signals maintained
as a public service
at \code{http://www.physionet.org/physiobank}
by NIH's National Center for Research Resources.
The following quote from this Web site describes
how the stride intervals were obtained.
\emph{Subjects walked continuously on level ground around an obstacle-free path.
The stride interval was measured using ultra-thin, force sensitive resistors
placed inside the shoe. The analog force signal was sampled at 300 Hz
with a 12 bit A/D converter, using an ambulatory, ankle-worn microcomputer
that also recorded the data. Subsequently, the time between foot-strikes
was automatically computed. The method for determining the stride interval
is a modification of a previously validated method that has been shown
to agree with force-platform measures, a `gold' standard.}

\emph{Data were collected from the healthy subjects as they walked in a roughly
circular path for 15 minutes, and from the subjects with Parkinson's disease
as they walked for 6 minutes up and down a long hallway.}}

\seealso{
\code{\link{beamchaos}}, \code{\link{ecgrr}}, \code{\link{eegduke}}, \code{\link{lorenz}}.}

\examples{
plot(pd5si)
}
\keyword{data}

