\name{IyenGreen}
\alias{IyenGreen}
\alias{IyenGreenLoglikT}
\alias{IyenGreenMLE}
\alias{IyenGreenWeight}
\alias{normalizeT}
\title{Compute MLE and weight functions of Iyengar and Greenhouse (1988)}
\description{Two parameteric weight functions for selection models were introduced in Iyengar and Greenhouse (1988):

\deqn{w_1(x; \beta, q) = |x|^\beta / t(q, \alpha)}

\deqn{w_2(x; \gamma, q) = e^{-\gamma}}

if \eqn{|x| \le t(q, \alpha)} and \eqn{w_1(x; \beta, q) = w_2(x; \gamma, q) = 1} otherwise. Here, \eqn{t(q, \alpha)} is the \eqn{\alpha}-quantile of a \eqn{t} distribution
with \eqn{q} degrees of freedom. The functions \eqn{w_1} and \eqn{w_2} are used to model the selection process that may be present 
in a meta analysis, in a model where effect sizes are assumed to follow a \eqn{t} distribution. We have implemented estimation of the parameters in
this model in \code{IyenGreenMLE} and plotting in \code{IyenGreenWeight}. 
The functions \code{normalizeT} and \code{IyenGreenLoglikT} are used in computation of ML estimators and not intended to be called by the user.
For an example how to use \code{IyenGreenMLE} and \code{IyenGreenWeight} we refer to the help file for \code{\link{DearBegg}}.
}
\usage{
normalizeT(s, theta, b, q, N, type = 1, alpha = 0.05)
IyenGreenLoglikT(para, t, q, N, type = 1)
IyenGreenMLE(t, q, N, type = 1, alpha = 0.05)
IyenGreenWeight(x, b, q, type = 1, alpha = 0.05)
}
\arguments{
  \item{s}{Quantile where normalizing integrand should be computed.}
  \item{theta}{Vector containing effect size estimates of the meta analysis.}
  \item{b}{Parameter that governs shape of the weight function. Equals \eqn{\beta} for \eqn{w_1} and \eqn{\gamma} for \eqn{w_2}.}
  \item{q}{Degrees of freedom in the denominator of \eqn{w_1, w_2}. Must be a real number.}
  \item{N}{Number of observations in each trial.}
  \item{type}{Type of weight function in Iyengar & Greenhouse (1988). Either 1 (for \eqn{w_1}) or 2 (for \eqn{w_2}).}
  \item{alpha}{Quantile to be used in the denominator of \eqn{w_1, w_2}.}
  \item{para}{Vector in \eqn{R^2} over which log-likelihood function is maximized.}
  \item{t}{Vector of real numbers, \eqn{t} test statistics.}
  \item{x}{Vector of real numbers where weight function should be computed at.}
}
\details{Note that these weight functions operate on the scale of \eqn{t} statistics, not \eqn{p}-values.}
\value{See example in \code{\link{DearBegg}} for details.}
\references{
Iyengar, S. and Greenhouse, J.B. (1988).
Selection models and the file drawer problem (including rejoinder).
\emph{Statist. Sci.}, \bold{3}, 109--135.
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@ifspm.uzh.ch}, \cr \url{http://www.biostat.uzh.ch/aboutus/people/rufibach.html}
}
\seealso{For nonparametric estimation of weight functions see \code{\link{DearBegg}}.}
\examples{
# For an illustration see the help file for the function DearBegg().
}
\keyword{distribution}
\keyword{htest}
\keyword{nonparametric}


