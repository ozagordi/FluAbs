set.seed(123)
fit_glm <- glm(H2_log ~ age, family=gaussian, subset=(shot=='Non vaccinated'),
             data=ic_data)
sc <- seg.control(K=4, it.max=35, maxit.glm=25, display=TRUE, toll=0.0001)
fit_seg_1 <- segmented(fit_glm, seg.Z=~age, psi=36, control=sc)

dtst <- davies.test(fit_glm, ~age, k=10)

fit_glm_2 <- update(fit_glm, .~., -age)
sgm <- update(fit_seg_1, .~., -age)

plot(1, type="n", axes=F, xlab="", ylab="")
sub_ab <- subset(ic_data, shot=='Non vaccinated')
plot(sub_ab$age, sub_ab$H2_log, col="#999999", pch=16, cex=1.35,
     xlab="age", ylab="titer")
plot(sgm, add=TRUE, col="#56B4E9", lwd=5.)
plot(fit_seg_1, add=TRUE, col="green", lwd=3.)
lines(sgm, term="age", col="#E69F00", lwd=4.5)
lines(fit_seg_1, term="age", col='green', lwd=3.5)
title(paste(c(strain, vac_status), sep=" "))
summary(sgm)

sub_data <- subset(ic_data, shot=='Non vaccinated')
sub_data$H2_log[is.na(sub_data$H2_log)] <- mean(sub_data$H2_log, na.rm=TRUE)
smsp <- smooth.spline(sub_data$age, sub_data$H2_log)
plot(sub_data$age, sub_data$H2_log)
lines(smsp$x, smsp$y)
