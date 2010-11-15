\name{education}
\alias{education}
\docType{data}
\title{Dataset open vs. traditional education on creativity}
\description{Dataset of studies of effect of open vs. traditional education on creativity. Standard dataset to illustrate selection models in meta-analysis.}
\usage{data(education)}
\format{
  A data frame with 10 observations on the following 5 variables.
  \describe{
    \item{\code{i}}{Study number.}
    \item{\code{N}}{Sample size of study.}
    \item{\code{theta}}{Estimated effect size.}
    \item{\code{t}}{\eqn{t} test statistic, \eqn{t = \theta / \sqrt{2 / N}}.}
    \item{\code{q}}{Defrees of freedom, \eqn{q = 2 N - 2}.}
  }
}
\references{
Dear, Keith B.G. and Begg, Colin B. (1992).
An Approach for Assessing Publication Bias Prior to Performing a Meta-Analysis.
\emph{Statist. Sci.}, \bold{7(2)}, 237--245.

Hedges, L. and Olkin, I. (1985).
Statistical Methods for Meta-Analysis. 
Academic, Orlando, Florida.

Iyengar, S. and Greenhouse, J.B. (1988).
Selection models and the file drawer problem (including rejoinder).
\emph{Statist. Sci.}, \bold{3}, 109--135.
}
\seealso{This dataset is analyzed in the help file for \code{\link{DearBegg}}.}
\keyword{datasets}
