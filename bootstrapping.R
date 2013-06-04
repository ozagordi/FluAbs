bs_AIC <- function(ab_data, strain, k=200){
  ab_data_2 <- ab_data[, c("age", "shot", strain)]
  n <- dim(ab_data_2)[1]
  
  # Full model
  aic_full <- rep(0, k)
  for(i in 1:k){
    boot_idx <- sample(x=n, size=n, replace=TRUE)
    boot_smp <- ab_data_2[boot_idx, ]
    fit <- glm(as.formula(paste(c(strain, "age * factor(shot)"), collapse=" ~ ")),
               data=boot_smp)
    aic_full[i] <- fit$aic
  }
  
  # No interaction model
  aic_noint <- rep(0, k)
  for(i in 1:k){
    boot_idx <- sample(x=n, size=n, replace=TRUE)
    boot_smp <- ab_data_2[boot_idx, ]
    fit <- glm(as.formula(paste(c(strain, "age + factor(shot)"), collapse=" ~ ")),
               data=boot_smp)
    aic_noint[i] <- fit$aic
  }
  
  # Age only model
  aic_age <- rep(0, k)
  for(i in 1:k){
    boot_idx <- sample(x=n, size=n, replace=TRUE)
    boot_smp <- ab_data_2[boot_idx, ]
    fit <- glm(as.formula(paste(c(strain, "age"), collapse=" ~ ")),
               data=boot_smp)
    aic_age[i] <- fit$aic
  }
  
  # Shot only model
  aic_shot <- rep(0, k)
  for(i in 1:k){
    boot_idx <- sample(x=n, size=n, replace=TRUE)
    boot_smp <- ab_data_2[boot_idx, ]
    fit <- glm(as.formula(paste(c(strain, "factor(shot)"), collapse=" ~ ")),
               data=boot_smp)
    aic_shot[i] <- fit$aic
  }
  
  aic <- data.frame(full=aic_full, noint=aic_noint, age=aic_age, shot=aic_shot)
  return(aic)
}