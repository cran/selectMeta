\name{DearBegg}
\alias{DearBegg}
\alias{DearBeggMonotone}
\alias{DearBeggLoglik}
\alias{DearBeggToMinimize}
\alias{Hij}
\title{Compute the nonparametric weight function from Dear and Begg (1992)}
\description{In Dear and Begg (1992) it was proposed to nonparametrically estimate via maximum likelihood the weight function \eqn{w} in a selection model via
pooling \eqn{p}-values in groups of 2 and assuming a piecewise constant \eqn{w}. The function \code{\link{DearBegg}} implements estimation of \eqn{w} via 
a coordinate-wise Newton-Raphson algorithm as described in Dear and Begg (1992). In addition, the function \code{\link{DearBeggMonotone}} enables computation of the 
weight function in the same model under the constraint that it is non-increasing, see Rufibach (2011). To this end we use the differential evolution algorithm
described in Ardia et al (2010a, b) and implemented in Mullen et al (2009).
The functions \code{\link{Hij}}, \code{\link{DearBeggLoglik}}, and \code{\link{DearBeggToMinimize}} are not intended to be called by the user.}
\usage{
DearBegg(y, u, lam = 2, tolerance = 10^-10, maxiter = 1000, 
    trace = TRUE)
DearBeggMonotone(y, u, lam = 2, maxiter = 1000, CR = 0.9, 
    NP = NA, trace = TRUE)
Hij(theta, sigma, y, u, teststat)
DearBeggLoglik(w, theta, sigma, y, u, hij, lam)
DearBeggToMinimize(vec, y, u, lam)
}
\arguments{
  \item{y}{Normally distributed effect sizes.}
  \item{u}{Associated standard errors.}
  \item{lam}{Weight of the first entry of \eqn{w} in the likelihood function. Dear and Begg (1992) recommend to use \code{lam = 2}.}
  \item{tolerance}{Stopping criterion for Newton-Raphson.}
  \item{maxiter}{Maximal number of iterations for Newton-Raphson.}
  \item{trace}{If \code{TRUE}, progress of the algorithm is shown.}
  \item{CR}{Parameter that is given to \code{DEoptim}. See the help file of the function \code{DEoptim.control} for details.}
  \item{NP}{Parameter that is given to \code{DEoptim}. See the help file of the function \code{DEoptim.control} for details.}
  \item{w}{Weight function, parametrized as vector of length \eqn{1 + \lfloor(n / 2)\rfloor} where \eqn{n} is the number of studies, i.e. the length of \eqn{y}.}
  \item{theta}{Effect size estimate.}
  \item{sigma}{Random effects variance component.}
  \item{hij}{Integral of density over a constant piece of \eqn{w}. See Rufibach (2011, Appendix) for details.}
  \item{vec}{Vector of parameters over which we maximize.}
  \item{teststat}{Vector of test statistics, equals \eqn{|y| / u}.}
  }
\value{A list consisting of the following elements:
\item{\code{w}}{Vector of estimated weights.}
\item{\code{theta}}{Estimate of the combined effect in the Dear and Begg model.}
\item{\code{sigma}}{Estimate of the random effects component variance.}
\item{p}{\eqn{p}-values computed from the inputed test statistics, ordered in decreasing order.}
\item{y}{Effect sizes, ordered in decreasing order of \eqn{p}-values.}
\item{u}{Standard errors, ordered in decreasing order of \eqn{p}-values.}
\item{loglik}{Value of the log-likelihood at the maximum.}
\item{DEoptim.res}{Only available in \code{\link{DearBeggMonotone}}. Provides the object that is outputted by \code{\link{DEoptim}}.}
}
\references{
Ardia, D., Boudt, K., Carl, P., Mullen, K.M., Peterson, B.G. (2010).
Differential Evolution ('DEoptim') for Non-Convex Portfolio Optimization. 

Ardia, D., Mullen, K.M., et.al. (2010). The 'DEoptim' Package:
Differential Evolution Optimization in 'R'. Version 2.0-7.

Dear, K.B.G. and Begg, C.B. (1992).
An Approach for Assessing Publication Bias Prior to Performing a Meta-Analysis.
\emph{Statist. Sci.}, \bold{7(2)}, 237--245.

Mullen, K.M., Ardia, D., Gil, D.L., Windover, D., Cline, J. (2009).
'DEoptim': An 'R' Package for Global Optimization by Differential Evolution. 

Rufibach, K. (2011).
Selection Models with Monotone Weight Functions in Meta-Analysis.
Preprint.
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@ifspm.uzh.ch}, \cr \url{http://www.biostat.uzh.ch/aboutus/people/rufibach.html}
}
\seealso{\code{\link{IyenGreen}} for a parametric selection model.}
\examples{
\dontrun{
##------------------------------------------
## Analysis of Hedges & Olkin dataset
## re-analyzed in Iyengar & Greenhouse, Dear & Begg
##------------------------------------------
data(education)
t  <- education$t
q  <- education$q
N  <- education$N
y  <- education$theta 
u  <- sqrt(2 / N)
n  <- length(y)
k  <- 1 + floor(n / 2)
lam1 <- 2

## compute p-values
p <- 2 * pnorm(-abs(t))


##------------------------------------------
## compute all weight functions available
## in this package
##------------------------------------------

## weight functions from Iyengar & Greenhouse (1988)
res1 <- IyenGreenMLE(t, q, N, type = 1)
res2 <- IyenGreenMLE(t, q, N, type = 2)

## weight function from Dear & Begg (1992)
res3 <- DearBegg(y, u, lam = lam1)

## monotone version of Dear & Begg, as introduced in Rufibach (2011)
set.seed(1977)
res4 <- DearBeggMonotone(y, u, lam = lam1, maxiter = 1000, CR = 1)

## plot
plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "p-values", 
    ylab = "estimated weight function")
ps <- seq(0, 1, by = 0.01)
rug(p, lwd = 3)
lines(ps, IyenGreenWeight(-qnorm(ps / 2), b = res1$beta, q = 50, 
    type = 1, alpha = 0.05), lwd = 3, col = 2)
lines(ps, IyenGreenWeight(-qnorm(ps / 2), b = res2$beta, q = 50, 
    type = 2, alpha = 0.05), lwd = 3, col = 4)
weightLine(p, w = res3$w, col0 = 3, lwd0 = 3, lty0 = 2)  
weightLine(p, w = res4$w, col0 = 6, lwd0 = 2, lty0 = 1)  

legend("topright", c(expression("Iyengar & Greenhouse (1988) w"[1]), 
    expression("Iyengar & Greenhouse (1988) w"[2]), "Dear and Begg (1992)", 
    "Rufibach (2011)"), col = c(2, 4, 3, 6), lty = c(1, 1, 2, 1), 
    lwd = c(3, 3, 3, 2), bty = "n")

## compute selection bias
eta <- sqrt(res4$sigma ^ 2 + res4$u ^ 2)
bias <- effectBias(res4$y, res4$u, res4$w, res4$theta, eta)
bias


##------------------------------------------
## Analysis second-hand tobacco smoke dataset
## Rothstein et al (2005), Publication Bias in Meta-Analysis, Appendix A
##------------------------------------------
data(passive_smoking)
u <- passive_smoking$selnRR
y <- passive_smoking$lnRR
n <- length(y)
k <- 1 + floor(n / 2)
lam1 <- 2

res2 <- DearBegg(y, u, lam = lam1)
set.seed(1)
res3 <- DearBeggMonotone(y = y, u = u, lam = lam1, maxiter = 2000, CR = 1)

plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), pch = 19, col = 1, 
    xlab = "p-values", ylab = "estimated weight function")
weightLine(rev(sort(res2$p)), w = res2$w, col0 = 2, lwd0 = 3, lty0 = 2)  
weightLine(rev(sort(res3$p)), w = res3$w, col0 = 4, lwd0 = 2, lty0 = 1)  

legend("bottomright", c("Dear and Begg (1992)", "Rufibach (2011)"), col = 
    c(2, 4), lty = c(2, 1), lwd = c(3, 2), bty = "n")
    
## compute selection bias
eta <- sqrt(res3$sigma ^ 2 + res3$u ^ 2)
bias <- effectBias(res3$y, res3$u, res3$w, res3$theta, eta)
bias  
}
}
\keyword{nonparametric}
