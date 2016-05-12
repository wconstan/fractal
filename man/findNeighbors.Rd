%%  WARNING: This file was automatically generated from the associated 
%%  fra_neig.mid file. Do NOT edit this Rd file to make a change. Instead, 
%%  edit the fra_neig.mid file in the project MID directory. Once the 
%%  fra_neig.mid file has been updated, this Rd file, and all other 
%%  documentation (such as corresponding LaTeX, SGML and HTML documentation) 
%%  should be regenerated using the mid.pl Perl script. 

%% R documentation for the findNeighbors function

\name{findNeighbors}
\alias{findNeighbors}
\title{Nearest neighbor search in a multidimensional space}
\concept{topologyembedding parameter estimation}
\usage{findNeighbors(x, n.neighbor=NULL, metric=1, max.distance = 0.,
    olag=0, sort.distances=TRUE)}
\description{Finds a user specified number of nearest neighbors of
a multivariate space defined by the coordinates of the input
matrix. Alternatively, the
user can specify a maximum distance over which to search for
nearest neighbors.}

\arguments{
\item{x}{an embedding matrix. Each column of the matrix respresents
a single coordinate of the embedding and each
row denotes the coordinates of a single point
in the embedding.}
\item{max.distance}{used an alternative to \code{n.neighbor}, use this
parameter to specify the maximum distance to
search relative to the current point in the
phase space. The metric for the distance is specified separately by
the optional \code{metric} input argument. This arguments must
be positive and will only be used if \code{n.neighbor} is \code{NULL},
equal to zero, or less than zero. Default: \code{0.0}.}

\item{metric}{the metric used to define the distance between
points in the embedding. Choices are limited to \code{1}, \code{2}, or
\code{Inf} which represent an \eqn{L_1}{L1}, \eqn{L_2}{L2}, and
\eqn{L_\infty}{L-inf} norm, respectively. Default: \code{1}.}

\item{n.neighbor}{the number of neighbors to find for each point in
the embedding. If not \code{NULL}, this argument overrides the \code{max.distance}
argument. Default: \code{2}.}

\item{olag}{an integer scalar representing the orbital lag, which defines the
number of points along a trajectory (both forwards and backwards) that are to be excluded
as nearest neighbor candidates. This argument helps to prevent temporally correlated data samples
from being considered as neighbors to a given point in the embedding. This sitatuation can
arise, for example, when a smooth trajectory has been highly oversampled in time. An orbital lag of 0
implies that the reference point itself may be considered a neighbor candidate. To exclude self-neighbors,
set \code{olag} greater than zero. Default: \code{0}.}

\item{sort.distances}{a logical flag. If \code{TRUE}, the neighbors for a given point
are sorted by distance from closest to farthest. Default: \code{TRUE}.}
}

\value{
a list containing the indices of the original points
(corresponding to rows of the embedding
matrix), the indices of the neighbors found, and the distance
between them. The distance metric is based on that specified
by the optional \code{metric} input argument.
}
\details{
%
An efficient recursive algorithm is used to find all nearest
neighbors. First a quadtree is developed to form a recursive partitioning of
the embedding matrix, returning row and column index vectors and a list of medians
which may be used to sort the embedding matrix.
The quadtree is then traversed as an efficient means to find nearest neighbors.
}
\references{
Friedman, J., Bentley, J. L., and Finkel, R. A.,
``An algorithm for finding best matches in logarithmic expected time",
\emph{ACM Transactions on Mathematical Software} \bold{3}, 209--226, 1977.
}

\seealso{
\code{\link{FNN}}, \code{\link{FNS}}.}

\examples{
## Calculate the 10 nearest neighbors for each 
## point of 3-dimensional delayed coordinate 
## embedding of the beamchaos data. Exclude 
## self-neighbors from the output. 
embedding <- embedSeries( beamchaos, dim = 3, tlag = 10 )
nn <- findNeighbors( embedding, n.neighbor=10, olag=1 )

## Using the same data, find only those neighbors 
## within a distance 0.1 of the original points 
## based on an L-infinity metric 
nn.dist <- findNeighbors( embedding, max.distance=0.1,
metric=Inf, olag=1 )
}
\keyword{distribution}

