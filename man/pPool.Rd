\name{pPool}
\alias{pPool}
\title{Pool p-values in pairs}
\description{To avoid unidentifiability in estimation of a selection function, Dear and Begg (1992) pool \eqn{p}-values in 
pairs.}
\usage{pPool(p)}
\arguments{
  \item{p}{Vector of \eqn{p}-values.}
}
\value{Vector of pooled \eqn{p}-values.}
\references{
Dear, K.B.G. and Begg, C.B. (1992).
An Approach for Assessing Publication Bias Prior to Performing a Meta-Analysis.
\emph{Statist. Sci.}, \bold{7(2)}, 237--245.

Rufibach, K. (2010).
Selection Models with Monotone Weight Functions in Meta-Analysis.
Preprint.
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@ifspm.uzh.ch}, \cr \url{http://www.biostat.uzh.ch/aboutus/people/rufibach.html}
}
\seealso{This function is used in \code{\link{weightLine}}.}
\examples{
# This function is used in the help file for the function DearBegg().
}
\keyword{distribution}
\keyword{htest}
\keyword{nonparametric}
