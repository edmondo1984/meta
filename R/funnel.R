#' Funnel plot
#' 
#' @description
#' Draw a funnel plot which can be used to assess small study effects
#' in meta-analysis. A contour-enhanced funnel plot can also be
#' produced to assess causes of funnel plot asymmetry.
#' 
#' @aliases funnel funnel.meta
#' 
#' @param x An object of class \code{meta}.
#' @param xlim The x limits (min,max) of the plot.
#' @param ylim The y limits (min,max) of the plot.
#' @param xlab A label for the x-axis.
#' @param ylab A label for the y-axis.
#' @param fixed A logical indicating whether the fixed effect / common
#'   effect estimate should be plotted.
#' @param random A logical indicating whether the random effects
#'   estimate should be plotted.
#' @param axes A logical indicating whether axes should be drawn on
#'   the plot.
#' @param pch The plotting symbol used for individual studies.
#' @param text A character vector specifying the text to be used
#'   instead of plotting symbol.
#' @param cex The magnification to be used for plotting symbol.
#' @param lty.fixed Line type (fixed effect estimate).
#' @param lty.random Line type (random effects estimate).
#' @param col A vector with colour of plotting symbols.
#' @param bg A vector with background colour of plotting symbols (only
#'   used if \code{pch} in \code{21:25}).
#' @param col.fixed Colour of line representing fixed effect estimate.
#' @param col.random Colour of line representing random effects
#'   estimate.
#' @param lwd The line width for confidence intervals (if \code{level}
#'   is not \code{NULL}).
#' @param lwd.fixed The line width for fixed effect estimate (if
#'   \code{fixed} is not \code{NULL}).
#' @param lwd.random The line width for random effects estimate (if
#'   \code{random} is not \code{NULL}).
#' @param log A character string which contains \code{"x"} if the
#'   x-axis is to be logarithmic, \code{"y"} if the y-axis is to be
#'   logarithmic and \code{"xy"} or \code{"yx"} if both axes are to be
#'   logarithmic.
#' @param yaxis A character string indicating which type of weights
#'   are to be used. Either \code{"se"}, \code{"invvar"},
#'   \code{"invse"}, code{"size"}, code{"invsqrtsize"}, or
#'   code{"ess"}.
#' @param contour.levels A numeric vector specifying contour levels to
#'   produce contour-enhanced funnel plot.
#' @param col.contour Colour of contours.
#' @param ref Reference value (null effect) used to produce
#'   contour-enhanced funnel plot.
#' @param level The confidence level utilised in the plot. For the
#'   funnel plot, confidence limits are not drawn if
#'   \code{yaxis="size"} or \code{yaxis="invsqrtsize"}.
#' @param studlab A logical indicating whether study labels should be
#'   printed in the graph. A vector with study labels can also be
#'   provided (must be of same length as \code{x$TE} then).
#' @param cex.studlab Size of study labels, see argument \code{cex} in
#'   \code{\link{text}}.
#' @param pos.studlab Position of study labels, see argument
#'   \code{pos} in \code{\link{text}}.
#' @param ref.triangle A logical indicating whether approximate
#'   confidence limits should be printed around reference value (null
#'   effect).
#' @param lty.ref Line type (reference value).
#' @param lwd.ref The line width for the reference value and
#'   corresponding confidence intervals (if \code{ref.triangle} is
#'   TRUE and \code{level} is not \code{NULL}).
#' @param col.ref Colour of line representing reference value.
#' @param lty.ref.triangle Line type (confidence intervals of
#'   reference value).
#' @param backtransf A logical indicating whether results for relative
#'   summary measures (argument \code{sm} equal to \code{"OR"},
#'   \code{"RR"}, \code{"HR"}, or \code{"IRR"}) should be back
#'   transformed in funnel plots. If \code{backtransf=TRUE}, results
#'   for \code{sm="OR"} are printed as odds ratios rather than log
#'   odds ratios, for example.
#' @param \dots Additional graphical arguments (ignored at the
#'   moment).
#' 
#' @details
#' A funnel plot (Light & Pillemer, 1984) is drawn in the active
#' graphics window. If \code{fixed} is TRUE, the estimate of the fixed
#' effect model is plotted as a vertical line. Similarly, if
#' \code{random} is TRUE, the estimate of the random effects model is
#' plotted. If \code{level} is not NULL, the corresponding approximate
#' confidence limits are drawn around the fixed effect estimate (if
#' \code{fixed} is TRUE) or the random effects estimate (if
#' \code{random} is TRUE and \code{fixed} is FALSE).
#' 
#' In the funnel plot, the standard error of the treatment estimates
#' is plotted on the y-axis by default (\code{yaxis = "se"}) which is
#' likely to be the best choice (Sterne & Egger, 2001). Only exception
#' is meta-analysis of diagnostic test accuracy studies (Deeks et al.,
#' 2005) where the inverse of the square root of the \emph{effective
#' study size} is used (\code{yaxis = "ess"}). Other possible choices
#' for \code{yaxis} are \code{"invvar"} (inverse of the variance),
#' \code{"invse"} (inverse of the standard error), \code{"size"}
#' (study size), and \code{"invsqrtsize"} (1 / sqrt(study size)).
#' 
#' If argument \code{yaxis} is not equal to \code{"size"},
#' \code{"invsqrtsize"} or \code{"ess"}, contour-enhanced funnel plots
#' can be produced (Peters et al., 2008) by specifying the contour
#' levels (argument \code{contour.levels}). By default (argument
#' \code{col.contour} missing), suitable gray levels will be used to
#' distinguish the contours. Different colours can be chosen by
#' argument \code{col.contour}.
#' 
#' @author Guido Schwarzer \email{sc@@imbi.uni-freiburg.de}, Petra
#'   Graham \email{pgraham@@efs.mq.edu.au}
#' 
#' @seealso \code{\link{metabias}}, \code{\link{metabin}},
#'   \code{\link{metagen}}, \code{\link{radial}}
#' 
#' @references
#' Deeks JJ, Macaskill P, Irwig L (2005):
#' The performance of tests of publication bias and other sample size
#' effects in systematic reviews of diagnostic test accuracy was
#' assessed.
#' \emph{Journal of Clinical Epidemiology},
#' \bold{58}:882--93
#'
#' Light RJ & Pillemer DB (1984):
#' \emph{Summing Up. The Science of Reviewing Research}.
#' Cambridge: Harvard University Press
#' 
#' Peters JL, Sutton AJ, Jones DR, Abrams KR, Rushton L (2008):
#' Contour-enhanced meta-analysis funnel plots help distinguish
#' publication bias from other causes of asymmetry.
#' \emph{Journal of Clinical Epidemiology},
#' \bold{61}, 991--6
#' 
#' Sterne JAC & Egger M (2001):
#' Funnel plots for detecting bias in meta-analysis: Guidelines on
#' choice of axis.
#' \emph{Journal of Clinical Epidemiology},
#' \bold{54}, 1046--55
#' 
#' @keywords hplot
#' 
#' @examples
#' data(Olkin1995)
#' m1 <- metabin(ev.exp, n.exp, ev.cont, n.cont,
#'   data = Olkin1995, subset = c(41, 47, 51, 59),
#'   studlab = paste(author, year),
#'   sm = "RR", method = "I")
#' 
#' oldpar <- par(mfrow = c(2, 2))
#' 
#' # Standard funnel plot
#' #
#' funnel(m1)
#' 
#' # Funnel plot with confidence intervals, fixed effect estimate and
#' # contours
#' #
#' cc <- funnel(m1, fixed = TRUE,
#'              level = 0.95, contour = c(0.9, 0.95, 0.99))$col.contour
#' legend(0.05, 0.05,
#'   c("0.1 > p > 0.05", "0.05 > p > 0.01", "< 0.01"), fill = cc)
#' 
#' # Contour-enhanced funnel plot with user-chosen colours
#' #
#' funnel(m1, fixed = TRUE,
#'   level = 0.95, contour = c(0.9, 0.95, 0.99),
#'   col.contour = c("darkgreen", "green", "lightgreen"),
#'   lwd = 2, cex = 2, pch = 16, studlab = TRUE, cex.studlab = 1.25)
#' legend(0.05, 0.05,
#'   c("0.1 > p > 0.05", "0.05 > p > 0.01", "< 0.01"),
#'   fill = c("darkgreen", "green", "lightgreen"))
#' 
#' par(oldpar)
#'
#' @method funnel meta
#' @export
#' @export funnel.meta


funnel.meta <- function(x,
                        ##
                        xlim = NULL, ylim = NULL, xlab = NULL, ylab = NULL,
                        ##
                        fixed = x$fixed, random = x$random,
                        ##
                        axes = TRUE,
                        pch = if (!inherits(x, "trimfill"))
                                21 else ifelse(x$trimfill, 1, 21),
                        text = NULL, cex = 1,
                        lty.fixed = 2, lty.random = 9,
                        lwd = 1, lwd.fixed = lwd, lwd.random = lwd,
                        col = "black", bg = "darkgray",
                        col.fixed = "black", col.random = "black",
                        ##
                        log, yaxis,
                        contour.levels = NULL, col.contour,
                        ##
                        ref = ifelse(is.relative.effect(x$sm), 1, 0),
                        ##
                        level = if (fixed | random) x$level else NULL,
                        studlab = FALSE, cex.studlab = 0.8, pos.studlab = 2,
                        ##
                        ref.triangle = FALSE,
                        lty.ref = 1,
                        lwd.ref = lwd,
                        col.ref = "black",
                        lty.ref.triangle = 5,
                        ##
                        backtransf = x$backtransf,
                        ...) {
  
  
  ##
  ##
  ## (1) Check for meta object and upgrade older meta object
  ##
  ##
  chkclass(x, "meta")
  x.name <- deparse(substitute(x))
  ##
  if (inherits(x, "metacum"))
    stop("Funnel plot not meaningful for object of class \"metacum\"")
  ##
  if (inherits(x, "metainf"))
    stop("Funnel plot not meaningful for object of class \"metainf\"")
  ##
  x <- updateversion(x)
  
  
  ##
  ##
  ## (2) Check other arguments
  ##
  ##
  chklogical(fixed)
  chklogical(random)
  chklogical(axes)
  chknumeric(cex)
  chknumeric(lty.fixed)
  chknumeric(lty.random)
  chknumeric(lwd)
  chknumeric(lwd.fixed)
  chknumeric(lwd.random)
  ##
  if (missing(yaxis))
    if (inherits(x, "metabin") && x$sm == "DOR")
      yaxis <- "ess"
    else
      yaxis <- "se"
  ##
  yaxis <- setchar(yaxis, c("se", "invse", "invvar",
                            "size", "invsqrtsize", "ess"))
  ##
  if (!is.null(contour.levels))
    chklevel(contour.levels, length = 0, ci = FALSE)
  chknumeric(ref)
  if (!is.null(level))
    chklevel(level)
  chknumeric(cex.studlab)
  pos.studlab <- as.numeric(setchar(pos.studlab, as.character(1:4)))
  chklogical(ref.triangle)
  chknumeric(lty.ref)
  chknumeric(lwd.ref)
  chknumeric(lty.ref.triangle)
  chklogical(backtransf)
  
  
  ##
  ##
  ## (3) Check length of essential variables
  ##
  ##
  TE <- x$TE
  k.All <- length(TE)
  seTE <- x$seTE
  seTE[is.infinite(seTE)] <- NA
  ##
  if (is.logical(studlab))
    if (studlab) {
      slab <- TRUE
      studlab <- x$studlab
    }
    else
      slab <- FALSE
  else
    slab <- TRUE
  ##
  fun <- "funnel"
  chklength(seTE, k.All, fun)
  if (slab)
    chklength(studlab, k.All, fun)
  if (!is.null(text))
    chklength(text, k.All, fun)
  ##
  ## Exclude studies from funnel plot
  ## 
  if (!is.null(x$exclude)) {
    TE <- TE[!x$exclude]
    seTE <- seTE[!x$exclude]
    if (slab)
      studlab <- studlab[!x$exclude]
    if (!is.null(text))
      text <- text[!x$exclude]
  }
  
  
  ##
  ##
  ## (4) Further assignments
  ##
  ##
  TE.fixed <- x$TE.fixed
  TE.random <- x$TE.random
  sm <- x$sm
  ##
  if (missing(log))
    if (backtransf & is.relative.effect(sm))
      log <- "x"
    else
      log <- ""
  ##  
  if (yaxis == "se")
    seTE.min <- 0
  else
    seTE.min <- min(seTE, na.rm = TRUE)
  ##
  seTE.max <- max(seTE, na.rm = TRUE)
  ##
  if (is.relative.effect(sm))
    ref <- log(ref)
  ##
  ref.contour <- ref
  ##
  if (!is.null(level)) {
    ##
    seTE.seq <- seq(seTE.min, seTE.max, length.out = 500)
    ##
    if (random & !fixed)
      ciTE <- ci(TE.random, seTE.seq, level)
    else
      ciTE <- ci(TE.fixed, seTE.seq, level)
    ##
    ciTE.ref <- ci(ref, seTE.seq, level)
    ##
    if ((fixed | random) & ref.triangle)
      TE.xlim <- c(min(c(TE, ciTE$lower, ciTE.ref$lower),
                       na.rm = TRUE) / 1.025,
                   1.025 * max(c(TE, ciTE$upper, ciTE.ref$upper),
                               na.rm = TRUE))
    ##
    else if (ref.triangle)
      TE.xlim <- c(min(c(TE, ciTE.ref$lower), na.rm = TRUE) / 1.025,
                   1.025 * max(c(TE, ciTE.ref$upper), na.rm = TRUE))
    ##
    else
      TE.xlim <- c(min(c(TE, ciTE$lower), na.rm = TRUE) / 1.025,
                   1.025 * max(c(TE, ciTE$upper), na.rm = TRUE))
  }
  ##
  if (backtransf & is.relative.effect(sm)) {
    TE <- exp(TE)
    TE.fixed <- exp(TE.fixed)
    TE.random <- exp(TE.random)
    ref <- exp(ref)
    ##
    if (!is.null(level)) {
      ciTE$lower <- exp(ciTE$lower)
      ciTE$upper <- exp(ciTE$upper)
      ##
      ciTE.ref$lower <- exp(ciTE.ref$lower)
      ciTE.ref$upper <- exp(ciTE.ref$upper)
      ##
      TE.xlim <- exp(TE.xlim)
    }
  }
  ##
  ## y-value: weight
  ##
  if (yaxis == "se")
    weight <- seTE
  else if (yaxis == "invse")
    weight <- 1 / seTE
  else if (yaxis == "invvar")
    weight <- 1 / seTE^2
  else if (yaxis %in% c("size", "invsqrtsize")) {
    if (inherits(x, "metabin") || inherits(x, "metacont"))
      weight <- floor(x$n.e) + floor(x$n.c)
    else if (length(x$n.e) > 0 & length(x$n.c) > 0)
      weight <- floor(x$n.e) + floor(x$n.c)
    else if (inherits(x, "metaprop"))
      weight <- floor(x$n)
    else if (length(x$n) > 0)
      weight <- floor(x$n)
    else if (length(x$n.e) > 0)
      weight <- floor(x$n.e)
    else if (length(x$n.c) > 0)
      weight <- floor(x$n.c)
    else
      stop("No information on sample size available in object '",
           x.name, "'.")
  }
  else if (yaxis == "ess") {
    if (inherits(x, "metabin") || inherits(x, "metacont"))
      weight <- 4 * floor(x$n.e) * floor(x$n.c) /
        (floor(x$n.e) + floor(x$n.c))
    else if (length(x$n.e) > 0 & length(x$n.c) > 0)
      weight <- 4 * floor(x$n.e) * floor(x$n.c) /
        (floor(x$n.e) + floor(x$n.c))
    else
      stop("No information on sample size available in object '",
           x.name, "'.")
  }
  ##
  if (yaxis %in% c("invsqrtsize", "ess"))
    weight <- 1 / sqrt(weight)
  ##
  ## x-axis: labels / xlim
  ##
  if (is.null(xlab))
    if (is.relative.effect(sm))
      xlab <- xlab(sm, backtransf)
    else if (sm == "PRAW")
      xlab <- "Proportion"
    else
      xlab <- xlab(sm, FALSE)
  ##
  if (is.null(xlim) & !is.null(level) &
      (yaxis == "se" |
         yaxis == "invse" |
           yaxis == "invvar"))
    xlim <- TE.xlim
  else if (is.null(xlim))
    xlim <- range(TE, na.rm = TRUE)
  ##
  ## y-axis: labels / ylim
  ##
  if (yaxis == "se" & is.null(ylab))
    ylab <- "Standard Error"
  else if (yaxis == "invse" & is.null(ylab))
    ylab <- "Inverse of Standard Error"
  else if (yaxis == "invvar" & is.null(ylab))
    ylab <- "Inverse of Variance"
  else if (yaxis == "size" & is.null(ylab))
    ylab <- "Study Size"
  else if (yaxis == "invsqrtsize" & is.null(ylab))
    ylab <- "1 / root(Study Size)"
  else if (yaxis == "ess" & is.null(ylab))
    ylab <- "1 / root(Effective Study Size)"
  ##
  if (is.null(ylim) & yaxis %in% c("se", "invsqrtsize", "ess"))
    ylim <- c(max(weight, na.rm = TRUE), 0)
  if (is.null(ylim)) ylim <- range(weight, na.rm = TRUE)
  
  
  ##
  ##
  ## (5) Produce funnel plot
  ##
  ##
  plot(TE, weight, type = "n",
       xlim = xlim, ylim = ylim, xlab = xlab, ylab = ylab,
       axes = axes, log = log)
  ##
  ## Add contour shades (enhanced funnel plots)
  ##
  if (!is.null(contour.levels) &
      !(yaxis %in% c("size", "invsqrtsize", "ess"))) {
    ##
    if (missing(col.contour))
      if (length(contour.levels) < 2)
        col.contour <- "gray50"
      else
        col.contour <- gray(seq(0.5, 0.9, len = length(contour.levels)))
    ##
    if (length(contour.levels) != length(col.contour))
      stop("Arguments 'contour.levels' and 'col.contour' must be of ",
           "the same length.")
    ##
    seTE.cont <- seq(seTE.max, seTE.min, length.out = 500)
    ##
    j <- 0
    ##
    for (i in contour.levels) {
      ##
      j <- j + 1
      ##
      ciContour <- ci(ref.contour, seTE.cont, i)
      ##
      if (backtransf & is.relative.effect(sm)) {
        ciContour$TE    <- exp(ciContour$TE)
        ciContour$lower <- exp(ciContour$lower)
        ciContour$upper <- exp(ciContour$upper)
      }
      sel.l <- ciContour$lower > min(xlim) & ciContour$lower < max(xlim)
      sel.u <- ciContour$upper > min(xlim) & ciContour$upper < max(xlim)
      ##
      min.l <- min(ciContour$lower)
      max.l <- max(ciContour$lower)
      min.u <- min(ciContour$upper)
      max.u <- max(ciContour$upper)
      ##
      if (yaxis == "se") {
        if (max.u < min(xlim) | min.l > max(xlim)) {
          contour.u.x <- c(min(xlim), min(xlim), max(xlim), max(xlim))
          contour.u.y <- c(min(ylim), max(ylim), max(ylim), min(ylim))
          contour.l.x <- NA
          contour.l.y <- NA
        }
        else {
          contour.l.x <- c(min(xlim), min(xlim),
                           ciContour$lower[sel.l],
                           if (any(sel.l)) max(ciContour$lower[sel.l]) else NA)
          contour.l.y <- c(min(ylim), max(ylim), seTE.cont[sel.l],
                           min(ylim))
          ##
          contour.u.x <- c(max(xlim), max(xlim),
                           ciContour$upper[sel.u],
                           if (any(sel.u)) min(ciContour$upper[sel.u]) else NA)
          contour.u.y <- c(min(ylim), max(ylim), seTE.cont[sel.u],
                           min(ylim))
        }
      }
      ##
      if (yaxis == "invvar") {
        if (max.u < min(xlim) | min.l > max(xlim)) {
          contour.u.x <- c(min(xlim), min(xlim), max(xlim), max(xlim))
          contour.u.y <- c(max(ylim), min(ylim), min(ylim), max(ylim))
          contour.l.x <- NA
          contour.l.y <- NA
        }
        else {
          contour.l.x <- c(min(xlim), min(xlim),
                           ciContour$lower[sel.l],
                           if (any(sel.l)) max(ciContour$lower[sel.l]) else NA)
          contour.l.y <- c(max(ylim), min(ylim), 1 / seTE.cont[sel.l]^2,
                           max(ylim))
          ##
          contour.u.x <- c(max(xlim), max(xlim),
                           ciContour$upper[sel.u],
                           if (any(sel.u)) min(ciContour$upper[sel.u]) else NA)
          contour.u.y <- c(max(ylim), min(ylim), 1 / seTE.cont[sel.u]^2,
                           max(ylim))
        }
      }
      ##
      if (yaxis == "invse") {
        if (max.u < min(xlim) | min.l > max(xlim)) {
          contour.u.x <- c(min(xlim), min(xlim), max(xlim), max(xlim))
          contour.u.y <- c(max(ylim), min(ylim), min(ylim), max(ylim))
          contour.l.x <- NA
          contour.l.y <- NA
        }
        else {
          contour.l.x <- c(min(xlim), min(xlim),
                           ciContour$lower[sel.l],
                           if (any(sel.l)) max(ciContour$lower[sel.l]) else NA)
          contour.l.y <- c(max(ylim), min(ylim), 1 / seTE.cont[sel.l],
                           max(ylim))
          ##
          contour.u.x <- c(max(xlim), max(xlim),
                           ciContour$upper[sel.u],
                           if (any(sel.u)) min(ciContour$upper[sel.u]) else NA)
          contour.u.y <- c(max(ylim), min(ylim), 1 / seTE.cont[sel.u],
                           max(ylim))
        }
      }
      ##
      polygon(contour.l.x, contour.l.y,
              col = col.contour[j], border = FALSE)
      ##
      polygon(contour.u.x, contour.u.y,
              col = col.contour[j], border = FALSE)
    }
  }
  ##
  ## Add results for individual studies
  ##
  if (is.null(text))
    points(TE, weight, pch = pch, cex = cex, col = col, bg = bg)
  else
    text(TE, weight, labels = text, cex = cex, col = col)
  ##
  ## Add results for meta-analysis
  ##
  if (fixed)
    lines(c(TE.fixed, TE.fixed), range(ylim),
          lty = lty.fixed, lwd = lwd.fixed, col = col.fixed)
  ##
  if (random)
    lines(c(TE.random, TE.random), range(ylim),
          lty = lty.random, lwd = lwd.random, col = col.random)
  ##
  if (ref.triangle)
    lines(c(ref, ref), range(ylim),
          lty = lty.ref, lwd = lwd.ref, col = col.ref)
  ##
  ## Add approximate confidence intervals
  ##
  if (!is.null(level)) {
    if (fixed | random | !ref.triangle) {
      tlow <- ciTE$lower
      tupp <- ciTE$upper
      ##
      lty.lines <- if (random & !fixed) lty.random else lty.fixed
      lwd.lines <- if (random & !fixed) lwd.random else lwd.fixed
      col.lines <- if (random & !fixed) col.random else col.fixed
      ##
      if (yaxis == "se") {
        points(tlow, seTE.seq, type = "l", lty = lty.lines, lwd = lwd.lines,
               col = col.lines)
        points(tupp, seTE.seq, type = "l", lty = lty.lines, lwd = lwd.lines,
               col = col.lines)
      }
      else if (yaxis == "invse") {
        points(tlow, 1 / seTE.seq, type = "l",
               lty = lty.lines, lwd = lwd.lines,
               col = col.lines)
        points(tupp, 1 / seTE.seq, type = "l",
               lty = lty.lines, lwd = lwd.lines,
               col = col.lines)
      }
      else if (yaxis == "invvar") {
        points(tlow, 1 / seTE.seq^2, type = "l",
               lty = lty.lines, lwd = lwd.lines,
               col = col.lines)
        points(tupp, 1 / seTE.seq^2, type = "l",
               lty = lty.lines, lwd = lwd.lines,
               col = col.lines)
      }
    }
    ##
    if (ref.triangle) {
      tlow <- ciTE.ref$lower
      tupp <- ciTE.ref$upper
      ##
      if (yaxis == "se") {
        points(tlow, seTE.seq, type = "l", lty = lty.ref.triangle,
               lwd = lwd.ref, col = col.ref)
        points(tupp, seTE.seq, type = "l", lty = lty.ref.triangle,
               lwd = lwd.ref, col = col.ref)
      }
      else if (yaxis == "invse") {
        points(tlow, 1 / seTE.seq, type = "l", lty = lty.ref.triangle,
               lwd = lwd.ref, col = col.ref)
        points(tupp, 1 / seTE.seq, type = "l", lty = lty.ref.triangle,
               lwd = lwd.ref, col = col.ref)
      }
      else if (yaxis == "invvar") {
        points(tlow, 1 / seTE.seq^2, type = "l", lty = lty.ref.triangle,
               lwd = lwd.ref, col = col.ref)
        points(tupp, 1 / seTE.seq^2, type = "l", lty = lty.ref.triangle,
               lwd = lwd.ref, col = col.ref)
      }
    }
  }
  ##
  ## Add study labels
  ##
  if (!is.logical(studlab) && length(studlab) > 0)
    text(TE, weight, labels = studlab, pos = pos.studlab, cex = cex.studlab) 
  
  
  ##
  ##
  ## (6) Return some information on funnel plot
  ##
  ##
  res <- list(xlim = xlim, ylim = ylim)
  ##
  if (!is.null(contour.levels) &
      !(yaxis %in% c("size", "invsqrtsize", "ess")))
    res$col.contour <- col.contour
  
  
  invisible(res)
}
