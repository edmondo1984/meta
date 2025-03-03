#' Amlodipine for Work Capacity
#' 
#' @description
#' Meta-analysis on the effect of amlodipine on work capacity.
#' 
#' This meta-analysis is used as a data example in Hartung and Knapp (2001).
#' 
#' @name amlodipine
#'
#' @docType data
#'
#' @format
#'
#' A data frame with the following columns:
#' \tabular{rl}{
#' \bold{\emph{study}}\tab study label \cr
#' \bold{\emph{n.amlo}}\tab number of observations in amlodipine group
#'   \cr
#' \bold{\emph{mean.amlo}}\tab estimated mean in amlodipine group \cr
#' \bold{\emph{var.amlo}}\tab variance in amlodipine group \cr
#' \bold{\emph{n.plac}}\tab number of observations in placebo group
#'   \cr
#' \bold{\emph{mean.plac}}\tab estimated mean in placebo group \cr
#' \bold{\emph{var.plac}}\tab variance in placebo group
#' }
#' 
#' @seealso \code{\link{metacont}}
#' 
#' @source
#' Hartung J & Knapp G (2001):
#' On tests of the overall treatment effect in meta-analysis with
#' normally distributed responses.
#' \emph{Statistics in Medicine},
#' \bold{20}, 1771--82
#' 
#' @keywords datasets
#' 
#' @examples
#' data(amlodipine)
#' 
#' m <- metacont(n.amlo, mean.amlo, sqrt(var.amlo), n.plac, mean.plac, sqrt(var.plac),
#'   data = amlodipine, studlab = study)
#' m.hakn <- update(m, hakn = TRUE)
#' 
#' # Same results for mean difference as in Table III in Hartung and
#' # Knapp (2001)
#' #
#' vars.fixed <- c("TE.fixed", "lower.fixed", "upper.fixed")
#' vars.random <- c("TE.random", "lower.random", "upper.random")
#' #
#' res.fixed <- as.data.frame(m[vars.fixed])
#' names(res.fixed) <- vars.random
#' #
#' res.md <- rbind(res.fixed,
#'   as.data.frame(m[vars.random]),
#'   as.data.frame(m.hakn[vars.random]))
#' #
#' res.md <- round(res.md, 5)
#' #
#' row.names(res.md) <- c("FE", "RE", "RE (HaKn)")
#' names(res.md) <- c("Absolute difference", "CI lower", "CI upper")
#' #
#' res.md


NULL
