library(MASS)
library(reshape)
library(ggplot2)
plot_antibody <- function(ab_data, strain){
  ab_data_2 <- ab_data[, c("donorID", "age", "shot", strain)]
  melted <- melt(ab_data_2, id=c("donorID", "age", "shot"))
  # Fit and print the summary
  novac_fit <- glm(value ~ age, data=melted, subset=(shot=='Non vaccinated'))
  print("Fit on the non vaccinated")
  print(summary(novac_fit))
  vac_fit <- glm(value ~ age, data=melted, subset=(shot=='Vaccinated'))
  print("Fit on the vaccinated")
  print(summary(vac_fit))
  # Plot with rlm smoothing, tihs should be equivalent to glm 
  p <- ggplot(data=melted, aes(x=age, y=value)) + geom_point(size=1.75)
  # robust linear model
  p <- p + geom_smooth(method = "rlm")
  p <- p + ggtitle(strain)
  p <- p + facet_grid(shot ~ .) + theme_bw()
  return(p)
}

##################

library(segmented)
segmented_analysis <- function(ab_data, strain, vac_status){
  # fit with GLM and test for a breakpoint
  fit_here <- glm(as.formula(paste(c(strain, "age"), collapse=" ~ ")),
                  family=gaussian, subset=(shot==vac_status), data=ab_data)
  dtst <- davies.test(fit_here, ~ age, k=3)
  print("Significance of the break: p-value")
  print(dtst$p.value)
  print(dtst$statistic)
  # only if breakpoint is supported, do piecewise regression and plot
  if(dtst$p.value < 0.01){
    psi_start <- max(min(ab_data$age) * 1.5, 0.9*dtst$statistic[[1]])
    sgm <- segmented(fit_here, seg.Z = ~age, psi=list(age=psi_start),
                     control=seg.control(stop.if.error=TRUE))
    plot(1, type="n", axes=F, xlab="", ylab="")
    sub_ab <- subset(ab_data, shot==vac_status)
    plot(sub_ab$age, sub_ab[[strain]], col="#999999", pch=16, cex=1.35,
         xlab="age", ylab="titer")
    plot(sgm, add=TRUE, col="#56B4E9", lwd=5.)
    lines(sgm, term="age", col="#E69F00", lwd=4.5)
    title(paste(c(strain, vac_status), sep=" "))
    summary(sgm)
  }
  else{
    plot(1, type="n", axes=F, xlab="", ylab="")
    sub_ab <- subset(ab_data, shot==vac_status)
    plot(sub_ab$age, sub_ab[[strain]], col="#999999", pch=16, cex=1.35,
         xlab="age", ylab="titer")
    abline(fit_here$coefficients, col="#56B4E9", lwd=5.)
    title(paste(c(strain, vac_status), sep=" "))
    summary(fit_here)
  }
}
#segmented_analysis(ic_data, "H2_log", "Non vaccinated")
#strain <- "H2_log"
#vac_status <- "Non vaccinated"
#ab_data <- ic_data
#segmented_analysis(ab_data, strain, "Non vaccinated")

#####

# Code to accompany the chapter "Smoothing in Nonparametric Regression"
# Cosma Rohilla Shalizi
# http://www.stat.cmu.edu/~cshalizi/uADA/13/lectures/ch04.R

# Multi-fold cross-validation for univariate kernel regression
# Inputs: vector of input feature values (x)
# vector of response values (y)
# vector of bandwidths (bandwidths)
# number of folds (num.folds)
# Calls: npreg from the np package
# Output: list with components of: best bandwidth, vector of
# cross-validated  MSEs, array of MSE for each bandwidth on each fold
cv_bws_npreg <- function(x, y, bandwidths=(1:50)/50, num.folds=10) {
  require(np)
  n = length(x)
  # Sanity-check inputs
  require(np)
  n <- length(x)
  stopifnot(n > 1, length(y) == n)
  stopifnot(length(bandwidths) > 1)
  stopifnot(num.folds > 0, num.folds==trunc(num.folds))
  
  # Make a matrix to store MSEs for each fold/bandwidth combination
  fold_MSEs <- matrix(0, nrow=num.folds, ncol=length(bandwidths))
  # Name the columns after bandwidths for easy reference later
  # coerces the numerical bandwidths into character strings
  colnames(fold_MSEs) = bandwidths
  
  # Divide the data randomly into "folds" (non-overlapping testing sets)
  # Assign each data point to one of the "folds", in order (so that size is
  # as nearly equal as possible)
  case.folds <- rep(1:num.folds, length.out=n)
  # Now randomly permute the order (see help(sample) for how this works)
  case.folds <- sample(case.folds)
  
  for (fold in 1:num.folds) {
    train.rows = which(case.folds==fold)
    # Separate training and testing sets
    x.train = x[train.rows]
    y.train = y[train.rows]
    x.test = x[-train.rows]
    y.test = y[-train.rows]
    # Cycle over bandwidths
    for (bw in bandwidths) {
      fit <- npreg(txdat=x.train, tydat=y.train,
                   exdat=x.test, eydat=y.test, bws=bw)
      # Invoking npreg this way tells it to fit on the training data (txdat,
      # tydat), but evaluate on different data (exdat, eydat)
      # See help(npreg) for more
      fold_MSEs[fold, paste(bw)] <- fit$MSE
      # Here MSE is the MSE on the evaluation data
      # paste(bw): turns numerical bandwidth to type character, so R knows
      # it's the name of a column, not a column index
    }
  }
  # Average over folds
  CV_MSEs = colMeans(fold_MSEs)
  # Find the best bandwidth
  best.bw = bandwidths[which.min(CV_MSEs)]
  return(list(best.bw=best.bw,CV_MSEs=CV_MSEs,fold_MSEs=fold_MSEs))
}

#####

plot_cv_smoothed <- function(ab_data, strain, vac_status){
  library(np)
  mask <- ab_data$shot == vac_status
  ymin <- min(ab_data[[strain]][mask], na.rm=TRUE)
  ymax <- max(ab_data[[strain]][mask], na.rm=TRUE)
  delta <- ymax - ymin
  ymin <- ymin - 0.05 * delta
  ymax <- ymax - 0.05 * delta
  bw <- npregbw(formula=as.formula(paste(c(strain, "age"), collapse=" ~ ")),
                data=ab_data, subset=ab_data$shot==vac_status)
  fit.sm <- npreg(bws=bw)
  plot(bw, plot.errors.method="bootstrap", random.seed=1234,
       col="#56B4E9", main=vac_status, ylim=c(ymin, ymax))
  points(ab_data$age[mask], ab_data[[strain]][mask],
         pch=16, cex=.75, col="#E69F00")
}
#plot_cv_smoothed(ec_data, "H1_pdm09_log", 'Non vaccinated')