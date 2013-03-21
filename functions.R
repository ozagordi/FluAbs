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
