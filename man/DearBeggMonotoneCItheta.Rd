\name{DearBeggMonotoneCItheta}
\alias{DearBeggMonotoneCItheta}
\alias{DearBeggProfileLL}
\alias{DearBeggToMinimizeProfile}
\title{Compute an approximate profile likelihood ratio confidence interval for effect estimate}
\description{Under some assumptions on the true underlying \eqn{p}-value density the usual likelihood ratio theory for the finite-dimensional
parameter of interest, \eqn{\theta}, holds although we estimate the infinite-dimensional nuisance parameter \eqn{w}, see Murphy and van der Vaart (2000). 
These functions implement such a confidence interval. To this end we compute the set

\deqn{\{\theta : \tilde l(\theta, \hat \sigma(\theta), \hat w(\theta)) \ge c\}}

where \eqn{c = - 0.5 \cdot \chi_{1-\alpha}^2(1)} and \eqn{\tilde l} is the relative profile log-likelihood function.

The functions \code{\link{DearBeggProfileLL}} and \code{\link{DearBeggToMinimizeProfile}} are not intended to be called by the user directly.}
\usage{
DearBeggMonotoneCItheta(res, lam = 2, conf.level = 0.95, maxiter = 500)
DearBeggProfileLL(z, res0, lam, conf.level = 0.95, maxiter = 500)
DearBeggToMinimizeProfile(vec, theta, y, u, lam)
}
\arguments{
  \item{res}{Output from function \code{\link{DearBeggMonotone}}.}
  \item{lam}{Weight of the first entry of \eqn{w} in the likelihood function. Should be the same as used to generate \code{res}.}
  \item{conf.level}{Confidence level of confidence interval.}
  \item{maxiter}{Maximum number of iterations of differential evolution algorithm used in computation of confidence limits. Increase this number to get higher accuracy.}
  \item{z}{Variable to maximize over, corresponds to \eqn{\theta}.}  
  \item{res0}{Output from \code{\link{DearBeggMonotone}}, contains initial estimates.}  
  \item{vec}{Vector of parameters over which we maximize.}
  \item{theta}{Current \eqn{\theta}.}  
  \item{y}{Normally distributed effect sizes.}
  \item{u}{Associated standard errors.}
}
\value{
A list with the element
\item{\code{ci.theta}}{that contains the profile likelihood confidence interval for \eqn{\theta}.}}

\references{
Murphy, S. and van der Vaart, A. (2000).
On profile likelihood.
\emph{J. Amer. Statist. Assoc.}, \bold{95}, 449--485.

Rufibach, K. (2011).
Selection Models with Monotone Weight Functions in Meta-Analysis.
\emph{Biom. J.}, to appear.
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@gmail.com}, \cr \url{http://www.kasparrufibach.ch}
}
\note{Since we have to numerically find zeros of a suitable function, via \code{\link{uniroot}}, to get the limits and each iteration involves
computation of \eqn{w(\theta)} via a variant of \code{\link{DearBeggMonotone}}, computation of a confidence interval may take some time (typically seconds
to minutes).}
\seealso{The estimate under a monotone selection function can be computed using \cite{\link{DearBeggMonotone}}.}
\examples{
\dontrun{
## compute confidence interval for theta in the education dataset
data(education)
N  <- education$N
y  <- education$theta
u  <- sqrt(2 / N)
lam1 <- 2
res.edu <- DearBeggMonotone(y, u, lam = lam1, maxiter = 1000, 
    CR = 1, trace = FALSE)
r1 <- DearBeggMonotoneCItheta(res.edu, lam = 2, conf.level = 0.95)
res.edu$theta
r1$ci.theta

## compute confidence interval for theta in the passive smoking dataset
data(passive_smoking)
u <- passive_smoking$selnRR
y <- passive_smoking$lnRR
lam1 <- 2
res.toba <- DearBeggMonotone(y, u, lam = lam1, maxiter = 1000, 
    CR = 1, trace = FALSE)
r2 <- DearBeggMonotoneCItheta(res.toba, lam = 2, conf.level = 0.95)
res.toba$theta
r2$ci.theta
}
}
\keyword{nonparametric}

