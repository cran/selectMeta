\name{weightLine}
\alias{weightLine}
\title{Function to plot estimated weight functions}
\description{This function faclitiates plotting of estimated weight functions according to the method in Dear and Begg (1992) or
its non-increasing version described in Rufibach (2010).}
\usage{weightLine(p, w, col0, lwd0, lty0 = 1, type = c("pval", "empirical")[1])
}
\arguments{
  \item{p}{Vector of \eqn{p}-values.}
  \item{w}{Vector of estimated weights, as outputted by \code{\link{DearBegg}} or \code{\link{DearBeggMonotone}}.}
  \item{col0}{Color of line that is drawn.}
  \item{lwd0}{Line width.}
  \item{lty0}{Line type.}
  \item{type}{Should weights be drawn versus original \eqn{p}-values (\code{type == "pval"}) or versus the empirical distribution of the 
  \eqn{p}-values (\code{type === "empirical"}).}
}
\references{
Dear, K.B.G. and Begg, C.B. (1992).
An Approach for Assessing Publication Bias Prior to Performing a Meta-Analysis.
\emph{Statist. Sci.}, \bold{7(2)}, 237--245.

Rufibach, K. (2011).
Selection Models with Monotone Weight Functions in Meta-Analysis.
\emph{Biom. J.}, to appear.
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@gmail.com}, \cr \url{http://www.kasparrufibach.ch}
}
\seealso{This function is used in \code{\link{weightLine}}.}
\examples{
# This function is used in the help file for the function DearBegg().
}
\keyword{distribution}
\keyword{htest}
\keyword{nonparametric}


