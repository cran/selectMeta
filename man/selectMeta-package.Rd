\name{selectMeta-package}
\alias{selectMeta-package}
\alias{selectMeta}
\docType{package}
\title{Estimation of weight functions in meta analysis}
\description{
Publication bias, the fact that studies identified for inclusion in a meta analysis do not represent
all studies on the topic of interest, is commonly recognized as a threat to the validity of the results
of a meta analysis. One way to explicitly model publication bias is via selection models or weighted
probability distributions. For details we refer to Iyengar & Greenhouse (1998), Dear & Begg (1992), 
and Rufibach (2011). In this package we provide implementations of all the weight functions proposed in these
papers. The novelty in Rufibach (2011) is the proposal of a non-increasing variant of the nonparametric weight
function of Dear & Begg (1992). Since virtually all parametric weight functions proposed so far in the literature 
are in fact decreasing and only few studies are included in a typical meta analysis regularization by imposing
monotonicity seems a sensible approach. The new approach potentially offers more insight
in the selection process than other methods, but is more flexible than parametric approaches.
To maximize the log-likelihood function proposed by Dear & Begg (1992) under a monotonicity constraint on \eqn{w}
we use a differential evolution algorithm proposed by Ardia et al (2010a, b) and implemented in Mullen et al (2009).

The main functions in this package are \code{\link{IyenGreen}} and \code{\link{DearBegg}}. 
Using \code{\link{DearBeggMonotoneCItheta}} one can compute a profile likelihood confidence interval for the overall effect size \eqn{\theta}. 
In addition, we provide two datasets: 
\code{\link{education}}, a dataset frequently used in illustration of meta analysis and \code{\link{passive_smoking}}, a second dataset
that has caused some controversy about whether publication bias is present in this dataset or not.
}

\details{
\tabular{ll}{
Package: \tab selectMeta\cr
Type: \tab Package\cr
Version: \tab 1.0.2\cr
Date: \tab 2011-02-18\cr
License: \tab GPL (>=2) \cr
}
}
\author{
Kaspar Rufibach (maintainer), \email{kaspar.rufibach@ifspm.uzh.ch}, \cr \url{http://www.biostat.uzh.ch/aboutus/people/rufibach.html}
}
\references{
Ardia, D., Boudt, K., Carl, P., Mullen, K.M., Peterson, B.G. (2010).
Differential Evolution ('DEoptim') for Non-Convex Portfolio Optimization. 

Ardia, D., Mullen, K.M., et.al. (2010). The 'DEoptim' Package:
Differential Evolution Optimization in 'R'. Version 2.0-7.

Dear, K.B.G. and Begg, C.B. (1992).
An Approach for Assessing Publication Bias Prior to Performing a Meta-Analysis.
\emph{Statist. Sci.}, \bold{7(2)}, 237--245.

Hedges, L. and Olkin, I. (1985).
Statistical Methods for Meta-Analysis. 
Academic, Orlando, Florida.

Iyengar, S. and Greenhouse, J.B. (1988).
Selection models and the file drawer problem.
\emph{Statist. Sci.}, \bold{3}, 109--135.

Mullen, K.M., Ardia, D., Gil, D.L., Windover, D., Cline, J. (2009).
'DEoptim': An 'R' Package for Global Optimization by Differential Evolution. 

Rufibach, K. (2011).
Selection Models with Monotone Weight Functions in Meta-Analysis.
Preprint.
}
\examples{
# All functions in this package are illustrated 
# in the help file for the function DearBegg().
}
\keyword{distribution}
\keyword{htest}
\keyword{nonparametric}

