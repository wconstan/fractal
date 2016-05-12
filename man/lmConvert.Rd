%%  WARNING: This file was automatically generated from the associated 
%%  fra_model.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_model.mid file in the project MID directory. Once the 
%%  fra_model.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the lmConvert function

\name{lmConvert}
\alias{lmConvert}
\title{Stochastic fractal exponent conversion}
\concept{fractional Gaussian noisepure power lawfractional Brownian motionfractionally differenced process}
\usage{lmConvert(x, to="delta")}
\description{Estimates the unknown variance of a stochastic fractal process.}

\arguments{
\item{x}{an object of class \code{"lmModel"}. Use the \code{lmModel} function
to create this input.}
\item{to}{a character string defining the target conversion for the given model exponent.
Choices are: \code{"alpha"},\code{"delta"},\code{"HG"},\code{"HB"},\code{"beta"}. Default: \code{"delta"}.}
}

\value{
numeric value representing the converted exponent.
}
\seealso{
\code{\link{lmModel}}, \code{\link{lmConfidence}}.}

\examples{
model <- lmModel("ppl",alpha=-0.99)
lmConvert(model, to="delta")
}
\keyword{univar}
\keyword{models}
\keyword{nonlinear}

