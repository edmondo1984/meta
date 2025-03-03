## meta, version 5.3-0 (2022-mm-dd)

### Major changes

* Exact Poisson confidence limits can be calculated for individual
  studies in meta-analysis of single rates

### Bug fixes

* Use correct standard error for Cox and Snell's method in smd2or()
  and or2smd()

### User-visible changes

* New function subset.longarm() to select subset of a longarm object

* New argument 'method.ci' in function metarate()

* New argument 'method.ci.rate' in function settings.meta()

* print.summary.meta():
  - for a single study and metabin() with method = "MH", sm = "RR" and
    RR.Cochrane = FALSE, print results using a continuity correction
    for sample sizes of 1x incr (individual study) and 2x incr
    (meta-analysis of single study)

### Internal changes

* forest.meta():
  - use meta:::formatN() instead of format() for formatting
  - print study label "1" instead of "" for a single study

* metarate():
  - list elements 'lower' and 'upper' contain untransformed confidence
    limits for individual studies


## meta, version 5.2-0 (2022-02-04)

### Major changes

* Forest plot for meta-analysis with subgroups:
  - more flexible printing of subgroup results
  - by default, do not show subgroup results (pooled estimates and
    information on heterogeneity) for subgroups consisting of a single
    study

* Prediction intervals in subgroups can be shown independently of
  prediction interval for overall meta-analysis in printouts and
  forest plots

* Bubble plot shows relative treatment effects on original scale
  instead of log scale and reference line is shown

* Trim and fill, limit meta-analysis and Copas selection model objects
  can be used in function metabind()

* New function longarm() to transform data from pairwise comparisons
  to long arm-based format

* New auxiliary function labels.meta() to create study labels for
  forest plots in JAMA or Lancet layout

* Printing of spaces in confidence intervals can be suppressed

* Help page of forest.meta() updated

### Bug fixes

* Use correct standard error to calculate prediction interval if
  Hartung-Knapp method was used

* In forest plots, show correct degrees of freedom for test of effect
  in subgroups for Hartung-Knapp method

* In update.meta(), consider input for arguments 'pscale', 'irscale'
  and 'irunit' for meta-analysis objects created with metagen()

### User-visible changes

* forest.meta():
  - new argument 'subgroup.hetstat'
  - arguments 'subgroup', 'subgroup.hetstat', 'prediction.subgroup',
    'test.effect.subgroup', 'test.effect.subgroup.fixed' and
    'test.effect.subgroup.random' can be a logical vector of same
    length as number of subgroups
  - arguments 'lab.e', 'lab.c', 'lab.e.attach.to.col' and
    'lab.c.attach.to.col' renamed to 'label.e', 'label.c',
    'label.e.attach' and 'label.c.attach'

* forest.meta(), metabin(), metacont(), metacor(), metacr(),
  metagen(), metainc(), metamean(), metaprop(), metarate(),
  print.meta(), update.meta():
  - new argument 'prediction.subgroup'

* metamerge():
  - first argument can be of class 'limitmeta' or 'copas'

* bubble.metareg():
  - new argument 'backtransf' to (not) back transform relative
    treatment effects on y-axis
  - new arguments 'ref', 'col.ref', 'lty.ref' and 'lwd.ref' for
    reference line

* settings.meta():
  - arguments 'print', 'reset' and 'setting' can be used like any
    other setting; for example, it is possible to fully reset the
    settings and switch to the RevMan 5 settings
  - R commands 'settings.meta("print")' and 'settings.meta()' produce
    the same printout
  - new global setting 'prediction.subgroup' for prediction intervals
    in subgroups
  - new global settings 'CIlower.blank' and 'CIupper.blank'

* cilayout():
  - new arguments 'lower.blank' and 'upper.blank' to suppress printing
    of spaces in confidence intervals
  - additional checks for length of arguments

### Internal changes

* metagen():
  - new list elements 'seTE.hakn' and 'seTE.hakn.adhoc' (with standard
    error for Hartung-Knapp method) and 'seTE.classic' for classic
    random effects inverse variance method

* forest.meta():
  - new code to assign missing column labels

* Internal function formatCI() considers values for 'lower.blank' and
  'upper.blank' in cilayout()

* New internal function catch() to catch value for an argument


## meta, version 5.1-1 (2021-12-02)

### Major changes

* For meta-analysis of single proportions,
  - export p-value of exact binomial test for individual studies if
    Clopper-Pearson method (method.ci = "CP") is used to calculate
    confidence intervals for individual studies
  - do not export p-value for individual studies if argument
    'method.ci' is not equal to "CP" or "NAsm" (normal approximation
    based on summary measure)

### Bug fixes

* Meta-analysis of continuous outcomes using Hedges' g or Cohen's d as
  summary measure resulted in [inestimable SMDs in individual
  studies](https://github.com/guido-s/meta/issues/42) if the total
  sample size was larger than 343 and argument 'exact.smd' was TRUE
  (default)

* Forest plot creation for meta-analysis of single means with
  subgroups resulted in an
  [error](https://github.com/guido-s/meta/issues/41)

### Internal changes

* New internal function ciClopperPearson() to calculate confidence
  limits and p-value for exact binomial method

* Exported list elements changed for internal functions
  ciAgrestiCoull(), ciSimpleAsymptotic() and ciWilsonScore()


## meta, version 5.1-0 (2021-11-17)

### Major changes

* By default, use exact formulae in estimation of the standardised
  mean difference (Hedges' g, Cohen's d) and its standard error
  [(White & Thomas, 2005)](https://doi.org/10.1191/1740774505cn081oa)

### Bug fixes

* Use of metagen() with argument 'id' (three-level model) does not
  result in an error if all estimates come from a single study

### Internal changes

* Fix errors due to extended checks of arguments equal to NULL in R
  package **metafor**, version 3.1 or above


## meta, version 5.0-1 (2021-10-20)

### Major changes

* For backward compatibility, use Q statistic based on Mantel-Haenszel
  estimate (argument 'Q.Cochrane') by default to calculate
  DerSimonian-Laird estimator of the between-study variance

### Bug fixes

* For small sample sizes, use correct entry from Table 2 in [Wan et.
  (2014)](https://doi.org/10.1186/1471-2288-14-135) to approximate
  standard deviation from median and related statistics


## meta, version 5.0-0 (2021-10-11)

### Major changes

* Behaviour of print.meta() and print.summary.meta() switched (to be
  in line with other print and summary functions in R)

* New default settings:
  - Restricted maximum likelihood (REML) instead of DerSimonian-Laird
    estimator used as default to estimate between-study heterogeneity
	(argument 'method.tau')
  - Do not use Q statistic based on Mantel-Haenszel estimate to
    calculate DerSimonian-Laird estimator of the between-study
    variance (argument 'Q.Cochrane')
  - Print 'Common effect model' instead of 'Fixed effect model'

* Default settings of **meta**, version 4 or lower, can be used with
  command *settings.meta("meta4")* - this does not change the new
  behaviour of print.meta() and print.summary.meta()

* Renamed arguments:
  - 'fixed' (instead of 'comb.fixed')
  - 'random' (instead of 'comb.random')
  - 'level.ma' (instead of 'level.comb')
  - 'subgroup' (instead of 'byvar')
  - 'subgroup.name' (instead of 'bylab')
  - 'print.subgroup.name' (instead of 'print.byvar')
  - 'sep.subgroup' (instead of 'byseparator')
  - 'nchar.subgroup' (instead of 'bylab.nchar')

### Internal changes

* Function gs() can be used to access internal settings

* Aggregate internal auxiliary functions in files meta-aux.R to
  meta-xlab.R


## meta, version 4.19-2 (2021-09-29)

### Bug fixes

* Forest plots of meta-analyses assuming a common between-study
  heterogeneity variance in subgroups resulted in an error
  (bug was introduced in **meta**, version 4.16-0)

* For GLMMs, export Wald-type Q statistic for residual heterogeneity
  instead of missing value


## meta, version 4.19-1 (2021-09-14)

### Bug fixes

* metagen():
  - set random effects weights equal to zero for estimates with
    standard errors equal to NA (to fix error bubble.metareg)

* metareg():
  - for three-level model, use 'test = "t"' instead of 'test = "knha"'
    in internal call of rma.mv()

### User-visible changes

* summary.meta():
  - print tau2 and tau for subgroups with single study if argument
    'tau.common = TRUE'

* bubble.metareg():
  - show regression lines for a single categorical covariate


## meta, version 4.19-0 (2021-08-05)

### Major changes

* Subgroup analysis for three-level model fully implemented

* New default for forest plots to show results of test for subgroup
  differences in meta-analyses with subgroups

* Calculation of weights for three-level random effects model using
  weights.rma.mv() with argument type = "rowsum" from R package
  **metafor**

* Print study label provided by argument 'studlab' for meta-analysis
  with a single study

* Total number of observations and events printed in summaries (if
  available)

### Bug fixes

* metagen():
  - treatment estimates for three-level models with subgroups were not
    based on common between-study variance despite argument tau.common
    = TRUE

* metareg():
  - use rma.mv() from R package **metafor** for three-level models
    instead of rma.uni()

### User-visible changes

* metabin(), metacont(), metacor(), metacr(), metagen(), metagen(),
  metainc(), metamean(), metaprop(), metarate():
  - new argument 'test.subgroup' to print results of test for subgroup
    differences

* print.meta():
  - for three-level models, column with grouping information added to
    study details

* metagen():
  - default for estimation of between-study variance has changed for
    three-level models with subgroups, i.e., tau2 is allowed to be
    different in subgroups by default

### Internal changes

* metagen():
  - new variable '.idx' with running index in meta-analysis data set
    (list element 'data')
  - new logical list element 'three.level' indicating whether
    three-level model was used


## meta, version 4.18-2 (2021-06-11)

### Bug fixes

* For argument 'adhoc.hakn = "ci"', directly compare width of
  confidence intervals of Hartung-Knapp method and classic random
  effects meta-analysis


## meta, version 4.18-1 (2021-05-11)

### Major changes

* Calculate correct upper limit for confidence intervals of I2 and H2
  in very homogeneous meta-analyses (i.e., if Q < k - 1)

### Bug fixes

* forest.meta():
  - correct order of p-values for homogeneity tests within subgroups
    if argument 'bysort = TRUE'

* calcH():
  - set H = 1 in calculation of confidence interval for H if H < 1
    (i.e., if Q < k - 1)

* metabias():
  - bug fix for linear regression tests using **metafor**, version
    2.5-86

* metabind():
  - bug fix for a single meta-analysis object

### Internal changes

* metabias.bias():
  - argument '...' passed on to rma.uni()

* metagen():
  - set list element 'df.hakn' to NA instead of NULL if condition met
    for argument 'adhoc.hakn = "ci"'


## meta, version 4.18-0 (2021-03-05)

### Major changes

* Prediction intervals for subgroups implemented

### Bug fixes

* metacont():
  - use correct variance formula for Glass' delta

* metainc():
  - update command resulted in an error *Arguments 'event.e' and 'n.e'
    must have the same length* for meta-analysis with subgroups (due
    to list elements 'n.e.w' and 'n.c.w' which were interpreted as
    'n.e' and 'n.c' containing missing values instead of being NULL)

* print.meta():
  - use of argument 'details = TRUE' resulted in an error in
    meta-analyses with duplicated study labels

* Consider argument 'adhoc.hakn' to calculate confidence intervals in
  random effects subgroup meta-analyses

### User-visible changes

* print.meta():
  - column with information on subgroups added to details if argument
    'details = TRUE'

* forest.meta():
  - new argument text.predict.w' to label the prediction interval in
    subgroups
  - arguments 'text.fixed.w' and 'text.random.w' checked for correct
    length

* *Ad hoc* variance correction for Hartung-Knapp method not available
  for GLMMs

### Internal changes

* metacont():
  - get rid of warnings 'Unknown or uninitialised column' if argument
    'subset' is used

* subgroup():
  - calculate prediction intervals for subgroups


## meta, version 4.17-0 (2021-02-11)

### Major changes

* Tests of funnel plot asymmetry:
  - tests by [Macaskill et
    al. (2001)](https://doi.org/10.1002/sim.698) and [Pustejovsky &
    Rodgers (2019)](https://doi.org/10.1002/jrsm.1332) added
  - use regtest() from R package **metafor** internally for linear
    regression tests
  - new print layout providing more details

* New dataset Pagliaro1992 for meta-analysis on prevention of first
  bleeding in cirrhosis [(Pagliaro et
  al., 1992)](https://doi.org/10.7326/0003-4819-117-1-59)

### Bug fixes

* update.meta():
  - do not switch to three-level model if method.tau = "ML"

### User-visible changes

* metabias():
  - use name of first author to select test for funnel plot asymmetry
    instead of "rank", "linreg", "mm", "count", and "score" (can be
    abbreviated; old names are still recognised)

* print.metabias():
  - new arguments 'digits.stat', 'digits.se', 'digits.pval',
    'scientific.pval', 'big.mark', 'zero.pval', 'JAMA.pval'

### Internal changes

* linregcore():
  - complete rewrite using rma.uni() and regtest() from R package
    **metafor**


## meta, version 4.16-2 (2021-01-27)

### Bug fixes

* drapery():
  - use correct limits on y-axis for argument 'type = "zvalue"'

### User-visible changes

* funnel.meta():
  - inverse of square root of sample size can be plotted on y-axis
    (argument 'yaxis = "invsqrtsize"')

* forest.meta():
  - consider input for argument 'hetstat' to print heterogeneity
    statistics for overall results (see argument 'overall.hetstat')

* metabin(), metacont(), metacor(), metagen(), metagen(), metainc(),
  metamean(), metaprop(), metarate():
  - studies with missing values for subgroup variable (argument
    'byvar') can be excluded from meta-analysis using argument
    'subset'

### Internal changes

* funnel.meta():
  - try to derive sample sizes from list elements 'n.e' or 'n.c' if
    argument 'yaxis = "size"'


## meta, version 4.16-1 (2021-01-19)

### Bug fixes

* For argument 'adhoc.hakn = "ci"', use correct query to determine
  whether confidence interval of Hartung-Knapp method is smaller than
  classic random effects meta-analysis ([Hybrid method 2 in Jackson et
  al., 2017](https://doi.org/10.1002/sim.7411))


## meta, version 4.16-0 (2021-01-18)

### Major changes

* Three-level meta-analysis models can be fitted for generic and
  continuous outcomes ([Van den Noortgate et.,
  2013](https://doi.org/10.3758/s13428-012-0261-6)) by calling
  rma.mv() from R package **metafor** internally

* Measures I2 and H for residual heterogeneity are based on Q
  statistic for residual heterogeneity (instead of taken directly from
  **metafor** package)

* Additional *ad hoc* method implemented if confidence interval of
  Hartung-Knapp method is smaller than classic random effects
  meta-analysis ([Hybrid method 2 in Jackson et al.,
  2017](https://doi.org/10.1002/sim.7411))

* For funnel plot of a diagnostic test accuracy meta-analysis, use
  *effective sample size* ([Deeks et.,
  2005](https://doi.org/10.1016/j.jclinepi.2005.01.016)) by default on
  the y-axis

* New function metamerge() to merge pooled results of two
  meta-analyses into a single meta-analysis object

### Bug fixes

* metabin():
  - Mantel-Haenszel method of risk differences did not use continuity
    correction in case of studies with a zero cell count (argument
    MH.exact = FALSE)

* metabin(), metainc(), metaprop(), metarate():
  - for GLMMs, confidence limits for classic random effects
    meta-analysis were calculated instead of confidence limits for
    Hartung-Knapp if argument 'hakn = TRUE'

* metabin(), metainc(), metaprop(), metarate():
  - works for GLMMs with zero events or number of events equal to
    number of patients in all studies

* forest.meta():
  - print results for test of subgroup effect in correct order if
    argument bysort = TRUE

* read.rm5():
  - list elements 'method' and 'sm' had been encoded as a factor
    instead of character under R-versions below 4.0 which resulted in
    an error using metacr()
   

### User-visible changes

* Do not print empty confidence intervals for heterogeneity statistics

* metacont(), metagen(), update.meta():
  - new argument 'id' to specify which estimates belong to the same
    study (or laboratory) in order to use three-level model

* metabind():
  - argument '...' can be a single list of meta-analysis objects
  - meta-analyses can use different methods, e.g., different
    estimators of the between-study variance
  
* All meta-analysis functions:
  - argument 'adhoc.hakn = "iqwig6"' instead of 'adhoc.hakn = "ci"'
    uses the *ad hoc* method for Hartung-Knapp method described in
    General Methods 6.0 (IQWiG, 2020)
  - argument 'adhoc.hakn = "ci"' uses the *ad hoc* method described in
    Jackson et al. (2017)

* forest.meta():
  - column heading "Mean" instead of "MLN" for meta-analysis object
    created with metamean() with arguments 'sm = "MLN"' and
    'backtransf = TRUE'
  - study labels specified by argument 'studlab' tried to catch from
    meta-analysis object
  - do not print statistic for residual heterogeneity if argument
    'tau.common = FALSE' was used to conduct subgroup meta-analysis

* metainc():
  - square root transformed incidence rate difference added as new
    summary measure (sm = "IRSD")

* New arguments 'text.fixed', 'text.random', 'text.predict',
  'text.w.fixed' and 'text.w,random' in meta-analysis functions

* settings.meta():
  - new general setting "geneexpr" to print scientific p-values and
    not calculate confidence interval for between-study heterogeneity
    variance tau2
  - argument 'method.tau.ci' can be specified as a global setting
  - text for fixed effect and random effects model as well as
    prediction interval can be specified (arguments 'text.fixed',
    'text.random', 'text.predict', 'text.w.fixed', 'text.w.randon')

* print.meta(), print.summary.meta():
  - do not print information on continuity correction for exact
    Mantel-Haenszel method with single study

* metareg() can be used in loops to provide argument 'formula'

* New auxiliary function JAMAlabels() to create study labels in JAMA
  layout

### Internal changes

* Calculate measures of residual heterogeneity in hetcalc()


## meta, version 4.15-1 (2020-09-30)

### Bug fixes

* metacr():
  - set summary measure to "OR" for Peto odds ratio


## meta, version 4.15-0 (2020-09-29)

### Major changes

* Deeks' linear regression test for funnel plot asymmetry of funnel
  plots of diagnostic test accuracy studies implemented ([Deeks et.,
  2005](https://doi.org/10.1016/j.jclinepi.2005.01.016))

* *Effective sample size* ([Deeks et.,
  2005](https://doi.org/10.1016/j.jclinepi.2005.01.016)) can be used
  on y-axis of funnel plot
  
* Discard infinite estimates and standard errors from calculation of
  heterogeneity measures

* Diagnostic odds ratio (sm = "DOR") added as new effect measure in
  metabin() and metagen()

### User-visible changes

* forest.meta(), forest.metabind():
  - arguments 'digits.zval' and 'print.zval' renamed to 'digits.stat'
    and 'print.stat'

* print.summary.meta(), settings.meta():
  - argument 'digits.zval' renamed to 'digits.stat'
  
* metacr():
  - do not print a warning for inverse variance meta-analysis with
    binary outcome

* Help page for tests of funnel plot asymmetry updated

* Help pages for metabin() and metainc() updated


## meta, version 4.14-0 (2020-09-09)

### Major changes

* Median and related statistics can be used in meta-analysis with
  continuous outcomes to approximate means and standard deviations
  ([Wan et., 2014](https://doi.org/10.1186/1471-2288-14-135); [Luo
  et al., 2018](https://doi.org/10.1177/0962280216669183); [Shi et
  al., 2020](https://doi.org/10.1002/jrsm.1429))

* RevMan 5 analysis datasets can be imported directly using the
  RM5-file

* R package **xml2** added to Imports (RM5-files are in XML-format)

* Confidence intervals for individual studies can be based on quantile
  of t-distribution (only implemented for mean differences and raw
  untransformed means at the moment)

* For the generic inverse variance method,
  - methods by [Luo et
    al. (2018)](https://doi.org/10.1177/0962280216669183) implemented
    to estimate mean from sample size, median and other statistics
  - method by [Shi et al. (2020)](https://doi.org/10.1002/jrsm.1429)
    implemented to estimate the standard deviation from sample size,
    median, interquartile range and range

### Bug fixes

* forest.meta():
  - show all studies with estimable treatment effects if argument
    'allstudies' is FALSE

* metabind():
  - works with meta-analysis objects created with metacor()
  - calculate correct p-value for heterogeneity test if input are
    subgroup analyses of the same dataset
  - calculate correct p-value for within-subgroup heterogeneity test
    if input are subgroup analyses of the same dataset

* metacum():
  - works with Hartung-Knapp method

* metagen():
  - list element 'seTE' contained standard deviation instead of
    standard error for method by [Wan
    et. (2014)](https://doi.org/10.1186/1471-2288-14-135) to estimate
    mean and its standard error from median and other statistics

### User-visible changes

* read.rm5():
  - direct import of RM5-file possible
  - new argument 'debug' for debug messages while importing RM5-files
    directly

* metacr():
  - overall results not shown if this was specified in the Cochrane
    review (only applies to imported RM5-files)

* metagen(), metacont(), metamean():
  - new argument 'method.mean' to choose method to estimate mean from
    sample size, median and other statistics
  - new argument 'method.sd' to choose method to estimate standard
    deviation from sample size, median, interquartile range and range
  - new argument 'method.ci' to choose method for confidence intervals
    of individual studies (only applies to mean differences and raw
    untransformed means at the moment)

* metacont():
  - new arguments to estimate mean and standard deviation from median
    and related statistics:
	'median.e', 'q1.e', 'q3.e', 'min.e', 'max.e', 'median.c', 'q1.c',
    'q3.c', 'min.c', 'max.c', 'method.mean', 'method.sd',
    'approx.mean.e', 'approx.mean.c', 'approx.sd.e', 'approx.sd.c'

* metamean():
  - new arguments to estimate mean and standard deviation from median
    and related statistics:
	'median', 'q1', 'q3', 'min', 'max', 'method.mean', 'method.sd',
    'approx.mean', 'approx.sd'
  
* forest():
  - by default, show number of participants in forest plot if this
    information is available for meta-analysis objects created with
    metagen()
  - automatically format p-values for individual studies if added to
    forest plot using argument 'leftcols' or 'rightcols'

* Datasets renamed from Fleiss93, Fleiss93cont and Olkin95 to
  Fleiss1993bin, Fleiss1993cont and Olkin1995
 
* More sensible variable names in datasets Fleiss1993bin,
  Fleiss1993cont and Olkin1995

### Internal changes

* Previous R function read.rm5() for CSV-files renamed to
  read.rm5.csv()

* New auxiliary functions to import RevMan 5 analysis datasets:
  - extract_outcomes(), oct2txt(), read.rm5.rm5()

* ci():
  - list element 'z' renamed to 'statistic' as calculations can also
    be based on the t-distribution (list element 'z' is still part of
    the output for backward compatibility, however, will be removed in
    a future update)

* metagen():
  - list elements 'zval', 'zval.fixed' and 'zval.random' renamed to
    'statistic', 'statistic.fixed' and 'statistic.random' (list
    elements 'zval', 'zval.fixed' and 'zval.random' are still part of
    the output for backward compatibility, however, will be removed in
    a future update)

* Internal functions TE.seTE.iqr.range(), TE.seTE.iqr() and
  TE.seTE.range() renamed to mean.sd.iqr.range(), mean.sd.iqr() and
  mean.sd.range()

* mean.sd.iqr.range():
  - new arguments 'method.mean' and 'method.sd'

* mean.sd.iqr(), mean.sd.range():
  - new argument 'method.mean'

* chkchar(), chkcolor(), chklevel(), chknumeric():
  - argument 'single' renamed to 'length' (which can be used to test
    for a specific vector length instead whether it is a single value)
	(argument 'single' is still available for backward compatibility,
     however, will be removed in a future update)


## meta, version 4.13-0 (2020-07-02)

### Major changes

* Rely on generic functions from R package **metafor**, e.g., to
  produce forest or funnel plots (since R version 4.0.0 generic
  functions from an R package do not consider corresponding functions
  from another R package which can result in errors if R packages
  **meta** and **metafor** are both loaded)

* R function funnel.default() removed from **meta** (conflicts with
  **metafor**)


## meta, version 4.12-0 (2020-05-04)

### Major changes

* Sample size method for meta-analysis of binary data with the odds
  ratio as summary measure implemented ([Bakbergenuly et al.,
  2020](https://www.doi.org/10.1002/jrsm.1404))

* *Ad hoc* variance correction for Hartung-Knapp method in the case of
  very homogeneous study results implemented ([Knapp and Hartung,
  2003](https://www.doi.org/10.1002/sim.1482); [IQWiG, General
  Methods: Draft of Version
  6.0](https://www.iqwig.de/en/about-us/methods/methods-paper/))

* Default settings according to recommendations in [General Methods of
  the Institute for Quality and Efficiency in Health Care (IQWIG),
  Germany](https://www.iqwig.de/en/about-us/methods/methods-paper/)
  
* Do not use predict.rma() from **metafor** package to calculate
  prediction intervals for generalized linear mixed models
  
### User-visible changes

* drapery():
  - study IDs or study labels can be printed at the top of the drapery
    plot to identify individual studies
  - more flexible plots, e.g., colours can be specified for individual
    studies based on p-value of treatment effect
  - possible value for argument 'type' renamed from "cvalue" to
    "zvalue" as drapery plots show test statistics, not critical
    values

* funnel.meta(), funnel.default():
  - argument 'log' is considered for relative summary measures, e.g.,
    odds or risk ratio

* metaprop():
  - can be used with non-integer number of events and sample sizes
  
* metabias.meta(), metabias.default():
  - third component of list element 'estimate' renamed from "slope" to
    "intercept" for linear regression tests
  
* settings.meta():
  - new possible general settings: "iqwig5" and "iqwig6", respectively

* Use Markdown for NEWS


## meta, version 4.11-0 (2020-02-20)

### Major changes

* New arguments 'overall' and 'overall.hetstat' in meta-analysis
  functions to control printing of overall meta-analysis results
  (useful to only show subgroup results)

* For GLMMs, use Wald-type Q statistic to calculate I-squared of
  residual heterogeneity in meta-analysis with subgroups (instead of
  likelihood-ratio Q statistic)
  
### Bug fixes

* For GLMMs with subgroups, conduct the correct test for subgroup
  differences (bug was introduced in **meta**, version 4.9-7)

* summary.meta():
  - export the correct harmonic mean for fixed effect and random
    effects model (part of list elements 'fixed' and 'random')

* metabind():
  - do not produce an error if argument 'warn' or 'prediction' is not
    unique in meta-analyses
  
### User-visible changes

* forest.meta():
  - possible to print results for test of an overall effect or
    subgroup differences even if meta-analysis results are not shown
  - new defaults for arguments 'overall' and 'overall.hetstat' (which
    are now considered from meta-analysis objects)

* print.summary.meta():
  - for meta-analysis with subgroups, print information on Q and I^2
    with fixed effect results and information on tau and tau^2 with
    random effects results (previously, information on Q, I^2, tau,
    and tau^2 was reported twice)

### Internal changes

* do not calculate confidence limits for tau2 and tau in intermediate
  calculations of other quantities (i.e., use argument method.tau.ci =
  "")


## meta, version 4.10-0 (2020-01-29)

### Major changes

* New function drapery() to generate a drapery plot (based on p-value
  curves)
  
### Bug fixes

* funnel.meta():
  - print contours in contour-enhanced funnel plots at correct
    position for relative effect measures (bug was introduced in
    **meta**, version 4.9-8)

### User-visible changes

* update.meta():
  - do not print a warning concerning argument 'Q.Cochrane' if
    argument sm = "ASD" for meta-analysis objects created with
    metabin()

* print.summary.meta():
  - do not print z- and p-values if test for an overall effect was not
    conducted (see argument 'null.effect' in metamean(), metaprop(),
    and metarate())


## meta, version 4.9-9 (2019-12-19)

### Bug fixes

* forest.meta():
  - printing an additional column on the right side of the forest plot
    does not result in an error (bug was introduced in **meta**,
    version 4.9-8)

### User-visible changes

* labbe():
  - new argument 'pos.studlab'
  - argument checks implemented

* baujat(), bubble():
  - argument 'pos' renamed to 'pos.studlab'
  - argument checks implemented


## meta, version 4.9-8 (2019-12-16)

### Major changes

* Confidence intervals for the between-study variance tau2 and its
  square root tau are calculated

* Print tau as well as confidence intervals for tau2 and tau in
  outputs

* Square root of between-study variance can be printed in forest plots
  instead of between-study variance tau2; in addition, the confidence
  interval for tau2 or tau can be printed

* Use R package **metafor** to estimate between-study variance tau2
  for DerSimonian-Laird and Paule-Mandel method (which has been
  already used for all other methods to estimate tau2)

* For Mantel-Haenszel (MH) method, report results as MH method
  (instead of inverse variance, IV) for meta-analysis of binary
  outcome with a single study (results are identical for MH and IV
  method in this situation)

* Number of studies printed without digits in forest plots for R
  objects created with metabind()

* P-values can be printed according to [JAMA reporting
  standards](https://jamanetwork.com/journals/jama)

* In subgroup analyses, print the group labels instead of levels if
  the grouping variable is a factor

* In funnel plot, print funnel around random effects (instead of fixed
  effect) estimate if only random effects meta-analysis is conducted;
  only show funnel if either fixed effect or random effects
  meta-analysis was conducted

* New preferred citation of R package **meta**: [Balduzzi et
  al. (2019)](https://scholar.google.com/scholar?q=balduzzi+schwarzer+2019)

### User-visible changes

* print.summary.meta(), forest.meta():
  - new argument 'JAMA.pval' to print p-values according to JAMA
    reporting standards

* print.summary.meta():
  - new argument 'zero.pval' to remove leading zeros from p-values
  - print information on estimation of between-study variance even if
    only results for fixed effect model is shown
  - print information if Mantel-Haenszel estimate is used to calculate
    Q and tau2 (implemented similar to RevMan 5)
  - global setting for 'text.tau2' as defined in settings.meta() is
    considered in details of meta-analytical method

* print.meta():
  - do not print (missing) weights for GLMMs

* update.meta():
  - by default, do not print warnings (argument 'warn')
  - add information on variable defining subgroups (argument 'byvar')
    to meta-analysis dataset

* Command 'settings.meta("JAMA")' will change the settings for
  arguments 'zero.pval' and 'JAMA.pval'

* Help page with description of R package updated

* Major update of other help pages:
  - metacont(), metacor(), and metamean()

### Internal changes

* Function paulemandel() removed as R package **metafor** is used to
  estimate the between-study variance

* formatPT():
  - new argument 'JAMA'

* List elements 'C' and 'C.w' (scaling factor to estimate common
  between-study variance) removed from meta-analysis objects

* Import confint.rma.uni() from **metafor** to calculate confidence
  intervals for tau2 and tau

* New internal function pasteCI() to print formatted CIs

* New internal function is.wholenumber() to check for whole numbers


## meta, version 4.9-7 (2019-09-27)

### Major changes

* Subgroup analysis using argument 'byvar' possible for generalised
  linear mixed models (GLMMs)
    
### Bug fixes

* metaprop():
  - no error if argument 'tau.common' is TRUE for GLMM

* metabin(), metainc(), metarate():
  - consider argument 'control' in subgroup analysis

### User-visible changes

* Major update of help pages:
  - metabin(), metagen(), metainc(), metaprop(), metarate()


## meta, version 4.9-6 (2019-08-06)

### Major changes

* New functions to calculate the number needed to treat from the
  results of a meta-analysis

* Equivalence limits can be added to forest plots

* Font family can be specified in forest plots

* Print Wald-type test of heterogeneity for generalised linear mixed
  models (problem fixed in R package **metafor**, version 2.1-0)
    
### Bug fixes

* forest.meta():
  - (always) print correct length for reference line
  - (always) print label on x-axis at the correct vertical position
  - (always) print graph labels on the left and right side of the
    forest plot at the correct vertical position
  - no error if additional numeric variable is added to the right side
    of the forest plot (argument 'rightcols')

* summary.meta():
  - consider argument 'bylab'

* metaprop():
  - allow values 0 and 1 for argument 'null.effect'

### User-visible changes

* forest.meta():
  - new arguments 'lower.equi', 'upper.equi', 'lty.equi', 'col.e' and
    'fill.equi' to add equivalence limits
  - new argument 'fontfamily' to specify the font family

* forest.metabind():
  - information on heterogeneity printed for each meta-analysis

### Internal changes

* ciAgrestiCoull():
  - set lower confidence limit to 0 for negative values
  - set upper confidence limit to 1 for values above 1

* subgroup meta-analyses return new list element 'pval.Q.w' (change in
  internal function subgroup())


## meta, version 4.9-5 (2019-04-11)

### Major changes

* For the generic inverse variance method, treatment estimates and
  standard errors of individual studies can be derived from
  - p-value or confidence limits
  - sample size, median, interquartile range and / or range (Wan et
    al. (2014), BMC Med Res Meth, 14, 135)

* New functions for the conversion of effect measures:
  - smd2or() - from standardised mean difference to log odds ratio
  - or2smd() - from log odds ratio to standardised mean difference

* Harbord test for funnel plot asymmetry implemented for risk ratio as
  effect measure

* Generalised linear mixed model is the new default method for
  meta-analysis of single proportions using the logit transformation

* R packages **metafor** and **lme4** moved from Suggests to Imports

* Suppress printing of Wald-type test of heterogeneity for generalised
  linear mixed models (problem in R function rma.glmm() from R package
  **metafor**, version 2.0-0)
 
* Use **roxygen2** for development of R package **meta**

### User-visible changes

* metagen():
  - new arguments 'pval', 'df', 'lower', 'upper', 'level.ci',
    'median', 'q1', 'q3', 'min', 'max', 'approx.TE', 'approx.seTE' to
    approximate treatment estimates and / or standard errors from
    other information

* forest.meta():
  - printing of leading zeros in p-values can be suppressed (new
    argument 'zero.pval')
  - rounding of values for additional numerical columns possible (new
    arguments 'digits.addcols', 'digits.addcols.left', and
    'digits.addcols.right')
  - argument 'big.mark' is considered for additional columns
  - new arguments 'type.subgroup.fixed', 'type.subgroup.random', and
    'lab.NA.weight'

* settings.meta(), gs():
  - argument names can be abbreviated

* Major update of help pages of metagen() and metaprop()

### Bug fixes

* metacum(), metainf():
  - consider argument 'method' for meta-analysis objects created with
    metaprop() or metarate()

* forest.meta():
  - argument 'studlab' can be used with objects created with metacum()
    or metainf()

* subgroup():
  - return subgroup sample sizes for objects created with metagen()

### Internal changes

* New internal functions TE.seTE.ci(), TE.seTE.iqr(),
  TE.seTE.iqr.range(), TE.seTE.range(), and seTE.ci.pval() to
  approximate treatment estimates and / or standard errors from other
  information

* setchar():
  - new argument 'stop.at.error'

* metagen():
  - list element 'data' contains the dataset of the meta-analysis
    object (i.e., list element 'data') instead of the whole
    meta-analysis object


## meta, version 4.9-4 (2019-01-02)

### Major changes

* Information on residual heterogeneity in meta-analyses with
  subgroups shown in printouts and forest plots

### User-visible changes

* forest.meta():
  - new arguments 'resid.hetstat' and 'resid.hetlab' to control
    printing of information on residual heterogeneity in meta-analyses
    with subgroups

### Bug fixes

* forest.meta():
  - works in meta-analyses with subgroups if argument 'allstudies' is
    FALSE


## meta, version 4.9-3 (2018-11-29)

### Major changes

* New argument 'control' in meta-analysis functions which is passed on
  to R function rma.uni() or rma.glmm() from R package **metafor** to
  control the iterative process to estimate the between-study variance
  tau^2

### User-visible changes

* metabin(), metacont(), metacor(), metagen(), metainc(), metamean(),
  metaprop(), metarate(), update.meta():
  - new argument 'control' (see major changes)

* forest.meta():
  - new argument 'calcwidth.subgroup'

### Bug fixes

* bubble.metareg():
  - ignore missing values in covariate to calculate limits on x-axis
  - works if data set used to create meta-analysis object is a tibble
    instead of a data frame

### Internal changes

* metabind():
  - argument 'tau.common' only considered for subgroup analyses

* hetcalc():
  - argument 'control' passed on to R function rma.uni() from R
    package **metafor**

* metacum(), metainf(), subgroup():
  - argument 'control' from meta-analysis objects considered


## meta, version 4.9-2 (2018-06-06)

### Major changes

* All p-values of Q statistics are list elements of meta-analysis
  objects

### Bug fixes

* metareg():
  - consider argument 'intercept = FALSE' if argument 'formula' has
    been provided
    
### Internal changes

* New internal function replaceNULL()


## meta, version 4.9-1 (2018-03-21)

### Major changes

* Subgroup results consider the exclusion of individual studies (bug
  fix)

* For generalized linear mixed models, between-study variance set to
  NA if only a single study is considered in meta-analysis

### Bug fixes

* metamean():
  - use of argument 'byvar' for subgroup analyses possible

* metacor(), metamean(), metaprop(), metarate():
  - use as input to metabind() possible

* Internal function subgroup():
  - consider argument 'exclude' in subgroup analyses

* Internal function bylevs():
  - drop unused levels if subgroup variable is a factor variable

### User-visible changes

* print.summary.meta():
  - print information on Generalized Linear Mixed Model (GLMM) for
    metarate() objects
  - print information on increments added to calculate confidence
    intervals for individual studies (for metarate() with GLMM)

* funnel.meta():
  - new arguments 'ref.triangle', 'lty.ref', 'lwd.ref', 'col.ref', and
    'lty.ref.triangle' to add reference value (null effect) and
    corresponding confidence intervals to the funnel plot

* metabin():
  - new argument 'pscale' to change printout of risk differences

* metainc():
  - new arguments 'irscale' and 'irunit' to change printout of
    incidence rate differences

* forest.meta(), print.meta(), print.summary.meta(), update.meta():
  - consider arguments 'pscale', 'irscale', and 'irunit' for
    meta-analysis objects created with metabin() and metainc()

* print.meta():
  - new argument 'irunit'

### Internal changes

* metaprop():
  - for random effects model, rma.glmm() from package **metafor** is
    called internally with argument 'method = "FE"' if only a single
    study is available

* metareg():
  - for generalised linear mixed models, fallback to fixed effect
    model if number of studies is too small for random effects
    meta-regression

* asin2ir():
  - back-transformation could result in (very small) negative zero
    values due to imprecisions (-1e-19); these values are set to zero
    now

* subgroup():
  - code for metamean() added

* chkchar():
  - new argument 'nchar' to test the length of character string(s)

* New internal function is.untransformed() to check for effect
  measures without (back-)transformation


## meta, version 4.9-0 (2017-12-06)

### Major changes

* New function metamean() to conduct meta-analysis of single means

* New function metabind() to combine meta-analysis objects, e.g. to
  generate a forest plot with results of several subgroup analyses

* Subgroup analysis implemented for generalised linear mixed models
  (GLMMs) with and without assumption of common between-study variance
  (arguments 'byvar' and 'tau.common')

* Axis direction can be reversed for x-axis in forest plots

* Source code version of **meta** can be installed without
  compilation, i.e., without use of Rtools on Windows or 'Command-line
  tools for Xcode' on macOS

* Rank test for funnel plot asymmetry uses cor() from R package
  **stats** instead of internal C routine (negligibly slower, however,
  no need for compilation of source installs)

* Thousands separator can be used in printouts and forest plots for
  large numbers

* P-values equal to 0 are actually printed as "0" instead of "<
  0.0001"

### User-visible changes

* forest.meta(), print.meta(), print.summary.meta():
  - new argument 'big.mark' to specify character printed as thousands
    separator, e.g., big.mark = "," will result in printing of 1,000
    for the number 1000

* forest.meta():
  - sensible forest plot generated if first value in argument 'xlim'
    is larger than second value, e.g. xlim = c(10, -10)
  - separator between label and levels of grouping variable (argument
    'byseparator') is considered from meta-analysis object
  - for relative summary measures, e.g., odds ratio and risk ratio,
    labels on x-axis are not rounded to two digits (which resulted in
    the value 0 for a tick-mark at 0.001)
  - bug fix: lines for treatment effect in fixed effect and random
    effects model start in center of diamond if argument hetstat =
    FALSE
  - bug fix: argument 'type.study' will be sorted according to
    arguments 'sortvar'

* metaprop():
  - arguments 'byvar' and 'tau.common' can be used for GLMMs

* Help page with overview of R functions in R package **meta** updated

### Internal changes

* New internal functions:
  - is.log.effect() to check for treatment effects combined on log
    scale
  - is.mean() to check whether summary measure refers to meta-analysis
    of single means

* Renamed internal functions:
  - formatCI() instead of p.ci()
  - formatN() instead of format.NA()
  - formatPT() instead of format.p()

* Removed R functions:
  - format.tau() as functionality is now provided by formatPT()
  - C program kenscore.c as cor() from R package **stats** is used
    instead to calculate Kendall's tau

* Deprecated functions: format.NA(), format.p(), p.ci()

* Check whether argument 'sm' is NULL in meta-analysis functions

* subgroup(): extended for GLMMs

* formatPT():
  - zero p-values are printed as "0" instead of "< 0.001"
  - NaNs are handled like NAs

* bylabel(), catmeth(), formatPT(), formatN(), xlab():
  - new argument 'big.mark' (see above)


## meta, version 4.8-4 (2017-08-11)

### User-visible changes

* forest.meta():
  - new arguments 'col.fixed' and 'col.random' to change colour of
    fixed effect and random effects lines

### Bug fixes

* bubble.metareg():
  - works if covariate in metareg() is not part of dataset used to
    generate meta-analysis object

* forest.meta():
  - lines for treatment effect in fixed effect and random effects
    model always start in center of diamond
    
* metacum(), metainf():
  - argument 'model.glmm' considered for metabin() and metainc()
    objects

* print.summary.meta():
  - print transformed null effect for meta-analysis of single
    correlations, proportions, or rates if argument backtransf is
    FALSE, i.e., for metacor(), metaprop(), and metarate() objects
    
* trimfill.meta():
  - argument 'null.effect' is considered to calculate p-value for
    fixed effect and random effects model for metacor(), metaprop(),
    and metarate() objects

### Internal changes

* New internal functions is.cor(), is.prop() and is.rate() to check
  whether summary measure refers to meta-analysis of correlations,
  proportions, or rates

* metabias.default(), radial.default(), trimfill.default():
  - call metagen() internally to create meta-analysis object
  - call metabias.meta(), radial.meta(), or trimfill.meta() internally
    to conduct analysis


## meta, version 4.8-3 (2017-07-21)

### Major changes

* Similar to RevMan 5, individual studies can be excluded from
  meta-analysis, however, will be shown in printouts and forest plots

* In forest plots, line spacing can be determined by the user.

### User-visible changes

* metabin(), metacor(), metacont(), metagen(), metainc(), metaprop(),
  metarate():
  - new argument 'exclude' to exclude studies from meta-analysis

* forest.meta():
  - new argument 'spacing' to determine line spacing
  - bug fix for for meta-analysis with standardized mean difference
    (sm = "SMD") and argument layout = "RevMan5"

* R function ci() can be used with vectors or matrices of treatment
  estimates and standard errors and a single value for argument 'df',
  i.e., degrees of freedom (which is used in R package **netmeta** to
  calculate prediction intervals for network meta-analysis estimates)

* metacum(), metainf():
  - argument 'null.effect' considered internally for objects generated
    with metacor(), metagen(), metaprop() and metarate()

### Internal changes
 
* baujat.meta(), metabias.meta(), metacum(), metainf(), forest.meta(),
  funnel.meta(), metareg(), print.meta(), radial.meta(),
  trimfill.meta(), update.meta():
  - changes to deal with excluded studies


## meta, version 4.8-2 (2017-05-24)

### Major changes
 
* Calculate confidence interval for I-squared in a meta-analysis with
  two studies if the heterogeneity statistic Q is larger than 2

* P-values can be printed in scientific notation

* In forest plots, printing of z-values can be disabled and labels for
  tests can be changed by user

### User-visible changes

* forest.meta():
  - new argument 'print.zval' to print (default) or not print z-value
    for test of treatment effect
  - new argument 'print.Q.subgroup' to print (default) or not print
    Chi-squared statistic for test of subgroup differences
  - bug fix: print first line above second line if argument 'xlab'
    consists of two lines (bug was introduced in **meta**, version
    4.8-0)
  - labels of additional columns are printed in correct line if label
    consists of two lines
  - new argument 'scientific.pval' to print p-values in scientific
    notation, e.g., 1.2345e-01 instead of 0.12345
  - arguments 'label.test.overall.fixed', 'label.test.overall.random',
    'label.test.subgroup.fixed', 'label.test.subgroup.random',
    'label.test.effect.subgroup.fixed',
    'label.test.effect.subgroup.random' work as expected
  - new argument 'text.subgroup.nohet' to enable the user to change
    the text "not applicable" in the line with heterogeneity
    statistics for a subgroup with less than two studies contributing
    to the meta-analysis
  - forest plot without any study contributing to meta-analysis can be
    generated without an error, e.g., meta-analysis with binary
    outcome, sm="OR", and all event numbers equal to zero
    
* print.meta() and print.summary.meta():
  - new argument 'scientific.pval' to print p-values in scientific
    notation, e.g., 1.2345e-01 instead of 0.12345.
  - new arguments 'print.pval' and 'print.pval.Q' to specify number of
    significant digits for p-values

* R command 'help(meta)' can be used to show brief overview of R
  package **meta**

* Substantially decrease number of automatically run examples for
  forest.meta() as CRAN only allows a run time below 10 seconds for
  examples provided on a help page
      
### Internal changes

* new internal function pvalQ() to calculate p-value from
  heterogeneity tests

* calcH():
  - Calculate confidence interval for H in a meta-analysis with two
    studies if the heterogeneity statistic Q is larger than 2 (this
    confidence interval is used in isquared() to calculate a
    confidence interval for I-squared)

* hetcalc():
  - heterogeneity statistic Q set to 0 for a single study contributing
    to the meta-analysis (sometimes in this case Q was set to a value
    below 1e-30)

* subgroup():
  - list element df.Q.b set to 0 if number of studies in meta-analysis
    is 0

* format.p():
  - new argument 'lab.NA' to change value printed for NAs

* forest.meta() and print.summary.meta():
  - use internal function pvalQ() instead of dedicated R code


## meta, version 4.8-1 (2017-03-17)

### User-visible changes

* metacum(), metainf():
  - bug fix for meta-analysis objects without continuity correction,
    i.e., metacont(), metacor(), metagen() (bug was introduced in
    version 4.8-0 of **meta**) Error message: "Error in
    rep_len(x$incr, k.all): cannot replicate NULL to a non-zero
    length"
  - bug fix for metarate() objects (improper use of metaprop()
    internally)


## meta, version 4.8-0 (2017-03-12)

### Major changes
 
* Continuity correction can be specified for each individual study in
  meta-analysis with proportions or incidence rates

### User-visible changes

* metabin(), metainc(), metaprop(), metarate():
  - argument 'incr' can be of same length as number of studies in
    meta-analysis

* metaprop():
  - bug fix in studies with missing information for events or sample
    size and argument method.ci = "CP"
  - bug fix such that test for an overall effect is actually
    calculated

* forest.meta():
  - bug fix such that summary label (argument 'smlab') is printed
    above forest plot if argument 'fontsize' is unequal to 12
  - by default, label on x-axis and text on top of forest plot are
    printed in center of forest plot (arguments 'xlab.pos',
    'smlab.pos')

* print.summary.meta():
  - print number of studies for fixed effect meta-analysis using
    Mantel-Haenszel method if different from number of studies in
    random effects model (only if summary measure is "RD" or "IRD" and
    at least one study has zero events)

* metainc():
  - bug fix such that argument 'incr' is considered for incidence rate
    difference (sm = "IRD")

### Internal changes

* act on NOTE in 'R CMD check ... --as-cran' with R version, 3.4.0,
  i.e. register and declare native C routine kenscore

* metabin(), metainc():
  - new list element 'k.MH' with number of studies in meta-analysis
    using Mantel-Haenszel method

* forest.meta():
  - auxiliary R functions removed from R code
  - cleaning / shortening of R code

* new auxiliary R functions used in forest.meta():
  - add.label, add.text, add.xlab, draw.axis, draw.ci.square,
    draw.ci.diamond, draw.ci.predict, draw.forest, draw.lines,
    formatcol, removeNULL, tg, tgl, twolines, wcalc
      
* hetcalc(), calcH():
  - set tau^2 as well as H and I^2 to NA if only a single study
    contributes to meta-analysis (e.g., if other studies in
    meta-analysis have zero standard error)

* updateversion():
  - use R function update.meta() if version of **meta** used to create
    R object is below 3.2


## meta, version 4.7-1 (2017-02-13)

### Major changes

* Null hypothesis for test of an overall effect can be specified for
  metacor(), metagen(), metaprop(), and metarate(); for all other
  meta-analysis functions implicit a null effect of zero is assumed
  (for relative effect measures, e.g., odds ratio and hazard ratio,
  the null effect is defined on the log scale)

* User can choose whether to print the following heterogeneity
  quantities: I^2, H, Rb (by default, heterogeneity measure Rb is not
  printed and thus revoking a change in **meta**, 4.7-0)

* In forest plots with subgroups, study weights are summed up to 100
  percent within each subgroup if no overall estimates are requested,
  i.e., argument overall is FALSE (like before, by default, weights
  are not printed if argument overall is FALSE and have to be
  explicitely requested using argument leftcols or rightcols)
  
### User-visible changes

* forest.meta():
  - print line with heterogeneity statistics directly below individual
    study results if pooled effects are not shown in forest plot
    (overall = FALSE)
  - print right and left labels (arguments label.left, label.right) in
    correct line if arguments overall and addrow are FALSE
  - bug fix: do not stop with an error if comb.fixed = FALSE,
    comb.random = FALSE, and overall.hetstat = TRUE

* ci(), metacor(), metagen(), metaprop(), metarate():
  - new argument null.effect to specify null hypothesis for test of an
    overall effect, e.g., null.effect = 0.5 in metaprop() to test
    whether the overall proportion is equal to 0.5

* metagen():
  - Hartung-Knapp method only used for at least two studies in
    meta-analysis

* print.meta():
  - print covariate with subgroup information for each study, if
    subgroup analysis is conducted (argument byvar)

* print.summary.meta():
  - new arguments print.I2, print.H, print.Rb to specify heterogeneity
    measures shown in output
  - new arguments text.tau2, text.I2, text.Rb to change text printed
    to identify respective heterogeneity measure
  - only print information on double zero studies if argument
    allstudies is TRUE
  - print results for (empty) subgroup in meta-analysis with two
    studies and one subgroup with missing treatment estimate

* settings.meta():
  - new arguments print.I2, print.H, print.Rb, text.tau2, text.I2,
    text.Rb to modify printing of heterogeneity measures

### Internal changes
    
* summary.meta():
  - bug fix: list element 'ircale' renamed to 'irscale'
  - list element 'within' removed which has not been used since
    **meta**, version 1.1-4


## meta, version 4.7-0 (2016-12-16)

### Major changes

* Forest plots:
  - forest plots with RevMan 5 and JAMA layout
  - use of mathematical symbols for I^2, tau^2, etc.
  - individual study results can be omitted from forest plot
    (especially useful to only print subgroup results)
  - labels can be printed at top of forest plot

* Measure of between-study heterogeneity added:
  - R_b ([Crippa et al. (2016)](https://www.doi.org/10.1002/sim.6980))

* Default settings of meta-analysis methods specified via gs() instead
  of extracting elements of list .settings (which makes output of
  args() easier to read, e.g., args(metabin))

* Version of suggested R package **metafor** must be at least 1.9-9
  (due to change in arguments of rma.uni() and rma.glmm())
  
### User-visible changes

* forest.meta():
  - argument layout:
      - new layouts: "JAMA" to produce forest plots with [JAMA
        style](https://jamanetwork.com/journals/jama/pages/instructions-for-authors/)
      - RevMan 5 layout extended
  - arguments can be specified without using grid::unit(): plotwidth,
    colgap, colgap.left, colgap.right, colgap.studlab, colgap.forest,
    colgap.forest.left, colgap.forest.right
  - new argument study.results to print (default) or omit individual
    study results from forest plot
  - new argument bottom.lr to change position of labels on left and
    right side of forest plot
  - new arguments col.label.right and col.label.left to change colour
    of labels on left and right side of forest plot
  - argument weight renamed to weight.study and new argument
    weight.subgroup added to specify whether plotted subgroup results
    should be of same or different size
  - new arguments print.Rb, print.Rb.ci, Rb.text for heterogeneity
    measure Rb
  - new arguments to control printing: digits.cor, digits.mean,
    digits.sd, digits.time, digits.zval
  - new argument print.subgroup.labels to print (default) or omit
    rows with subgroup label from forest plot  
  - new argument type.subgroup to change plotting of subgroup results
  - argument addspace renamed to addrow
  - new argument addrow.subgroups to add a blank line between subgroup
    results
  - new argument addrow.overall to add a blank before meta-analysis
    results
  - new argument blanks to enhance printing of test statistics,
    heterogeneity measurs, and p-values  
  - new argument colgap.studlab to specify space between column with
    study labels and subsequent column
  - new arguments to change width of column with study labels (these
    arguments are especially useful if only study labels are printed
    on left side of forest plot):
      - calcwidth.fixed (consider text for fixed effect model)
      - calcwidth.random (consider text for random effects model)
      - calcwidth.hetstat (consider text for heterogeneity measures)
      - calcwidth.tests (consider text for tests of effect or
                         subgroup differences)
  - new column "effect.ci" with estimated treatment effect and
    confidence interval in one column
  - unnecessary arguments removed: text.I2, text.tau2
    
* metabin(), metacont(), metacor(), metacr(), metacum(), metagen(),
  metainc(), metainf(), metaprop(), metarate(), trimfill.default(),
  trimfill.meta():
  - new measure of between-study heterogeneity implemented (list
    elements Rb, lower.Rb, upper.Rb)
  
* summary.meta():
  - new measure of between-study heterogeneity added (list element
    Rb.w)
  
* print.meta(), print.summary.meta():
  - print heterogeneity measure Rb
  
* metabias.meta(), metabias.default():
  - checks for arguments implemented
      
* New function gs() to get default settings

* forest.meta(), metabin(), metacont(), metacor(), metacr(),
  metagen(), metainc(), metaprop(), metarate(), print.meta(),
  print.summary.meta():
  - use gs() to define defaults for arguments in meta-analysis
    functions, e.g. gs("hakn") instead of .settings$hakn

* metareg():
  - stop with an error if version of **metafor** package is below
    1.9-9

* metabin(), metainc(), metaprop(), metarate():
  - for GLMMs, stop with an error if version of **metafor** package is
    below 1.9-9
    
* metabin():
  - bug fix, do not stop with an error if no double zero events are
    present in a dataset with at least one study with NA event counts

* metareg():
  - bug fix, use of covariate 'x' does not result in an error

* settings.meta():
  - general settings for RevMan 5 and JAMA implemented
  - function can be used to change the layout of confidence intervals
    using arguments CIbracket and CIseparator (these arguments can
    also be set using cilayout())

* Several help pages updated, especially
  - forest.meta(), settings.meta(), meta-package

### Internal changes
    
* metabin(), metainc(), metaprop(), metarate(), metareg():
  - use argument test instead of knha and tdist for calls of rma.uni()
    and rma.glmm(); change in R package **metafor**, version 1.9-9
    
* subgroup():
  - new measure Rb of between-study heterogeneity implemented
    
* is.installed.package():
  - new check of version number of R package
  - use requireNamespace() instead of installed.packages()

* format.p():
  - for small p-values, print "p < 0.01" or "p < 0.001" instead of "p
    < 0.0001" if digits.pval is 2 or 3, respectively
  - new argument zero to print ".001" instead of "0.001", etc

* meta-internal():
  - set defaults for new arguments: smrate, layout


## meta, version 4.6-0 (2016-10-12)

### Major changes

* New function metarate() to conduct meta-analysis of single incidence
  rates

* Peters' test for funnel plot asymmetry implemented for
  meta-analysis of single proportions

* Meta-analysis of ratio of means added to metacont()

* Justification of additional columns in forest plot can be
  specified individually for each additional column

* Justification of additional columns in forest plot can be
  specified individually for each additional column

* Calculation of Freeman-Tukey double arcsin transformation and
  backtransformation slightly changed in meta-analysis of single
  proportions

* By default, do not print a warning if backtransformation for
  metaprop() and metarate() objects results in values below 0 or
  above 1 (only for proportions); note, respective values are set
  to 0 or 1

### User-visible changes
    
* Help page with brief overview of **meta** package added
    
* Preferred citation of **meta** package in publications changed; see
  output of command 'citation("meta")'

* forest.meta(), metagen(), print.meta(), print.summary.meta(),
  summary.meta(), trimfill.default(), trimfill.meta(), update.meta():
  - new arguments irscale and irunit for meta-analysis objects created
    with metarate()

* settings.meta():
  - new arguments smrate for meta-analysis objects created with
    metarate()

* funnel.meta(), funnel.default():
  - new argument pos.studlab to change position of study labels

* forest.meta():
  - new arguments just.addcols.left and just.addcols.right to specify
    justification of additional columns on left and right side of
    forest plot

* metacont():
  - meta-analysis for ratio of means implemented (argument sm = "ROM")
  - new argument backtransf (if argument sm = "ROM")

* metaprop():
  - change in Freeman-Tukey double arcsin transformation only visible
    in printouts if argument backtransf = FALSE or if list elements
    TE, TE.fixed, and TE.random (as well as confidence intervals) are
    extracted from a metaprop object

* print.summary.meta():
  - print correct results for subgroup analyses of metaprop objects
    with sm = "PFT" (bugfix in internal subgroup() function)

* print.meta(), print.summary.meta():
  - new argument warn.backtransf to specify whether a warning should
    be printed if backtransformed proportions and rates are below 0
    and backtransformed proportions are above 1

* Help pages updated:
  - forest.meta(), metabias.meta(), metabin(), metacont(), metacor(),
    metagen(), metainc(), metainf(), metaprop(), print.meta(),
    print.summary.meta(), summary.meta(), trimfill.default(),
    trimfill.meta(), update.meta()

### Internal changes

* New function asin2ir() to backtransform arcsine transformed
  incidence rates

* backtransf(), catmeth(), metacum(), metainf(), subgroup(), xlab():
  - extension to handle meta-analysis objects created with metarate()

* metaprop(), asin2p():  
  - calculation of Freeman-Tukey double arcsin transformation changed
    such that sm = "PFT" and sm = "PAS" result in similar estimates
    (TE, TE.fixed, TE.random), i.e. values are multiplied by 0.5 for
    sm = "PFT"

* subgroup():
  - bux fix in calculation of harmonic mean of sample sizes (for
    metaprop objects with sm = "PFT") and event times (for metarate
    objects with sm = "IRFT")


## meta, version 4.5-0 (2016-08-17)

### Major changes

* New features in forest plots:
  - printing of columns on left side of forest plot can be omitted
  - total person time can be printed
  - text for fixed effect and random effects model can be omitted
      from calculation of width for study labels
  - plot type for confidence intervals (square or diamond) can be
      specified for each study as well as fixed effect and random
      effects estimate
  - printing of test for treatment effect in subgroups possible

* New function weights.meta() to calculate absolute and percentage
    weights in meta-analysis

* New argument byseparator to define the separator between label and
    subgroup levels which is printed in meta-analysis summaries and
    forest plots - considered in all R functions dealing with
    meta-analysis and subgroups

* Argument pscale - a scaling factor for printing of single event
    probabilities - considered in all R functions for single
    proportions; before this update, the pscale argument was only
    available in forest.meta()

### User-visible changes

* forest.meta():
  - argument ref considered for metaprop objects
  - argument leftcols = FALSE omits printing of columns on left side
      of forest plot
  - new argument pooled.times to print total person time
  - new argument calcwidth.pooled to include or exclude text from
      pooled estimates to determine width of study labels
  - the following arguments have been renamed (old arguments can
      still be used at the moment, however, will result in an
      informative warning message):      
      . col.i                    -> col.study
      . col.i.inside.square      -> col.inside
      . col.diamond.fixed.lines  -> col.diamond.lines.fixed
      . col.diamond.random.lines -> col.diamond.lines.random
  - new arguments:
      . type.study, type.fixed, type.random
        (use squares or diamonds to plot treatment effects and
         confidence intervals)
      . col.inside.fixed, col.inside.random
        (colour to print confidence interval inside square)
      . test.effect.subgroup, test.effect.subgroup.fixed,
        test.effect.subgroup.random, label.test.effect.subgroup.fixed,
        label.test.effect.subgroup.random, fs.test.effect.subgroup,
        ff.test.effect.subgroup
	(print results for test of treatment effect in subgroups)
  - bug fix: reference line and lines for fixed effect and random
      effects estimate were too short if test.overall is TRUE
  - bug fix: arguments lab.e.attach.to.col and lab.c.attach.to.col
      were ignored for R objects created with metagen()

* metabin(), metacont(), metacor(), metagen(), metainc(),
    metaprop(), forest.meta(), print.summary.meta(), summary.meta(),
    update.meta(), settings.meta():
  - new argument byseparator

* metagen(), metaprop(), print.meta(), print.summary.meta(),
    summary.meta(), trimfill.meta(), trimfill.default(),
    update.meta():
     - new argument pscale

* labbe.metabin(), labbe.default():
  - transformed event probabilites can be plotted, e.g., log odds
      event probabilities for odds ratio as summary measure (see
      argument backtransf)
  - line for null effect added by default (see arguments nulleffect,
      lwd.nulleffect, col.nulleffect)

* metabin(), metainc(), metaprop():
  - use predict.rma() from **metafor** package to calculate prediction
    interval for GLMM method
  - print note for GLMM method that continuity correction is only used
    to calculate individual study results
    
* Help pages updated:
    labbe.metabin(), labbe.default(), forest.meta(), metabin(),
    metacont(), metacor(), metagen(), metainc(), metaprop(),
    print.meta(), print.summary.meta(), summary.meta(),
    trimfill.meta(), trimfill.default(), update.meta()

### Internal changes

* New function bylabel() to print subgroup labels

* update.meta():
     - do not consider columns 'n.e' and 'n.c' as sample sizes for
       metagen or metainc object if not used in original call of
       metagen() or metainc()

* catmeth(), xlab():
     - new argument pscale

* catmeth():
     - for GLMM, print information that continuity correction is only
       used to calculate individual study results

* metacum(), metainf():
  - list object pscale added

* metabin():
  - list objects incr.e and incr.c contains zeros for Peto method
  - print warning that no continuity correction is used for Peto
      method if any of the following arguments is used: incr, allincr,
      addincr, allstudies

* metacr():
  - keep dataset used to conduct meta-analysis in list object data

* paulemandel():
  - bug fix such that function does not result in an error if used
      with a single study

* settings.meta():
  - bug fix such that use of argument method.tau works as expected


## meta, version 4.4-1 (2016-06-20)

### User-visible changes

* metareg(), update.meta():
  - bug fix such that use of these functions with metaprop objects
      using argument method = "GLMM" does not result in an error


## meta, version 4.4-0 (2016-05-13)

### Major changes

* Generalised linear mixed models (GLMMs) implemented by internal call
  of rma.glmm() from R package **metafor** by Wolfgang Viechtbauer

* R packages **lme4**, **numDeriv**, and **BiasedUrn** added to
  suggested packages which are required by rma.glmm()

* Print layout (especially number of printed digits) slightly modified
  which impacts output from print.meta(), print.summary.meta(), and
  forest.meta()

* New arguments to change number of digits in printouts and forest
    plots

### User-visible changes

* metabin(), metainc(), metaprop():
  - extension for meta-analysis based on GLMM; see method argument
      and model.glmm argument (not used in metaprop function)
  - new argument ... to provide additional arguments to rma.glmm()
  - some arguments can be used for other meta-analysis methods than
      inverse variance method:
      method.tau, hakn, tau.common(*), TE.tau(*), tau.preset(*)
      (*) not considered for GLMMs

* metabin():
  - do not print warning that inverse variance instead of
      Mantel-Haenszel method is used for analysis of a single study
  - print warning if continuity correction (arguments incr, allincr,
      addincr, allstudies) is used with arcsine difference, Peto
      method, or GLMM
  - check whether R package **BiasedUrn** is installed for conditional
    hypergeometric-normal GLMM (method = "GLMM", model.glmm = "CM.EL")

* forest.meta():
  - extension to plot meta-analysis based on GLMM
  - labels argument can be used instead of label argument to change
      labels on x-axis (axis() uses labels argument)

* funnel.meta():
  - print default labels on y-axis with capital first letter

* metareg() and update.meta():
  - extension for meta-analysis based on GLMM

* print.meta():
  - new arguments to control printing:
      digits.se, digits.zval, digits.Q, digits.tau2, digits.H,
      digits.I2, digits.prop, digits.weight
  - argument ... passed on to internal call of print.summary.meta()

* print.summary.meta():
  - new arguments to control printing:
      digits.zval, digits.Q, digits.tau2, digits.H, digits.I2
  - print "--" for missing z-value instead of "NA"
  - only print confidence interval for H and I2 if lower and upper
      limits are not NA
  - print Wald-type and Likelihood-Ratio heterogeneity test for GLMMs

* settings.meta():
  - new arguments:
      model.glmm, digits, digits.se, digits.zval, digits.Q,
      digits.tau2, digits.H, digits.I2, digits.prop, digits.weight,
      digits.pval, digits.pval.Q
  - check whether R package **metafor** is installed for specific
    values of argument method.tau
  - check whether R packages required for GLMMs are available (if
    method = "GLMM"): **metafor**, **lme4**, **numDeriv**

* Help pages updated:
    metabin(), metainc(), metaprop(), metareg(), forest(),
    print.meta(), print.summary.meta(), settings.meta(), update.meta()

### Internal changes

* New function:
  - format.NA() to print other text than "NA" for missing values
  
* metagen():
  - only call paulemandel() if heterogeneity statistic Q is larger
      equal than number of studies minus 1
      (otherwise between-study heterogeneity tau-squared is set equal to 0)

* New list elements:
  - model.glmm, .glmm.fixed, .glmm.random, version.metafor in
      metabin(), metainc(), metaprop()
  - doublezeros in metabin() - only for odds ratio and risk ratio
  - allstudies, doublezeros, model.glmm, .glmm.fixed, .glmm.random,
      version.metafor in summary.meta()

* meta-internal():
  - set defaults for new arguments: model.glmm, digits, digits.se,
      digits.zval, digits.Q, digits.tau2, digits.H, digits.I2,
      digits.prop, digits.weight, digits.pval, and digits.pval.Q
       
* paulemandel():  
  - more sensible warning if maximum number of iterations is reached
  - maximum number of iterations increased from 25 to 100

* format.p():
  - print trailing zeros

* catmeth():
  - print information for GLMMs
  - print information whether studies with double zeros are included
      in meta-analysis

* is.installed.package():
  - new arguments for more flexible error and warning messages:
      func, argument, value, chksettings


## meta, version 4.3-2 (2015-12-02)

* Function metacont:
  - bug fix such that correct treatment estimates for individual studies
  are calculated for Glass's delta (i.e. arguments sm = "SMD" and
  method.smd = "Glass")

* Function metaprop:
  - print correct error message if number of events is larger than
  number of observations


## meta, version 4.3-1 (2015-11-13)

* Function forest.meta:
  - new arguments 'digits.se', 'digits.tau2', 'digits.pval',
  'digits.pval.Q', 'digits.Q', 'digits.I2' to control printing of
  standard errors, p-values, tau-squared and heterogeneity statistics
  - new arguments 'test.overall' and 'test.subgroup' controlling whether
  information on test for overall effect and heterogeneity should be
  printed

* Internal function paulemandel:
  - bug fix such that studies with missing treatment effect and standard
  error get zero weight in random effects meta-analysis
  - do not stop estimation algorithm if estimated tau-squared is
  negative

* Function settings.meta:
  - bug fix such that no error occurs if function is used with an
  unassigned argument

* Internal functions format.p and format.tau:
  - new argument 'digits' to round p-values and tau-squared values

* Internal functions chkchar, chkclass, chklength, chklevel, chklogical,
chkmiss, chknull, chknumeric, setchar:
  - new argument 'name' to change name of checked argument in printout

* Help page of R function forest.meta updated


## meta, version 4.3-0 (2015-07-02)

* Functions metabin, metainc, and metaprop:
  - missing values are allowed in numbers of events or patients
  (studies with missing values get zero weight in meta-analysis)

* Function forest.meta:
  - print information on test for overall effect (see arguments
  'test.overall.fixed' and 'test.overall.random')  
  - print information on test for subgroup differences in meta-analysis
  with subgroups (see arguments 'test.subgroup.fixed' and
  'test.subgroup.random')
  - new argument 'layout' to change the layout of the forest plot
  - argument 'lab.NA' considered for all columns in forest plot
  (e.g. numbers of events and patients for metabin objects)
  - new argument 'lab.NA.effect' to label NAs in individual treatment
  estimates and confidence intervals
  - bug fix such that no error occurs if random effects estimate is
  missing

* Function metareg:
  - additional arguments implemented (hakn, level.comb, intercept)
  - argument '...' is no longer ignored but passed on to R function
  rma.uni (e.g., to control the iterative estimation process)
  - bug fix such that a fixed effect meta-regression can be conducted
  (argument method.tau="FE")

* Function metabin:
  - use Inverse Variance instead of Mantel-Haenszel method if only a
  single study has a non-missing treatment estimate or standard error

* Functions settings.meta and meta-internal:
  - code added for new arguments in forest.meta function to print
  information on tests

* Help pages:
  - help page of R functions metareg and forest.meta updated
  - link to RevMan webpage updated


## meta, version 4.2-0 (2015-05-08)

* Copyright changed (new names for Institute and Medical Center)

* Function metacont:
  - new argument 'exact.smd' to implement exact formulae for Hedges' g
  and Cohen's d (White and Thomas (2005; Hedges, 1981)
  - use formula from Borenstein et al. (2009) to calculate standard
  error for Cohen's d

* Function forest.meta:
  - bug fix such that additional columns used in arguments leftcols and
  rightcols are sorted appropriately if argument sortvar is not
  missing
  - prediction interval can be printed if random effects estimate is not
  shown
  - new argument print.I2.ci to print confidence intervals for I-squared

* Function print.meta and print.summary.meta:
  - prediction interval can be printed if random effects estimate is not
  shown

* Functions settings.meta, meta-internal, catmeth and update.meta:
  - code added for new argument 'exact.smd' in metacont function

* Functions ci and kentau:
  - calculate p-values without floating point number representation
  problems, e.g. the command ci(9, 1) does not result in a p-value
  of 0 but 2.257177e-19

* Several help pages updated
  - reflect changes in metacont function
  - updated RevMan 5 reference


## meta, version 4.1-0 (2015-02-04)

* Title of R package changed

* Function metacont:
  - new argument 'method.smd' to implement Cohen's d
  (method.smd="Cohen") and Glass' delta (method.smd="Glass") as
  additional effect measures for the standardised mean difference
  (sm="SMD")
  - new argument 'sd.glass' to choose the denominator for Glass' delta

* Function update.meta:
  - new arguments 'method.smd' and 'sd.glass' added

* Function summary.meta:
  - information for new arguments 'method.smd' and 'sd.glass' added to
  summary.meta object

* Functions settings.meta and meta-internal:
  - code added for new arguments 'method.smd' and 'sd.glass' in metacont
  function

* Function forest.meta:
  - bug fix such that using this function with a metaprop object and
  subgroups will not result in staggered point estimates

* Function metagen:
  - bug fix such that studies with missing treatment effect (argument
  TE) but available standard error (argument seTE) get zero weight in
  meta-analysis

* Function paulemandel (used internally):
  - only consider studies without missing treatment effect (argument TE)
  and standard error (argument seTE) in calculation of between-study
  variance tau-squared

* Function chklevel (used internally):
  - print meaningful error message if confidence limit is outside the
  range (0, 1)

* Function catmeth (used internally):
  - print information on method to estimate the standardised mean
  difference used in metacont function

* Help pages of metacont and update.meta functions updated


## meta, version 4.0-3 (2015-01-06)

* Function metabin:
  - bug fix such that printing an R object created using the
  Mantel-Haenszel and Peto method does not result in an error if any
  study has zero events in both groups


## meta, version 4.0-2 (2014-12-06)

* Function metabin:
  - bug fix such that use of Peto method does not result in an error
  - argument 'sm="ASD"' for arcsine difference instead of 'sm="AS"'
  (abbreviations 'sm="AS"' and 'sm="A"' can be used as well)

* Functions metabin, metacont, metacor, metagen, metainc, and metaprop:
  - Weights w.random.w are calculated from random effects meta-analysis
  ignoring subgroup membership (internally used function subgroup
  changed accordingly)
  - for subgroup analysis, argument 'tau.common' is set to TRUE if
  argument tau.preset is not NULL


## meta, version 4.0-1 (2014-11-19)

* Function forest.meta:
  - bug fix such that function can be used with subgroups and additional
  columns (arguments leftcols and rightcols)


## meta, version 4.0-0 (2014-11-19)

### Major revision

This update has been declared as major revision as R code to conduct
subgroup analyses has been moved from R functions summary.meta and
forest.meta to R functions metabin, metacont, metacor, metagen,
metainc, and metaprop. Accordingly, an R object generated with these
functions contains all results from subgroup analyses (see
corresponding help pages).

In the case of subgroups, the overall treatment effect in fixed effect
and random effects meta-analysis ignores subgroup membership. See
Borenstein et al. (2011), Introduction to Meta-Analysis, Wiley,
Chapter 19, "Obtaining an overall effect in the presence of subgroups,
Option 3.

Furthermore, several checks of function arguments have been implented
in version 4.0-0 of meta.

### Details

* Function addvar has been removed from R package **meta** (remaining
  functionality provided by forest.meta function)

* Function forest.meta:
  - new meaning for argument 'just' which determines the justification
  of all columns but study labels (argument 'just.studlab') and
  columns added to the forest plot (argument 'just.addcols')
  - new argument 'just.addcols' to change justification
  of text in additional columns
  - new arguments 'text.I2' and 'text.tau2'
  - for metaprop objects, values "n" and "event" handled as standard
  columns in argument 'rightcols' and 'leftcols', i.e. justification
  is determined by argument 'just.cols'
  - subgroup results printed with the same polygon height as overall
  results, i.e. percentage weight is not considered to determine
  polygon height for subgroups

* Function bubble.metareg:
  - bug fix such that bubble plot is generated for meta-regression
  objects without intercept
  - bug fix such that use of function does not result in an error for
  some effect measures, e.g. sm="RR", "OR", or "HR"

* New R functions (used internally):
  - subgroup, hetcalc
  - updateversion
  - bylevs, byvarname
  - chkchar, chkclass, chklength, chklevel, chklogical, chkmetafor
  chkmiss, chknull, chknumeric
  - int2num, npn
  - setchar, setstudlab

* Functions format.p, format.tau, catmeth, and print.summary.meta:
  - consider settings for option 'OutDec' (character used as decimal
  point in output conversions), e.g. options(OutDec=",") will print
  "1,0" instead of "1.0"

* Functions print.summary.meta:
  - remove code for R objects created with version 2.0-0 or lower of
    **meta**
  - print 'p-value' instead of 'p.value'

* Functions print.meta:
  - print 'p-value' instead of 'p.value'

* Several help pages updated.


## meta, version 3.8-0 (2014-09-12)

* Functions forest.meta, funnel.default, funnel.meta, metabin, metacor,
metacr, metagen, metainc, metaprop, print.meta, print.summary.meta,
summary.meta, trimfill.default, trimfill.meta:
  - new argument 'backtransf' indicating whether effect measures should
  be back transformed

* Functions print.meta, print.summary.meta:
  - argument 'logscale' removed (replaced by argument 'backtransf')

* Functions print.summary.meta, forest.meta:
  - print prediction interval for Freeman-Tukey double arcsin
  transformation (sm="PFT", see help page on metaprop command)

* Function forest.meta:
  - consider prediction interval to calculate limits on x-axis (if
  argument 'prediction=TRUE')

* Function bubble.metareg:
  - new argument 'regline' indicating whether regression line should be
  added to plot

* Function settings.meta:
  - new argument 'print=TRUE' to print listing of all settings (function
  call without arguments does not print all settings any longer)
  - a list with previous settings can be provided (see help page)

* New functions (used internally):
  - backtransf (for back transformation of effect measures)
  - is.relative.effect (check for relative effect measures)

* File DESCRIPTION:
  - R package **grid** defined as Imports instead of Depends

* Help pages
  - updated to reflect changes in version 3.8-0


## meta, version 3.7-1 (2014-07-29)

* Function forest.meta:
  - bug fix such that lower and upper confidence interval limits will be
  sorted correctly if argument 'sortvar' is used (this bug has been
  introduced in version 3.7-0 of meta)
  - argument 'sortvar' works without reference to meta-analysis
    object, e.g. command forest(meta1, sortvar=TE) can be used instead
    of forest(meta1, sortvar=m1$TE) - see help page for examples.

* Help page of forest.meta function:
  - examples using argument 'sortvar' added


## meta, version 3.7-0 (2014-07-11)

* Function metaprop:
  - new argument 'method.ci' to implement various methods to calculate
  confidence intervals for individual studies
  (default: Clopper-Pearson method which is also called 'exact'
  binomial method)
  - list elements zval.fixed, pval.fixed, zval.random, pval.random set
  to NA

* New functions:
  - ciWilsonScore      (used internally in metaprop function)
  - ciAgrestiCoull     (used internally in metaprop function)
  - ciSimpleAsymptotic (used internally in metaprop function)
  - estimate.missing (used internally in trimfill.default and
  trimfill.meta; so far function was defined in both trimfill
  functions)

* Function metacont:
  - new argument 'pooledvar' to conduct meta-analysis of mean
  differences (sm="MD") based on pooled variance for individual
  studies

* Function update.meta:
  - function can be used to upgrade R objects created with older
    versions of **meta**, i.e. all versions between 0.5 and 3.6-0
  - extended to objects of the following classes:
  - trimfill (fully functional)
  - metacum (only upgrade to current version of meta)
  - metainf (only upgrade to current version of meta)
  - new arguments:
  - method.ci (for metaprop objects)
  - pooledvar (for metacont objects)
  - left (for trimfill objects)
  - ma.fixed (for trimfill objects)
  - type (for trimfill objects)
  - n.iter.max (for trimfill objects)
  - new list element 'call.object', i.e call used to generate object
  used as input to update.meta function

* Function as.data.frame.meta, baujat.meta, forest.meta, funnel.meta,
labbe.metabin, metacum, metainf, print.meta, summary.meta,
trimfill.meta:
  - call update.meta function for meta-analysis objects created with
    older **meta** packages (version < 3.7)

* Functions metabin, metacont, metacor, metagen, metainc, metaprop,
trimfill.default, trimfill.meta:
  - new list elements: lower, upper, zval, pval (i.e. calculate
   confidence limits as well as z- and p-values for individual
   studies)

* Function print.meta and print.summary.meta:
  - print information on method used for confidence intervals of
  individual studies for metaprop objects

* Functions metacum and metainf:
  - add calculations for metainc objects
  - new list element 'call' with function call
  - consider argument 'pooledvar' for metacont objects

* Functions metabin, metacont, metacor, metagen, metainc, metaprop:
  - study labels will only be converted to characters for factor
  variables

* Help pages
  - updated to reflect changes in version 3.7-0
  - argument tau.preset correctly described as the _square-root_ of
  the between-study variance


## meta, version 3.6.0 (2013-05-27)

* New functions:
  - baujat and baujat.meta
  (Baujat plot to explore heterogeneity in meta-analysis)
  - bubble and bubble.metareg
  (bubble plot to display the result of a meta-regression)

* Function metareg:
  - class 'metareg' added
  - new list element .meta which is a list with information on
  meta-analysis object used in function call

* Function update.meta:
  - argument 'studlab' fully functional
  (I missed this argument in version 3.2-0)

* Function print.meta:
  - print study label for a single study in meta-analysis if argument
  'details=TRUE'
  (internally function data.frame instead of cbind used)

* New function is.installed.package (used internally)
  - replacement for function is.installed.metafor

* Help pages datasets amlodipine and cisapride:
  - execute examples for Hartung-Knapp method

* Help pages merged for the following commands:
  - forest and forest.meta
  - funnel and funnel.meta
  - labbe and labbe.metabin
  - metabias and metabias.meta
  - trimfill and trimfill.meta


## meta, version 3.5-1 (2014-05-14)

* Function metabin:
  - Inverse variance method used instead of Mantel-Haenszel method if
  argument 'tau.common' is TRUE

* Function metareg:
  - tilde sign not necessary in argument 'formula' to make this function
  more user friendly

* Function forest.meta:
  - print common tau-squared for subgroups if argument tau.common is
  TRUE in meta-analysis object

* Function metagen:
  - arguments 'n.e' and 'n.c' can be part of the dataset provided in
  argument 'data'
  - DerSimonian-Laird method used instead of Paule-Mandel method if
  argument 'tau.common' is TRUE

* Functions metacor, metainc, and metaprop:
  - arguments title, complab, and outclab part of R object

* Some help pages (slightly) updated.


## meta, version 3.5-0 (2014-04-19)

* New R function settings.meta to define and print default settings
  for meta-analyses in R package **meta**

* Function metagen:
  - Hartung and Knapp method added (previously the rma.uni function
    from R package **metafor** has been called for this method)
  - Paule-Mandel method to estimate between-study variance implemented
    using new internal function paulemandel which is based on R
    function mpaule.default from R package **metRology** from
    S.L.R. Ellison <s.ellison at lgc.co.uk> (Author of R function
    mpaule.default is S. Cowen <simon.cowen at lgc.co.uk> with
    amendments by S.L.R. Ellison)

* Function metacont:
  - studies with missing treatment estimate get zero weight in
  meta-analysis

* Functions metabin, metacont, metacor, metacr, metagen, metainc, metaprop:
  - default values changed according to R function settings.meta

* Function metareg:
  - use argument method.tau="REML" if this argument is equal to "PM" for
  meta-analysis object

* Several help pages updated.


## meta, version 3.2-1 (2014-03-26)

* Function forest.meta:
  - bug fix such that correct confidence limits for individual studies
  will be printed if argument 'level' in function metabin etc. is not
  equal to the default 0.95. (this bug has been introduced in version
  3.0-0 of meta)


## meta, version 3.2-0 (2014-03-12)

* Functions metabin, metacont, metacor, metagen, metainc, metaprop:
  - heterogeneity statistics I-squared and H added to R object
  - column names changed in list object data (columns starting with a
  "." are used internally in update.meta function)
  - internally, string "byvar" is used as default label for grouping
  variable if argument bylab is not provided.

* Function metareg:
  - internally variable .byvar used instead of byvar to reflect change
  in list object data (see above)

* Function update.meta:
  - arguments 'byvar' and 'subset' fully functional
  - internally variables .TE (etc) used instead of TE (etc) to reflect
    change in list object data (see above)

* Functions trimfill.default and trimfill.meta:
  - heterogeneity statistics I-squared and H added to R object

* Function metagen:
  - bug fix such that weights (w.fixed, w.random) are calculated
    correctly if any standard error is missing or zero for
    Hartung-Knapp method (argument hakn=TRUE) or not using the
    DerSimonian Laird method (argument method.tau not equal to "DL")

* Function summary.meta:
  - implement subgroup analysis for metainc objects
  - only (re)calculate heterogeneity statistics (Q, tau-squared,
    I-squared) for R objects generated with older versions of R
    package **meta**

* Function forest.meta:
  - groups will not be sorted automatically in alphabetical order (new
    argument 'bysort'). Use argument bysort=FALSE, in order to get the
    old behaviour of forest.meta function.
  - only (re)calculate heterogeneity statistics (Q, tau-squared,
    I-squared) for R objects generated with older versions of R
    package **meta**

* Function catmeth (used internally)
  - new argument 'tau.preset' to print information if between-study
    variance was pre-specified

* Function print.meta and print.summary.meta
  - argument 'tau.preset' used in call to function catmeth

* New internally used functions isquared and calcH

* Some help pages updated


## meta, version 3.1-2 (2013-12-01)

* Function forest.meta:
  - bug fix such that forest plot with subgroups will not result in an
    error for any meta-analysis object besides metaprop objects (this
    bug has been introduced in version 3.1-1 of **meta**)


## meta, version 3.1-1 (2013-11-19)

* Function forest.meta:
  - bug fix such that random effects estimate will be printed for
    subgroups for metaprop objects using summary measure "PFT"


## meta, version 3.1-0 (2013-11-11)

* New R function metainc (meta-analysis of incidence rates)

* Continuity correction:
  - R functions metabin and metaprop do no longer print a warning in
    case of studies with a zero cell frequency
  - instead information on continuity correction is given under
    "Details on meta-analytical method" if a corresponding
    meta-analysis object is printed

* Functions forest.meta, funnel.default, funnel.meta, print.meta,
print.summary.meta, update.meta, catmeth, xlab:
  - modified to properly handle R objects of class "metainc"

* Function metaprop:
  - use correct variable names for 'event' and 'n' in list object data
  if R function metaprop is called without argument data

* Function metabin:
  - inverse variance method (argument sm="Inverse") is used
  automatically if argument tau.common is TRUE
  - bug fix such that call of R function metabin will not result in an
  error if argument tau.common is TRUE and method is equal to "MH"
  (Mantel-Haenszel method)

* Function catmeth (used internally in R function print.summmary.meta):
  - print information on continuity correction for objects of class
  metabin, metaprop, and metainc

* Function summary.meta:
  - modified such that fixed effect and random effects estimates and
    confidence intervals are only (re)calculated for very old versions
    of R package **meta** (version number < 2.x-x) if argument
    level.comb has not been used

* Functions trimfill.meta and trimfill.default:
  - new list components lower.fixed, upper.fixed, zval.fixed,
    pval.fixed, lower.random, upper.random, zval.random, pval.random
    added to trimfill R object (should/could have been part of
    exported list since **meta**, version 2.0-0)

* New datasets smoking and lungcancer (example datasets for R function metainc)


## meta, version 3.0-1 (2013-09-17)

### Major revision

This update has been declared as major revision as the user interface
has been changed by dropping arguments for the following functions:
  - print.meta (arguments level, level.comb, level.prediction removed)
  - summary.meta (byvar, level, level.comb, level.prediction)
  - metainf (level.comb)
  - metacum (level.comb)
  - forest.meta (byvar, level, level.comb, level.predict)
This functionality is now provided by R function update.meta - see
help page of R function update.meta for further details.

### Details

* New function update.meta
  - update an existing meta-analysis object which was created with R
    function metabin, metacont, metagen, metaprop, or metacor

* New function cilayout
  - change layout to print confidence intervals (in printout from R
    functions print.meta, print.summary.meta, and forest.meta)

* Deprecated function plot.meta removed

* Functions metabin, metacont, metagen, metaprop, metacor:
  - code cleaning (in preparation for R function update.meta)
  - new list components:
  - data (original data(set) used in function call)
  - subset (information on subset of original data used in meta-analysis)

* Function summary.meta:
  - new list components:
  - data (original data(set) used in function call)
  - subset (information on subset of original data used in meta-analysis)

* Functions metareg:
  - argument 'data' renamed to 'x'
  - first two arguments interchanged (which is now in line with other
    R functions from R package **meta**)
  - modified such that information on grouping variable (list element
    'byvar') is utilised if argument 'formula' is missing
  - any column from original dataset (list component 'data' in metabin
    object (etc) can be used in meta-regression

* Function trimfill.meta:
  - new defaults for arguments 'comb.fixed' and 'comb.random' (by
    default only random effects estimate calculated)
  - arguments 'sm' and 'studlab' removed (values have been overwritten
    internally anyway)
  - new list components (depending on class of meta-analysis object
    used in function call):
    - event.e, event.c, event (number of events)
    - n.e, n.c, n (number of observations)
    - mean.e, mean.c, sd.e, sd.c (Mean and standard deviation)
    - cor (correlation)
    - class.x (class of meta object used in function call)

* Function trimfill.default:
  - new default for argument comb.fixed (by default only random
    effects estimate calculated)

* Function metacr:
  - new list components for Peto O-E method:
  - event.e, n.e, event.c, n.c

* Function metaprop:
  - new list component incr.event

* Function forest.meta:
  - bug fix such that call of forest.meta function will not result in an
  error in the following setting: (i) effect measure is equal to RR,
  OR, or HR and (ii) argument label is not a logical value.

* Function print.summary.meta:
  - modified such that "0" instead of "< 0.0001" is printed if
  between-study heterogeneity tau-squared is equal to 0

* New function format.tau (used internally):
  - print "0" instead of "< 0.0001" if tau-squared is zero

* Function p.ci (used internally):
  - new arguments bracket.left, separator, bracket.right for more
  flexible layouts to print confidence intervals (see also R function
  cilayout)

* Several help pages updated.


## meta, version 2.5-1 (2013-08-09)

* Function forest.meta:
  - new argument just.studlab to change justification of study labels

* Function print.meta:
  - print correct information on method to calculate approximate
  confidence interval for 'metaprop' objects with a single study

* Function trimfill.meta:
  - new list components title, complab, outclab, label.e, label.c,
    label.left, label.right which are utilised in other R functions to
    enhance printout (see information on version 2.0-0 of R package
    **meta**)


## meta, version 2.5-0 (2013-07-25)

* Function metacr:
  - new arguments prediction and level.predict (prediction interval
    for a new study)
  - new argument tau.common (common tau-squared across subgroups)
  - new arguments level and level.comb (confidence interval for single
    study / meta-analysis)

* Functions trimfill.meta and trimfill.default:
  - new arguments prediction and level.predict
  (prediction interval for a new study)

* Function forest.meta:
  - modified such that heterogeneity statistics are only printed in
  forest plot if results for fixed effect and/or random effects model
  are plotted (new defaults for arguments print.I2, print.tau2, and
  print.pval.Q)

* Functions metagen, metabin, metacont, metaprop, metacor:
  - modified such that list components comb.fixed, comb.random, and
  prediction are set to FALSE for a single study
  (no meta-analysis for a single study)

* Functions print.meta, print.summary.meta:
  - new argument logscale which can be used to print results for summary
  measures 'RR', 'OR', 'HR', or 'PLN' on logarithmic scale

* Several help pages updated


## meta, version 2.4-1 (2013-06-20)

* Function metaprop:
  - bug fix such that call of forest.meta function with metaprop object
  does not result in an error (bug was introduced in version 2.4-0 of
  meta)
  - new list components incr, allincr, addincr added to metaprop R
    object (should have been part of exported list since **meta**,
    version 1.5-0)

* Function print.meta:
  - new arguments prediction and level.predict to print prediction
  interval for a new study

* Function print.summary.meta:
  - call of internal function asin2p using argument warn to only print
  warnings if result for fixed effect, random effects model or
  prediction interval are printed

* Function forest.meta:
  - call of internal function asin2p using argument warn to only print
  warnings if result for fixed effect, random effects model or
  prediction interval are plotted

* Function asin2p (used internally for metaprop objects):
  - new argument warn to only print a warning in certain situations
  (see comments on functions print.meta and forest.meta)

* Help pages metabin, metacont, metacor, metacr, metagen, metaprop:
  - example to generate forest plot added


## meta, version 2.4-0 (2013-06-17)

* Functions metagen, metabin, metacont, metaprop, metacor:
  - new arguments prediction and level.predict
  (prediction interval for a new study)
  - new argument tau.common (common tau-squared across subgroups)
  - help pages updated accordingly

* Function metaprop:
  - new default summary measure (sm="PLOGIT")
  - argument freeman.tukey removed

* Function summary.meta:
  - new arguments prediction and level.predict
  (prediction interval for a new study)
  - new list component tau.common considered internally (for objects of
  type metagen, metabin, metacont, metaprop, metacor)
  - modified such that correct values for list components incr, allincr,
  and addincr of metaprop object are considered in calculations

* Function forest.meta:
  - modified such that prediction interval can be plotted
  (new arguments: prediction, level.predict, text.predict,
   col.predict, col.predict.lines, fs.predict, fs.predict.labels,
   ff.predict, ff.predict.labels)
  - modified such that correct values for list components incr, allincr,
  and addincr of metaprop object are considered in calculations
  - modified such that information on confidence limits is printed for
  pooled estimates if CI level is different from CI level for
  individual studies

* Function print.summary.meta:
  - modified such that a prediction interval is printed if argument
  prediction is TRUE
  - new list component tau.common considered internally (for objects of
  type metagen, metabin, metacont, metaprop, metacor)

* Function catmeth (only used internally):
  - print information if common tau-squared assumed across
  subgroups (argument tau.common)


## meta, version 2.3-0 (2013-05-12)

* Function forest.meta:
  - modified such that fixed effect and random effects estimates and
    confidence intervals are only (re)calculated for very old versions
    of R package **meta** (version number < 2.x-x)

* Functions metabin:
  - bug fix such that function call with arguments sm="RR" and
    allstudies=TRUE does not result in an error in meta-analyses with
    zero events in both groups


## meta, version 2.2-1 (2013-03-20)

* Function forest.meta:
  - new argument lab.NA (default: lab.NA=".") to label NAs (in older
    version of R package **meta** the fixed label 'NA' was used)
  - modified such that arguments colgap.forest.left and
    colgap.forest.right are considered (instead of only colgap.forest)

* Functions labbe.metabin and labbe.default:
  - bug fix such that function call does not result in an error if any
  event probability is equal to NA

* Function format.p (only used internally):
  - bug fix such that function call does not result in an error if any
  NAs were provided in the first function argument


## meta, version 2.2-0 (2013-03-12)

* Function metabin:
  - modified so that studies with all events in both groups will be
    included in meta-analysis by default (in older versions of R
    package **meta** these studies were only included if argument
    allstudies=TRUE)
  - modified so that the standard error is positive for studies with
    all events in both groups (see Hartung & Knapp (2001), Stat Med,
    equation (18))

* Function forest.meta:
  - modified so that values provided by argument xlim will be printed on
  x-axis label for relative effect measures (i.e. argument sm is equal
  to "RR", "OR", or "HR")
  - internally calculated default values for arguments smlab.pos and
  xlab.pos changed such that they will always lie within plotting
  range


## meta, version 2.1-4 (2012-11-29)

* Functions forest.meta, metacum, metainf and print.meta:
  - modified so that backtransformation of Freeman-Tukey Double arcsine
  transformation (argument sm='PFT' in function metaprop) is
  calculated correctly for objects of class 'metacum' and 'metainf'

* Function asin2p:
  - modified so that values outside the admissible range are set to the
  boundary values (i.e. results in estimated probabilities of 0 or 1).
  A warning is printed in this case.

* Help pages metacum and metainf:
  - new argument n.harmonic.mean documented


## meta, version 2.1-3 (2012-11-20)

* Function forest.meta:
  - modified so that the function works for an object of class
  'metacum' or 'metainf' and argument sm equal to 'PFT' which
  previously resulted in an error message
  'Error in if (col$range[1] <= TE.fixed & TE.fixed <= col$range[2]) ...'


## meta, version 2.1-2 (2012-10-25)

* Functions forest.meta, metacum, metainf, summary.meta:
  - modified so that the function works if argument 'method.tau' is
   different from the default which previously resulted in an error
   message
   'Error in sqrt(W) %*% X : non-conformable arguments'

* Function forest.meta:
  - argument 'byvar' uses corresponding list element from
  meta-analysis object as default


## meta, version 2.1-1 (2012-08-12)

* Function summary.meta:
  - list element 'k0' added to returned object for trim-and-fill method

* Function print.summary.meta:
  - print number of added studies for trim-and-fill method


## meta, version 2.1-0 (2012-05-18)

* Functions trimfill.meta and trimfill.default:
  - arguments hakn and method.tau added

* Functions metacum and metainf:
  - modified so that class 'trimfill' is added to object if function
  metacum or metainf is used on object of class 'trimfill'

* Function catmeth, print.meta, print.summary.meta:
  - modified so that information on use of trim-and-fill method is
  printed

* Functions metabias.meta:
  - modified so that an error message is printed if used with object of
  class 'metacum' or 'metainf'

* Functions funnel.meta:
  - modified so that an error message is printed if used with object of
  class 'metacum' or 'metainf'
  - modified so that by default different plot symbols (argument pch)
  are used with object of class 'trimfill'

* Function .onLoad:
  - modified so that version nummer of **meta** package is printed
    when library is loaded

* Help pages trimfill.meta and trimfill.default:
  - arguments hakn and method.tau documented

* Help page funnel.meta:
  - changed default for argument pch documented


## meta, version 2.0-4 (2012-05-03)

* Function metaprop:
  - modified so that variance estimate for log- and logit-transformation
  (sm="PLN" and sm="PLOGIT") is based on Pettigrew et al. (1986).

* Reference Pettigrew et al. (1986) has been added to the following help
pages:
  - metabin, metaprop


## meta, version 2.0-2 (2012-04-17)

* Function metaprop:
  - modified so that a warning is printed if any sample size (argument
  n) is smaller than 10 for Freeman-Tukey double arcsine
  transformation, i.e. sm="PFT"


## meta, version 2.0-1 (2012-04-04)

* Functions metabin, metacont, metacor, metagen, metaprop:
  - modified so that these functions can be used with arguments subset
  and byvar of different length


## meta, version 2.0-0 (2012-03-20)

### Major revision

R package **meta** linked to R package **metafor** to provide
additional statistical methods, e.g. meta-regression and other
estimates for tau-squared (REML, ...)

### Details

* New functions:
  - metareg              (meta-regression)
  - metabias             (generic method for function metabias)
  - metabias.default     (generic method for function metabias)
  - metabias.meta        (generic method for function metabias)
  - metabias.rm5         (generic method for function metabias)
  - print.rm5            (generic method for rm5-object)
  - print.summary.rm5    (generic method for rm5-object)
  - summary.rm5          (generic method for rm5-object)
  - catmeth              (function used internally)
  - crtitle              (function used internally)
  - hypergeometric       (function used internally)
  - is.installed.metafor (function used internally)
  - kentau               (function used internally)
  - linregcore           (function used internally)
  - p2logit              (function used internally)

* Functions metabin, metacont, metacor, metagen, metaprop:
  - new arguments:
  - hakn (Hartung-Knapp method)
  - method.tau (estimation method for tau-squared)
  - tau.preset (fixed value for tau)
  - TE.tau (pre-specified treatment effect to estimate tau)
  - method.bias (test for funnel plot asymmetry used in metabias)
  - label.left (Label on left side of forest plot, new argument in
                 functions metabin, metacont, and metagen)
  - label.right (Label on right side of forest plot, new argument in
                  functions metabin, metacont, and metagen)
  - warn (print warning messages, new argument in functions metacont
           and metagen)
  - new list components of returned object:
  - se.tau2 (standard error of tau-squared)
  - hakn (Hartung-Knapp method)
  - method.tau (estimation method for tau-squared)
  - tau.preset (fixed value for tau)
  - TE.tau (pre-specified treatment effect to estimate tau)
  - method.bias (test for funnel plot asymmetry used in metabias)
  - label.left (Label on left side of forst plot, new list component
                 in functions metabin, metacont, and metagen)
  - label.right (Label on right side of forst plot, new list component
     in functions metabin, metacont, and metagen)
  - argument 'warn' suppresses more warning messages if FALSE
  - function metabin: studies are excluded from meta-analysis if
   (event.e > n.e | event.c > n.c) or (n.e <= 0 | n.c <= 0) or
   (event.e < 0 | event.c < 0)

* Function metacum and metainf:
  - modified so that NULL is returned if function is used with a single
   study
  - modified so that new arguments hakn, method.tau, tau.preset,
   method.bias, label.left, label.right are considered in execution of
   the function
  - argument level removed

* Function metaprop:
  - modified so that the correct variance function 1/(n+0.5) instead of
   1/(n+1) is used for the Freeman-Tukey double arcsine transformation
   (i.e. sm="PFT") - see also news on function asin2p

* Function asin2p:
  - completely rewritten as back transformation of Freeman-Tukey
   transformed proportions was inaccurate
  - back transformation of Freeman-Tukey proportions according to
   Miller (1978) - see help page of R command metaprop

* Function print.metabias:
  - print a warning if number of studies is too small to conduct a
   test for funnel plot asymmetry (see new argument k.min)

* Function print.summary.meta:
  - new argument bylab.nchar
  - print test for subgroup differences for both fixed effect and
   random effects model
  - value 'invisible(NULL)' returned for metacum and metainf objects

* Function metacr:
  - new arguments:
  - sm (summary measure)
  - method (pooling method)
  - comb.fixed (fixed effect model)
  - comb.random (random effects model)
  - swap.events (only for binary data)
  - method.tau (estimation method for between-study variance)
  - hakn (Hartung-Knapp adjustment)
  - title (Title of Cochrane review)
  - complab (Comparison label)
  - outclab (Outcome label)
  - warn (print warning messages)
  - removed argument:
  - smother (summary measure)
  - value 'NULL' returned if no data is available for selection of
   comp.no and outcome.no

* Function read.rm5:
  - changed substantially for reading of RevMan 5.1 files

* Function summary.meta:
  - modified so that new arguments hakn, method.tau, tau.preset,
   method.bias are considered in execution of the function
  - argument 'warn' suppresses more warning messages

* Function forest.meta:
  - modified so that the treatment effect and 95% confidence interval
   is printed in the correct order for objects of class metaprop if
   argument sort or order is used
  - symmetric forest plot by default (argument xlim="s")
  - new arguments:
  - smlab, smlab.pos, fs.smlab, fflab
     (Label for summary measure - at top of figure)
  - label.right, label.left, fs.lr, ff.lr
     (Label on right and left side)
  - overall.hetstat (heterogeneity information for overall effect)

* Function funnel.default and funnel.meta:
  - modified so that arguments col.fixed and col.random are recognised

* Function metabias.default and metabias.meta:
  - new argument k.min:
   test for funnel plot asymmetry only conducted if number of studies
   in meta-analysis is larger or equal to k.min
  - new argument '...' (ignored at the moment)

* Function trimfill.default and trimfill.meta:
  - value 'invisible(NULL)' returned if number of studies is smaller
   than 3

* New datasets: amlodipine, cisapride

* File FLEISS93.MTV moved from directory data to directory extdata

* Several help pages updated

* Some new help pages added


## meta, version 1.6-1 (2010-10-28)

* Function forest.meta:
  - modified so that the number of events is printed in the
   correct order for objects of class metaprop if argument
   sort or order is used
  - modified so that transformed proportions are printed
   for individual studies in column 'TE' if function metagen
   is used with argument sm equal to either 'PLN', 'PLOGIT',
   'PAS', or 'PFT'

* Function as.data.frame.meta:
  - modified so that the function works for meta-analyses
   with six studies which previously resulted in an error message
   'Error: evaluation nested too deeply: infinite recursion ...'
  - modified so that additional arguments '...' can be passed to
   function

* Function addvar:
  - option stringsAsFactors=FALSE added to internal call of
   R function as.data.frame.meta
  - additional checks for existence of columns by.x and by.y
  - additional checks for situations with duplicate entries
   for columns by.x and by.y added

* Function print.meta:
  - modified so that back-transformed proportions are printed
   for individual studies if function metagen is used with
   argument sm equal to either 'PLN', 'PLOGIT', 'PAS', or 'PFT'

* Examples in help pages (slightly) updated:
  - read.mtv, read.rm5, metacr


## meta, version 1.6-0 (2010-06-21)

* Function forest.meta:
  - for subgroup analyses (i.e. groups defined by argument 'byvar'),
    result for both fixed effect and random effects model are printed
    (in older versions of the **meta** package only results for either
    fixed effect or random effects model could be printed)
  - new arguments text.fixed.w and text.random.w to specify label for
  estimates within subgroups
  - new arguments to change colour of several parts of the plot:
  col.i.inside.square, col.square, col.square.lines,
  col.diamond, col.diamond.fixed, col.diamond.random,
  col.diamond.lines, col.diamond.fixed.lines, col.diamond.random.lines
  - new arguments to print information on heterogeneity measures:
  print.I2, print.tau2, print.Q, print.pval.Q,
  hetstat, hetlab
  - new arguments to change fontsize and fontface of several parts
  of the plot:
  fs.heading, fs.fixed, fs.random, fs.study,
  fs.fixed.labels, fs.random.labels, fs.study.labels,
  fs.hetstat, fs.axis, fs.xlab,
  ff.heading, ff.fixed, ff.random, ff.study,
  ff.fixed.labels, ff.random.labels, ff.study.labels,
  ff.hetstat, ff.axis, ff.xlab
  - new arguments to change gap between columns
  colgap.left, colgap.right=colgap,
  colgap.forest, colgap.forest.left, colgap.forest.right
  - new argument 'just' to change justification of text for
  additional columns
  - new argument 'addspace' to print a blank line at top and
  bottom of study results
  - argument 'squaresize' supersedes argument 'boxsize'
  - new argument 'new' indicating whether a new figure should
  be printed in an existing graphics window
  (internally, the grid.newpage command is used if new=TRUE)
  - no line is printed for the fixed effect and random effects
  model if lty.fixed=NULL or lty.random=NULL, respectively
  - symmetric forest plots can be produced by setting 
  argument xlim="s"

* Function print.summary.meta:
  - new argument print.CMH indicating whether Cochran-Mantel-Haenszel
  test for overall effect should be printed (default print.CMH=FALSE)
  - For subgroup analyses (i.e. groups defined by argument 'byvar'),
  result for test of heterogeneity printed separately for fixed effect
  and random effects model

* Functions metabin and summary.meta:
  - new argument print.CMH indicating whether Cochran-Mantel-Haenszel
  test for overall effect should be printed (default print.CMH=FALSE)

* Help pages updated:
  - forest.meta, metabin, print.summary.meta, summary.meta


## meta, version 1.5-0 (2010-05-07)

* Version jump to 1.5-0 as several changes have been implemented.

* New functions:
  - metacor        (meta-analysis of correlations)
  - forest         (generic method for forest plots)
  - forest.meta    (generic method for forest plots)
  - radial         (generic method for radial plots)
  - radial.default (generic method for radial plots)
  - radial.meta    (generic method for radial plots)
  - asin2p         (function used internally)
  - logit2p        (function used internally)
  - xlab           (function used internally)
  - z2cor          (function used internally)

* Functions forest.meta:
  - new arguments (pooled.totals, pooled.events) to specify whether
   total number of observations and events should be displayed in the plot
  - new argument (pscale) to rescale proportions for objects of class metaprop
  - modified so that argument label is recognised for other
   effect measures than RR, OR, and HR
  - modified so that argument xlim is recognised for other
   effect measures than RR, OR, and HR
  - arguments rightlabs and leftlabs accept NAs for columns
   using default labels
  - modified so that significant digits are printed uniformly
  - correct sum of percentage weight is printed for random effects model
   in forest plots with subgroups
  - x limits (min,max) of the plot are defined by the width of
   confidence intervals instead of (0,1) for objects of class metaprop  

* Function metaprop:
  - implementation of additional transformations:
   log transformation, logit transformation, raw, i.e. untransformed, proportions
  - new argument sm to choose summary measure (i.e. transformation)
  - use of argument freeman.tukey is deprecated (use argument sm instead)

* Functions funnel and funnel.meta:
  - argument y removed

* Functions labbe and labbe.meta:
  - argument y removed

* Functions trimfill and trimfill.meta:
  - argument seTE removed

* Function summary.meta:
  - new list objects H.w, I2.w, Q.b.fixed and Q.b.random
   for heterogeneity statistics within subgroups

* Extension for meta-analysis of correlations:
  - forest.meta, metacum, metainf, print.meta,
  print.summary.meta, summary.meta

* Function plot.meta:
  - a warning is printed that the function is no longer maintained
   (function forest.meta should be used instead)

* New list element version with information on version number of
  **meta** package used to create an object (applies only to object
  creating functions, e.g. metabin, metabias).

* Several help pages updated

* Use file NEWS instead of ChangeLog to document changes


## meta, version 1.1-8 (2010-01-12)

* Functions summary.meta, print.summary.meta:
  - modified so that a test for subgroup differences is not calculated
    and printed for meta-analyses using the Mantel-Haenszel method for
    binary data


## meta, version 1.1-7 (2010-01-11)

* Functions metabin, metacont, metagen, metaprop:
  - modified so that a sensible default value is used for argument bylab
   if argument byvar is not missing


## meta, version 1.1-6 (2010-01-11)

* Function forest:
  - modified so that additional columns are printed in the correct order
   if argument sort or order is used


## meta, version 1.1-5 (2009-12-21)

* Function forest (incl. help page):
  - new argument digits specifying minimal number of significant digits
   for treatment estimate and its confidence interval


## meta, version 1.1-4 (2009-11-04)

* Function summary.meta:
  - modified so that results for subgroups (if byvar != NULL)
   are calculated for both fixed effect and random effects model:
   * list 'within' no longer returned by function summary.meta
   * lists 'within.fixed' and 'within.random' returned by
     function summary.meta
  - modified so that variable name of subgroups is printed
   correctly
  - check whether input is an object of class summary.meta

* Function print.summary.meta:
  - modified so that a warning is printed if both comb.fixed and
   comb.random are TRUE and results for subgroups are supposed to
   be printed

* Help pages of functions print.summary.meta and forest updated:
  - detailed information on printing and plotting of subgroup
   results if both comb.fixed and comb.random are TRUE

* Help page of function metagen updated:
  - new example with meta-analysis of survival data


## meta, version 1.1-3 (2009-10-30)

* New functions trimfill, trimfill.default and trimfill.meta:
  - generic method for trim-and-fill method


## meta, version 1.1-2 (2009-10-09)

* New functions labbe, labbe.default, labbe.metabin:
  - produce L'Abbe plots

* New functions funnel, funnel.default and funnel.meta:
  - generic method for funnel plots

* Functions funnel.default and funnel.meta:
  - modified so that contour-enhanced funnel plots can be produced
   (new arguments: contour.levels, col.contour, ref)
  - modified so that study labels can be printed on funnel plot
   (new arguments: studlab, cex.studlab)
  - modified so that line type, width and colour can be changed for
   fixed effect treatment effect
   (new arguments: lty.fixed, lwd.fixed, col.fixed)
  - modified so that random effects treatment effect can be plotted
   (new arguments: comb.random, lty.random, lwd.random, col.random)
  - new default values for arguments:
   * pch=21 (previously: pch=1)
   * comb.fixed=x$comb.fixed
  - modified so that background colour of points in funnel plot can
   be changed
   (new argument: bg)

* Function forest:
  - new default values for arguments lab.e and lab.c: x$label.e and
   x$label.c, respectively. If these values are NULL the old default
   values "Experimental" and "Control" are used.

* Functions metabin, metacont, metagen:
  - arguments label.e and label.c added

* Function metacr:
  - use arguments label.e and label.c in calls to functions
   metabin, metacont, metagen


## meta, version 1.0-6 (2009-08-31)

*  First major version released on CRAN (no ChangeLog available)

* Older versions (without ChangeLog):

  - meta, version 0.9-19 (2009-04-09)

  - meta, version 0.9-18 (2009-03-03)

  - meta, version 0.9-17 (2009-01-28)

  - meta, version 0.9-15 (2008-12-08)

  - meta, version 0.8-2 (2007-02-13)

  - meta, version 0.81 (2006-11-29)

  - meta, version 0.8 (2006-11-24)

  - First CRAN release (2006-02-08)

  - meta, version 0.5-0 (2005-02-23)
