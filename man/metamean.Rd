% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metamean.R
\name{metamean}
\alias{metamean}
\title{Meta-analysis of single means}
\usage{
metamean(
  n,
  mean,
  sd,
  studlab,
  data = NULL,
  subset = NULL,
  exclude = NULL,
  median,
  q1,
  q3,
  min,
  max,
  method.mean = "Luo",
  method.sd = "Shi",
  approx.mean,
  approx.sd,
  sm = gs("smmean"),
  method.ci = gs("method.ci.cont"),
  level = gs("level"),
  level.ma = gs("level.ma"),
  fixed = gs("fixed"),
  random = gs("random") | !is.null(tau.preset),
  overall = fixed | random,
  overall.hetstat = fixed | random,
  hakn = gs("hakn"),
  adhoc.hakn = gs("adhoc.hakn"),
  method.tau = gs("method.tau"),
  method.tau.ci = gs("method.tau.ci"),
  tau.preset = NULL,
  TE.tau = NULL,
  tau.common = gs("tau.common"),
  prediction = gs("prediction"),
  level.predict = gs("level.predict"),
  null.effect = NA,
  method.bias = gs("method.bias"),
  backtransf = gs("backtransf"),
  text.fixed = gs("text.fixed"),
  text.random = gs("text.random"),
  text.predict = gs("text.predict"),
  text.w.fixed = gs("text.w.fixed"),
  text.w.random = gs("text.w.random"),
  title = gs("title"),
  complab = gs("complab"),
  outclab = "",
  subgroup,
  subgroup.name = NULL,
  print.subgroup.name = gs("print.subgroup.name"),
  sep.subgroup = gs("sep.subgroup"),
  test.subgroup = gs("test.subgroup"),
  prediction.subgroup = gs("prediction.subgroup"),
  byvar,
  keepdata = gs("keepdata"),
  warn = gs("warn"),
  warn.deprecated = gs("warn.deprecated"),
  control = NULL,
  ...
)
}
\arguments{
\item{n}{Number of observations.}

\item{mean}{Estimated mean.}

\item{sd}{Standard deviation.}

\item{studlab}{An optional vector with study labels.}

\item{data}{An optional data frame containing the study
information.}

\item{subset}{An optional vector specifying a subset of studies to
be used.}

\item{exclude}{An optional vector specifying studies to exclude
from meta-analysis, however, to include in printouts and forest
plots.}

\item{median}{Median (used to estimate the mean and standard
deviation).}

\item{q1}{First quartile (used to estimate the mean and standard
deviation).}

\item{q3}{Third quartile (used to estimate the mean and standard
deviation).}

\item{min}{Minimum (used to estimate the mean and standard
deviation).}

\item{max}{Maximum (used to estimate the mean and standard
deviation).}

\item{method.mean}{A character string indicating which method to
use to approximate the mean from the median and other statistics
(see Details).}

\item{method.sd}{A character string indicating which method to use
to approximate the standard deviation from sample size, median,
interquartile range and range (see Details).}

\item{approx.mean}{Approximation method to estimate means (see
Details).}

\item{approx.sd}{Approximation method to estimate standard
deviations (see Details).}

\item{sm}{A character string indicating which summary measure
(\code{"MRAW"} or \code{"MLN"}) is to be used for pooling of
studies.}

\item{method.ci}{A character string indicating which method is used
to calculate confidence intervals for individual studies, see
Details.}

\item{level}{The level used to calculate confidence intervals for
individual studies.}

\item{level.ma}{The level used to calculate confidence intervals
for meta-analysis estimates.}

\item{fixed}{A logical indicating whether a fixed effect / common
effect meta-analysis should be conducted.}

\item{random}{A logical indicating whether a random effects
meta-analysis should be conducted.}

\item{overall}{A logical indicating whether overall summaries
should be reported. This argument is useful in a meta-analysis
with subgroups if overall results should not be reported.}

\item{overall.hetstat}{A logical value indicating whether to print
heterogeneity measures for overall treatment comparisons. This
argument is useful in a meta-analysis with subgroups if
heterogeneity statistics should only be printed on subgroup
level.}

\item{hakn}{A logical indicating whether the method by Hartung and
Knapp should be used to adjust test statistics and confidence
intervals.}

\item{adhoc.hakn}{A character string indicating whether an \emph{ad
hoc} variance correction should be applied in the case of an
arbitrarily small Hartung-Knapp variance estimate, see Details.}

\item{method.tau}{A character string indicating which method is
used to estimate the between-study variance \eqn{\tau^2} and its
square root \eqn{\tau}. Either \code{"DL"}, \code{"PM"},
\code{"REML"}, \code{"ML"}, \code{"HS"}, \code{"SJ"},
\code{"HE"}, or \code{"EB"}, can be abbreviated.}

\item{method.tau.ci}{A character string indicating which method is
used to estimate the confidence interval of \eqn{\tau^2} and
\eqn{\tau}. Either \code{"QP"}, \code{"BJ"}, or \code{"J"}, or
\code{""}, can be abbreviated.}

\item{tau.preset}{Prespecified value for the square root of the
between-study variance \eqn{\tau^2}.}

\item{TE.tau}{Overall treatment effect used to estimate the
between-study variance tau-squared.}

\item{tau.common}{A logical indicating whether tau-squared should
be the same across subgroups.}

\item{prediction}{A logical indicating whether a prediction
interval should be printed.}

\item{level.predict}{The level used to calculate prediction
interval for a new study.}

\item{null.effect}{A numeric value specifying the effect under the
null hypothesis.}

\item{method.bias}{A character string indicating which test is to
be used. Either \code{"Begg"}, \code{"Egger"}, or
\code{"Thompson"}, can be abbreviated. See function
\code{\link{metabias}}.}

\item{backtransf}{A logical indicating whether results should be
back transformed in printouts and plots for \code{sm = "MLN"}. If
TRUE (default), results will be presented as means; otherwise
logarithm of means will be shown.}

\item{text.fixed}{A character string used in printouts and forest
plot to label the pooled fixed effect estimate.}

\item{text.random}{A character string used in printouts and forest
plot to label the pooled random effects estimate.}

\item{text.predict}{A character string used in printouts and forest
plot to label the prediction interval.}

\item{text.w.fixed}{A character string used to label weights of
fixed effect model.}

\item{text.w.random}{A character string used to label weights of
random effects model.}

\item{title}{Title of meta-analysis / systematic review.}

\item{complab}{Comparison label.}

\item{outclab}{Outcome label.}

\item{subgroup}{An optional vector to conduct a meta-analysis with
subgroups.}

\item{subgroup.name}{A character string with a name for the
subgroup variable.}

\item{print.subgroup.name}{A logical indicating whether the name of
the subgroup variable should be printed in front of the group
labels.}

\item{sep.subgroup}{A character string defining the separator
between name of subgroup variable and subgroup label.}

\item{test.subgroup}{A logical value indicating whether to print
results of test for subgroup differences.}

\item{prediction.subgroup}{A logical indicating whether prediction
intervals should be printed for subgroups.}

\item{byvar}{Deprecated argument (replaced by 'subgroup').}

\item{keepdata}{A logical indicating whether original data (set)
should be kept in meta object.}

\item{warn}{A logical indicating whether warnings should be printed
(e.g., if studies are excluded from meta-analysis due to zero
standard deviations).}

\item{warn.deprecated}{A logical indicating whether warnings should
be printed if deprecated arguments are used.}

\item{control}{An optional list to control the iterative process to
estimate the between-study variance \eqn{\tau^2}. This argument
is passed on to \code{\link[metafor]{rma.uni}}.}

\item{\dots}{Additional arguments (to catch deprecated arguments).}
}
\value{
An object of class \code{c("metamean", "meta")} with corresponding
\code{print}, \code{summary}, and \code{forest} functions. The
object is a list containing the following components:
\item{n, mean, sd,}{As defined above.}
\item{studlab, exclude, sm, method.ci,}{As defined above.}
\item{median, q1, q3, min, max,}{As defined above.}
\item{method.mean, method.sd,}{As defined above.}
\item{approx.mean, approx.sd,}{As defined above.}
\item{level, level.ma,}{As defined above.}
\item{fixed, random,}{As defined above.}
\item{overall, overall.hetstat,}{As defined above.}
\item{hakn, adhoc.hakn, method.tau, method.tau.ci,}{As defined above.}
\item{tau.preset, TE.tau, method.bias,}{As defined above.}
\item{tau.common, title, complab, outclab,}{As defined above.}
\item{subgroup, subgroup.name, print.subgroup.name, sep.subgroup, warn}{As defined
  above.}
\item{TE, seTE}{Estimated effect (mean or log mean) and standard
  error of individual studies.}
\item{lower, upper}{Lower and upper confidence interval limits for
  individual studies.}
\item{statistic, pval}{Statistic and p-value for test of treatment
  effect for individual studies.}
\item{w.fixed, w.random}{Weight of individual studies (in fixed and
  random effects model).}
\item{TE.fixed, seTE.fixed}{Estimated overall effect (mean or log
  mean) and standard error (fixed effect model).}
\item{lower.fixed, upper.fixed}{Lower and upper confidence interval
  limits (fixed effect model).}
\item{statistic.fixed, pval.fixed}{Statistic and p-value for test of
  overall treatment effect (fixed effect model).}
\item{TE.random, seTE.random}{Estimated overall effect (mean or log
  mean) and standard error (random effects model).}
\item{lower.random, upper.random}{Lower and upper confidence
  interval limits (random effects model).}
\item{statistic.random, pval.random}{Statistic and p-value for test
  of overall treatment effect (random effects model).}
\item{prediction, level.predict}{As defined above.}
\item{seTE.predict}{Standard error utilised for prediction
  interval.}
\item{lower.predict, upper.predict}{Lower and upper limits of
  prediction interval.}
\item{k}{Number of studies combined in meta-analysis.}
\item{Q}{Heterogeneity statistic.}
\item{tau2}{Between-study variance \eqn{\tau^2}.}
\item{se.tau2}{Standard error of \eqn{\tau^2}.}
\item{lower.tau2, upper.tau2}{Lower and upper limit of confidence
  interval for \eqn{\tau^2}.}
\item{tau}{Square-root of between-study variance \eqn{\tau}.}
\item{lower.tau, upper.tau}{Lower and upper limit of confidence
  interval for \eqn{\tau}.}
\item{H}{Heterogeneity statistic H.}
\item{lower.H, upper.H}{Lower and upper confidence limit for
 heterogeneity statistic H.}
\item{I2}{Heterogeneity statistic I\eqn{^2}.}
\item{lower.I2, upper.I2}{Lower and upper confidence limit for
  heterogeneity statistic I\eqn{^2}.}
\item{Rb}{Heterogeneity statistic R\eqn{_b}.}
\item{lower.Rb, upper.Rb}{Lower and upper confidence limit for
  heterogeneity statistic R\eqn{_b}.}
\item{method}{Pooling method: \code{"Inverse"}.}
\item{df.hakn}{Degrees of freedom for test of treatment effect for
  Hartung-Knapp method (only if \code{hakn = TRUE}).}
\item{bylevs}{Levels of grouping variable - if \code{subgroup} is not
  missing.}
\item{TE.fixed.w, seTE.fixed.w}{Estimated effect and standard error
  in subgroups (fixed effect model) - if \code{subgroup} is not
  missing.}
\item{lower.fixed.w, upper.fixed.w}{Lower and upper confidence
  interval limits in subgroups (fixed effect model) - if
  \code{subgroup} is not missing.}
\item{statistic.fixed.w, pval.fixed.w}{Statistics and p-values for
  test of treatment effect in subgroups (fixed effect model) - if
  \code{subgroup} is not missing.}
\item{TE.random.w, seTE.random.w}{Estimated effect and standard
  error in subgroups (random effects model) - if \code{subgroup} is
  not missing.}
\item{lower.random.w, upper.random.w}{Lower and upper confidence
  interval limits in subgroups (random effects model) - if
  \code{subgroup} is not missing.}
\item{statistic.random.w, pval.random.w}{Statistics and p-values
  for test of treatment effect in subgroups (random effects model)
  - if \code{subgroup} is not missing.}
\item{w.fixed.w, w.random.w}{Weight of subgroups (in fixed and
  random effects model) - if \code{subgroup} is not missing.}
\item{df.hakn.w}{Degrees of freedom for test of effect for
  Hartung-Knapp method in subgroups - if \code{subgroup} is not
  missing and \code{hakn = TRUE}.}
\item{n.e.w}{Number of observations in experimental group in
  subgroups - if \code{subgroup} is not missing.}
\item{n.c.w}{Number of observations in control group in subgroups -
  if \code{subgroup} is not missing.}
\item{k.w}{Number of studies combined within subgroups - if
  \code{subgroup} is not missing.}
\item{k.all.w}{Number of all studies in subgroups - if \code{subgroup}
  is not missing.}
\item{Q.w.fixed}{Overall within subgroups heterogeneity statistic Q
  (based on fixed effect model) - if \code{subgroup} is not missing.}
\item{Q.w.random}{Overall within subgroups heterogeneity statistic
  Q (based on random effects model) - if \code{subgroup} is not
  missing (only calculated if argument \code{tau.common} is TRUE).}
\item{df.Q.w}{Degrees of freedom for test of overall within
  subgroups heterogeneity - if \code{subgroup} is not missing.}
\item{pval.Q.w.fixed}{P-value of within subgroups heterogeneity
  statistic Q (based on fixed effect model) - if \code{subgroup} is
  not missing.}
\item{pval.Q.w.random}{P-value of within subgroups heterogeneity
  statistic Q (based on random effects model) - if \code{subgroup} is
  not missing.}
\item{Q.b.fixed}{Overall between subgroups heterogeneity statistic
  Q (based on fixed effect model) - if \code{subgroup} is not
  missing.}
\item{Q.b.random}{Overall between subgroups heterogeneity statistic
  Q (based on random effects model) - if \code{subgroup} is not
  missing.}
\item{df.Q.b}{Degrees of freedom for test of overall between
  subgroups heterogeneity - if \code{subgroup} is not missing.}
\item{pval.Q.b.fixed}{P-value of between subgroups heterogeneity
  statistic Q (based on fixed effect model) - if \code{subgroup} is
  not missing.}
\item{pval.Q.b.random}{P-value of between subgroups heterogeneity
  statistic Q (based on random effects model) - if \code{subgroup} is
  not missing.}
\item{tau.w}{Square-root of between-study variance within subgroups
  - if \code{subgroup} is not missing.}
\item{H.w}{Heterogeneity statistic H within subgroups - if
  \code{subgroup} is not missing.}
\item{lower.H.w, upper.H.w}{Lower and upper confidence limit for
  heterogeneity statistic H within subgroups - if \code{subgroup} is
  not missing.}
\item{I2.w}{Heterogeneity statistic I\eqn{^2} within subgroups - if
  \code{subgroup} is not missing.}
\item{lower.I2.w, upper.I2.w}{Lower and upper confidence limit for
  heterogeneity statistic I\eqn{^2} within subgroups - if \code{subgroup} is
  not missing.}
\item{keepdata}{As defined above.}
\item{data}{Original data (set) used in function call (if
  \code{keepdata = TRUE}).}
\item{subset}{Information on subset of original data used in
  meta-analysis (if \code{keepdata = TRUE}).}
\item{call}{Function call.}
\item{version}{Version of R package \bold{meta} used to create
  object.}
}
\description{
Calculation of an overall mean from studies reporting a single mean
using the inverse variance method for pooling; inverse variance
weighting is used for pooling.
}
\details{
Fixed effect and random effects meta-analysis of single means to
calculate an overall mean; inverse variance weighting is used for
pooling. The following transformations of means are implemented to
calculate an overall mean:
\itemize{
\item Raw, i.e. untransformed, means (\code{sm = "MRAW"}, default)
\item Log transformed means (\code{sm = "MLN"})
}

Note, you should use R function \code{\link{metacont}} to compare
means of pairwise comparisons instead of using \code{metamean} for
each treatment arm separately which will break randomisation in
randomised controlled trials.

Calculations are conducted on the log scale if \code{sm =
"ROM"}. Accordingly, list elements \code{TE}, \code{TE.fixed}, and
\code{TE.random} contain the logarithm of means. In printouts and
plots these values are back transformed if argument
\code{backtransf = TRUE}.

Default settings are utilised for several arguments (assignments
using \code{\link{gs}} function). These defaults can be changed for
the current R session using the \code{\link{settings.meta}}
function.

Furthermore, R function \code{\link{update.meta}} can be used to
rerun a meta-analysis with different settings.

\subsection{Approximate means from sample sizes, medians and other statistics}{

Missing means can be derived from
\enumerate{
\item sample size, median, interquartile range and range (arguments
  \code{n}, \code{median}, \code{q1}, \code{q3}, \code{min}, and
  \code{max}),
\item sample size, median and interquartile range (arguments
  \code{n}, \code{median}, \code{q1}, and \code{q3}), or
\item sample size, median and range (arguments \code{n},
  \code{median}, \code{min}, and \code{max}).
}

By default, methods described in Luo et al. (2018) are utilized
(argument \code{method.mean = "Luo"}):
\itemize{
\item equation (15) if sample size, median, interquartile range and 
  range are available,
\item equation (11) if sample size, median and interquartile range
  are available,
\item equation (7) if sample size, median and range are available.
}

Instead the methods described in Wan et al. (2014) are used if
argument \code{method.mean = "Wan"}):
\itemize{
\item equation (10) if sample size, median, interquartile range and 
  range are available,
\item equation (14) if sample size, median and interquartile range
  are available,
\item equation (2) if sample size, median and range are available.
}

By default, missing means are replaced successively using
interquartile ranges and ranges (if available), interquartile
ranges (if available) and finally ranges. Argument
\code{approx.mean} can be used to overwrite this behaviour for each
individual study and treatment arm:
\itemize{
\item use means directly (entry \code{""} in argument
  \code{approx.mean});
\item median, interquartile range and range (\code{"iqr.range"});
\item median and interquartile range (\code{"iqr"});
\item median and range (\code{"range"}).
}
}

\subsection{Approximate standard deviations from sample sizes, medians and other statistics}{

Missing standard deviations can be derived from
\enumerate{
\item sample size, median, interquartile range and range (arguments
  \code{n}, \code{median}, \code{q1}, \code{q3}, \code{min}, and
  \code{max}),
\item sample size, median and interquartile range (arguments
  \code{n}, \code{median}, \code{q1} and \code{q3}), or
\item sample size, median and range (arguments \code{n},
  \code{median}, \code{min} and \code{max}).
}

Wan et al. (2014) describe methods to estimate the standard
deviation from the sample size, median and additional
statistics. Shi et al. (2020) provide an improved estimate of the
standard deviation if the interquartile range and range are
available in addition to the sample size and median. Accordingly,
equation (11) in Shi et al. (2020) is the default (argument
\code{method.sd = "Shi"}), if the median, interquartile range and
range are provided. The method by Wan et al. (2014) is used if
argument \code{method.sd = "Wan"} and, depending on the sample
size, either equation (12) or (13) is used. If only the
interquartile range or range is available, equations (15) / (16)
and (7) / (9) in Wan et al. (2014) are used, respectively.

By default, missing standard deviations are replaced successively
using these method, i.e., interquartile ranges and ranges are used
before interquartile ranges before ranges. Argument
\code{approx.sd} can be used to overwrite this default for each
individual study and treatment arms:
\itemize{
\item sample size, median, interquartile range and range
  (\code{"iqr.range"});
\item sample size, median and interquartile range (\code{"iqr"});
\item sample size, median and range (\code{"range"}).
}
}

\subsection{Confidence intervals for individual studies}{

For untransformed means (argument \code{sm = "MRAW"}), the
confidence interval for individual studies can be based on the
\itemize{
\item standard normal distribution (\code{method.ci = "z"}, default), or
\item t-distribution (\code{method.ci = "t"}).
}
}

\subsection{Estimation of between-study variance}{

The following methods to estimate the between-study variance
\eqn{\tau^2} are available:
\itemize{
\item DerSimonian-Laird estimator (\code{method.tau = "DL"})
\item Paule-Mandel estimator (\code{method.tau = "PM"})
\item Restricted maximum-likelihood estimator (\code{method.tau =
  "REML"})
\item Maximum-likelihood estimator (\code{method.tau = "ML"})
\item Hunter-Schmidt estimator (\code{method.tau = "HS"})
\item Sidik-Jonkman estimator (\code{method.tau = "SJ"})
\item Hedges estimator (\code{method.tau = "HE"})
\item Empirical Bayes estimator (\code{method.tau = "EB"})
}
See \code{\link{metagen}} for more information on these
estimators.
}

\subsection{Confidence interval for the between-study variance}{

The following methods to calculate a confidence interval for
\eqn{\tau^2} and \eqn{\tau} are available.
\tabular{ll}{
\bold{Argument}\tab \bold{Method} \cr 
\code{method.tau.ci = "J"}\tab Method by Jackson \cr
\code{method.tau.ci = "BJ"}\tab Method by Biggerstaff and Jackson \cr
\code{method.tau.ci = "QP"}\tab Q-Profile method
}
See \code{\link{metagen}} for more information on these methods. No
confidence intervals for \eqn{\tau^2} and \eqn{\tau} are calculated
if \code{method.tau.ci = ""}.
}

\subsection{Hartung-Knapp method}{

Hartung and Knapp (2001) proposed an alternative method for random
effects meta-analysis based on a refined variance estimator for the
treatment estimate. Simulation studies (Hartung and Knapp, 2001;
IntHout et al., 2014; Langan et al., 2019) show improved coverage
probabilities compared to the classic random effects
method.

In rare settings with very homogeneous treatment estimates, the
Hartung-Knapp variance estimate can be arbitrarily small resulting
in a very narrow confidence interval (Knapp and Hartung, 2003;
Wiksten et al., 2016). In such cases, an
\emph{ad hoc} variance correction has been proposed by utilising
the variance estimate from the classic random effects model with
the HK method (Knapp and Hartung, 2003; IQWiQ, 2020). An
alternative approach is to use the wider confidence interval of
classic fixed or random effects meta-analysis and the HK method
(Wiksten et al., 2016; Jackson et al., 2017).

Argument \code{adhoc.hakn} can be used to choose the \emph{ad hoc}
method:
\tabular{ll}{
\bold{Argument}\tab \bold{\emph{Ad hoc} method} \cr
\code{adhoc.hakn = ""}\tab not used \cr
\code{adhoc.hakn = "se"}\tab use variance correction if HK standard
 error is smaller \cr
 \tab than standard error from classic random effects
 \cr
 \tab meta-analysis (Knapp and Hartung, 2003) \cr
\code{adhoc.hakn = "iqwig6"}\tab use variance correction if HK
 confidence interval \cr
 \tab is narrower than CI from classic random effects model \cr
 \tab with DerSimonian-Laird estimator (IQWiG, 2020) \cr
\code{adhoc.hakn = "ci"}\tab use wider confidence interval of
 classic random effects \cr
 \tab and HK meta-analysis \cr
 \tab (Hybrid method 2 in Jackson et al., 2017)
}
}

\subsection{Prediction interval}{

A prediction interval for the proportion in a new study (Higgins et
al., 2009) is calculated if arguments \code{prediction} and
\code{random} are \code{TRUE}. Note, the definition of
prediction intervals varies in the literature. This function
implements equation (12) of Higgins et al., (2009) which proposed a
\emph{t} distribution with \emph{K-2} degrees of freedom where
\emph{K} corresponds to the number of studies in the meta-analysis.
}

\subsection{Subgroup analysis}{

Argument \code{subgroup} can be used to conduct subgroup analysis for
a categorical covariate. The \code{\link{metareg}} function can be
used instead for more than one categorical covariate or continuous
covariates.
}

\subsection{Exclusion of studies from meta-analysis}{

Arguments \code{subset} and \code{exclude} can be used to exclude
studies from the meta-analysis. Studies are removed completely from
the meta-analysis using argument \code{subset}, while excluded
studies are shown in printouts and forest plots using argument
\code{exclude} (see Examples in \code{\link{metagen}}).
Meta-analysis results are the same for both arguments.
}

\subsection{Presentation of meta-analysis results}{

Internally, both fixed effect and random effects models are
calculated regardless of values choosen for arguments
\code{fixed} and \code{random}. Accordingly, the estimate
for the random effects model can be extracted from component
\code{TE.random} of an object of class \code{"meta"} even if
argument \code{random = FALSE}. However, all functions in R
package \bold{meta} will adequately consider the values for
\code{fixed} and \code{random}. E.g. functions
\code{\link{print.meta}} and \code{\link{forest.meta}} will not
print results for the random effects model if \code{random =
FALSE}.
}
}
\note{
The function \code{\link{metagen}} is called internally to
calculate individual and overall treatment estimates and standard
errors.
}
\examples{
m1 <- metamean(rep(100, 3), 1:3, rep(1, 3))
m1

m2 <- update(m1, sm = "MLN")
m2

# With test for overall mean equal to 2
#
update(m1, null.effect = 2)
update(m2, null.effect = 2)

# Print results without back-transformation
#
update(m1, backtransf = FALSE)
update(m2, backtransf = FALSE)
update(m1, null.effect = 2, backtransf = FALSE)
update(m2, null.effect = 2, backtransf = FALSE)

}
\references{
DerSimonian R & Laird N (1986):
Meta-analysis in clinical trials.
\emph{Controlled Clinical Trials},
\bold{7}, 177--88

Hartung J & Knapp G (2001):
On tests of the overall treatment effect in meta-analysis with
normally distributed responses.
\emph{Statistics in Medicine},
\bold{20}, 1771--82

Higgins JPT, Thompson SG, Spiegelhalter DJ (2009):
A re-evaluation of random-effects meta-analysis.
\emph{Journal of the Royal Statistical Society: Series A},
\bold{172}, 137--59

IntHout J, Ioannidis JPA, Borm GF (2014):
The Hartung-Knapp-Sidik-Jonkman method for random effects
meta-analysis is straightforward and considerably outperforms the
standard DerSimonian-Laird method.
\emph{BMC Medical Research Methodology},
\bold{14}, 25

IQWiG (2020):
General Methods: Version 6.0.
\url{https://www.iqwig.de/en/about-us/methods/methods-paper/}

Jackson D, Law M, Rücker G, Schwarzer G (2017): 
The Hartung-Knapp modification for random-effects meta-analysis: A
useful refinement but are there any residual concerns?
\emph{Statistics in Medicine},
\bold{36}, 3923--34

Langan D, Higgins JPT, Jackson D, Bowden J, Veroniki AA,
Kontopantelis E, et al. (2019):
A comparison of heterogeneity variance estimators in simulated
random-effects meta-analyses.
\emph{Research Synthesis Methods},
\bold{10}, 83--98

Viechtbauer W (2010):
Conducting Meta-Analyses in R with the Metafor Package.
\emph{Journal of Statistical Software},
\bold{36}, 1--48

Wiksten A, Rücker G, Schwarzer G (2016):
Hartung-Knapp method is not always conservative compared with
fixed-effect meta-analysis.
\emph{Statistics in Medicine},
\bold{35}, 2503--15
}
\seealso{
\code{\link{update.meta}}, \code{\link{metamean}},
  \code{\link{metagen}}
}
\author{
Guido Schwarzer \email{sc@imbi.uni-freiburg.de}
}
