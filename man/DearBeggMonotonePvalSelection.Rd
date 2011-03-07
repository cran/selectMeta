\name{DearBeggMonotonePvalSelection}
\alias{DearBeggMonotonePvalSelection}
\title{Compute simulation-based p-value to assess null hypothesis of no selection}
\description{This function computes a simulation-based \eqn{p}-value to assess the null hypothesis of no selection. For details we refer
to Rufibach (2011, Section 6).}
\usage{DearBeggMonotonePvalSelection(y, u, theta0, sigma0, lam = 2, M = 1000, 
    maxiter = 1000, test.stat = function(x){return(min(x))})}
\arguments{
  \item{y}{Normally distributed effect sizes.}
  \item{u}{Associated standard errors.}
  \item{theta0}{Initial estimate for \eqn{\theta}.}
  \item{sigma0}{Initial estimate for \eqn{\sigma}.}
  \item{lam}{Weight of the first entry of \eqn{w} in the likelihood function. Should be the same as used to generate \code{res}.}
  \item{M}{Number of runs to compute \eqn{p}-value.}
  \item{maxiter}{Maximum number of iterations of differential evolution algorithm. Increase this number to get higher accuracy.}
  \item{test.stat}{A function that takes as argument a vector and returns a number. Defines the test statistic to be used on the estimated
  selection function \eqn{w}.}
}
\value{
  \item{pval}{The computed \eqn{p}-value.}
  \item{res.mono}{The monotone estimates for each simulation run.}
  \item{mono0}{The monotone estimates for the original data.}
  \item{Ti}{The test statistics for each simulation run.}
  \item{T0}{The test statistic for the original data.}
  \item{ran.num}{Matrix that contains the generated \eqn{p}-values.}
}
\references{
Rufibach, K. (2011).
Selection Models with Monotone Weight Functions in Meta-Analysis.
\emph{Biom. J.}, to appear.
}
\author{Kaspar Rufibach (maintainer), \email{kaspar.rufibach@ifspm.uzh.ch}, \cr \url{http://www.biostat.uzh.ch/aboutus/people/rufibach.html}}
\seealso{This function is illustrated in the help file for \code{\link{DearBegg}}.}
\keyword{nonparametric}
