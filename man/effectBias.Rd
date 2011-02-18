\name{effectBias}
\alias{effectBias}
\title{Compute bias for each effect size based on estimated weight function}
\description{Based on the estimated weight function an explicit formula for the bias of each initial effect estimate can be derived,
see Rufibach (2011). This function implements computation of this bias and is called by \code{\link{DearBegg}} and \code{\link{DearBeggMonotone}}.}
\usage{
effectBias(y, u, w, theta, eta)
}
\arguments{
  \item{y}{Normally distributed effect sizes.}
  \item{u}{Associated standard errors.}
  \item{w}{Vector of estimated weights as computed by either \code{\link{DearBegg}} or \code{\link{DearBeggMonotone}}.}
  \item{theta}{Effect size estimate.}
  \item{eta}{Standard error of effect size estimate.}
  }
\value{A list consisting of the following elements:
\item{\code{dat}}{Matrix with columns \eqn{y}, \eqn{u}, \eqn{y}, \eqn{p}, bias, \eqn{y} - bias, bias / \eqn{y}, 
where the rows are provided in decreasing order of \eqn{p}-values.}
}
\references{
Rufibach, K. (2011).
Selection Models with Monotone Weight Functions in Meta-Analysis.
Preprint.
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@ifspm.uzh.ch}, \cr \url{http://www.biostat.uzh.ch/aboutus/people/rufibach.html}
}
\examples{
# For an illustration see the help file for the function DearBegg().
}
\keyword{distribution}
\keyword{htest}
\keyword{nonparametric}
