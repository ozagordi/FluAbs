


## Table of contents
* [IC50](#ic50)

  [H1 Brisbane](#ic50h1brisbane) [H1 PR8](#ic50h1pr8)
  
  [H2](#ic50h2)
  
  [H3 Brisbane](#ic50h3brisbane) [H3 Hong Kong](#ic50h3hk)
  
  [H5 percent at 1st dilution](#ic50h5_dil) [H7 percent at 1st dilution](#ic50h7_dil)
  
* [EC50](#ec50)
  
  [H1 pandemic 2009](#ec50h1pdm09) [H2](#ec50h2) [H3](#ec50h3)
  
  [H4](#ec50h4) [H5](#ec50h5) [H7](#ec50h7) [H7 virus](#ec50h7vir)
  
  [H12](#ec50h12)

* [No effects](#median-and-iqr-where-no-effect-was-found)

----

Effect of seniority and vaccinations
------------------------------------
Here below we will study the combined effect of vaccinations and seniority on
antibody titers. We will perform analysis of covariance (ANCOVA) to discern the
separate and combined effect of the two regressors. The vaccination status is
treated as a categorical binary variable (vaccinated/non vaccinated), as the
self-reported number of vaccinations cannot be considered a reliable estimate,
while the age is a quantitative covariate.

We will perform ANCOVA estimates with the relation `shot*age`, meaning that the
model will try to estimate the antibody titer as a function of the vaccination
status, the age and their product. In symbols
$$
antibody = intercept + \alpha \cdot age + \beta \cdot shot + \gamma \cdot age \cdot shot
$$
which can be rewritten as
$$
antibody = intercept  + \beta \cdot shot + (\gamma \cdot shot + \alpha) \cdot age.
$$
If the $\gamma$ coefficient is significantly different from zero, it means that
the slope of the regression lines $(\gamma\cdot shot + \alpha)$ is different for
different categories of the vaccination status. We will perform the analysis by
calling `glm` which performs robust linear regression accounting for non
constant variance (a.k.a. heteroskedasticity).

A slow-paced discussion of ANCOVA can be found in this [blog post][1].

----

<a id="ic50"></a>
### IC50

<a id="ic50h1brisbane"></a>
#### H1 Brisbane: shot only
For H1 Brisbane, we remove first the interaction term and then also the age,
concluding that only the vaccinations are contributing to the antibody titer.


```
## 
## Call:
## glm(formula = H1_brisbane_log ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5414  -0.4532  -0.0748   0.4620   1.6803  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.28380    0.22607   10.10  < 2e-16 ***
## age                 0.00190    0.00616    0.31  0.75809    
## shotVaccinated      0.99266    0.29164    3.40  0.00078 ***
## age:shotVaccinated -0.01147    0.00749   -1.53  0.12706    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4203)
## 
##     Null deviance: 120.96  on 248  degrees of freedom
## Residual deviance: 102.97  on 245  degrees of freedom
##   (24 observations deleted due to missingness)
## AIC: 496.8
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_brisbane_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5023  -0.4799  -0.0828   0.4604   1.6925  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     2.55457    0.14119   18.09  < 2e-16 ***
## age            -0.00585    0.00352   -1.66    0.097 .  
## shotVaccinated  0.56757    0.08946    6.34  1.1e-09 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4226)
## 
##     Null deviance: 120.96  on 248  degrees of freedom
## Residual deviance: 103.95  on 246  degrees of freedom
##   (24 observations deleted due to missingness)
## AIC: 497.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_brisbane_log ~ shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5084  -0.5121  -0.0793   0.4696   1.7541  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.3501     0.0699    33.6  < 2e-16 ***
## shotVaccinated   0.5290     0.0867     6.1  4.1e-09 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4256)
## 
##     Null deviance: 120.96  on 248  degrees of freedom
## Residual deviance: 105.12  on 247  degrees of freedom
##   (24 observations deleted due to missingness)
## AIC: 497.9
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h1pr8"></a>
#### H1 PR8: shot only

```
## 
## Call:
## glm(formula = H1_PR8_log ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1690  -0.2956  -0.0147   0.2782   1.4335  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.83891    0.13705   20.71   <2e-16 ***
## age                 0.00254    0.00369    0.69     0.49    
## shotVaccinated      0.03979    0.17836    0.22     0.82    
## age:shotVaccinated  0.00371    0.00453    0.82     0.41    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1676)
## 
##     Null deviance: 46.370  on 258  degrees of freedom
## Residual deviance: 42.728  on 255  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 278.3
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_PR8_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1822  -0.2903  -0.0149   0.2716   1.4240  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     2.75222    0.08680   31.71   <2e-16 ***
## age             0.00499    0.00215    2.32   0.0209 *  
## shotVaccinated  0.17867    0.05449    3.28   0.0012 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1673)
## 
##     Null deviance: 46.37  on 258  degrees of freedom
## Residual deviance: 42.84  on 256  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 277
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_PR8_log ~ shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2347  -0.2573  -0.0117   0.2701   1.3865  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.9286     0.0426   68.82  < 2e-16 ***
## shotVaccinated   0.2094     0.0533    3.93  0.00011 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1702)
## 
##     Null deviance: 46.370  on 258  degrees of freedom
## Residual deviance: 43.744  on 257  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 280.4
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h2"></a>
#### H2: interaction present
Although the interaction term is not very strong, removing it doesn't improve
the fit, at least in terms of AIC. Removing the shot entirely leaves us with
an even higher AIC. Bootstrapping 200 samples gives equivalent AIC scores for
full, noint and age only. So we should choose age only.


```
## 
## Call:
## glm(formula = H2_log ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2207  -0.2181   0.0005   0.2011   0.9413  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.80065    0.11967   15.05   <2e-16 ***
## age                 0.02016    0.00318    6.34    1e-09 ***
## shotVaccinated     -0.52000    0.15825   -3.29   0.0012 ** 
## age:shotVaccinated  0.01082    0.00397    2.72   0.0069 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1384)
## 
##     Null deviance: 65.217  on 264  degrees of freedom
## Residual deviance: 36.113  on 261  degrees of freedom
##   (8 observations deleted due to missingness)
## AIC: 233.9
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H2_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -1.181  -0.230   0.005   0.198   0.981  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.55281    0.07858   19.76   <2e-16 ***
## age             0.02709    0.00193   14.03   <2e-16 ***
## shotVaccinated -0.10996    0.04898   -2.25    0.026 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1417)
## 
##     Null deviance: 65.217  on 264  degrees of freedom
## Residual deviance: 37.138  on 262  degrees of freedom
##   (8 observations deleted due to missingness)
## AIC: 239.3
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H2_log ~ age, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2099  -0.2101   0.0064   0.2264   0.9521  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.52469    0.07817    19.5   <2e-16 ***
## age          0.02608    0.00189    13.8   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1439)
## 
##     Null deviance: 65.217  on 264  degrees of freedom
## Residual deviance: 37.852  on 263  degrees of freedom
##   (8 observations deleted due to missingness)
## AIC: 242.3
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h3brisbane"></a>
#### H3 Brisbane: shot only

```
## 
## Call:
## glm(formula = H3_brisbane_log ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.3079  -0.3746  -0.0131   0.3938   1.5608  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.59135    0.20498   12.64   <2e-16 ***
## age                -0.00311    0.00549   -0.57     0.57    
## shotVaccinated      0.01827    0.27011    0.07     0.95    
## age:shotVaccinated  0.00564    0.00685    0.82     0.41    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.3894)
## 
##     Null deviance: 100.005  on 251  degrees of freedom
## Residual deviance:  96.561  on 248  degrees of freedom
##   (21 observations deleted due to missingness)
## AIC: 483.4
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_brisbane_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.2774  -0.3728  -0.0023   0.4107   1.5010  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.463195   0.133186   18.49   <2e-16 ***
## age            0.000506   0.003284    0.15   0.8777    
## shotVaccinated 0.229615   0.083511    2.75   0.0064 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.3889)
## 
##     Null deviance: 100.005  on 251  degrees of freedom
## Residual deviance:  96.824  on 249  degrees of freedom
##   (21 observations deleted due to missingness)
## AIC: 482.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_brisbane_log ~ shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.2817  -0.3710  -0.0031   0.4048   1.5093  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.4811     0.0645   38.45   <2e-16 ***
## shotVaccinated   0.2325     0.0812    2.86   0.0046 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.3873)
## 
##     Null deviance: 100.005  on 251  degrees of freedom
## Residual deviance:  96.834  on 250  degrees of freedom
##   (21 observations deleted due to missingness)
## AIC: 480.1
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h3hk"></a>
#### H3 Hong Kong: age only

```
## 
## Call:
## glm(formula = H3_HK_log ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3715  -0.3073  -0.0317   0.3229   1.0837  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.62255    0.15191   10.68  < 2e-16 ***
## age                 0.02816    0.00402    7.00  2.1e-11 ***
## shotVaccinated      0.02026    0.19995    0.10     0.92    
## age:shotVaccinated -0.00082    0.00502   -0.16     0.87    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2201)
## 
##     Null deviance: 87.716  on 263  degrees of freedom
## Residual deviance: 57.229  on 260  degrees of freedom
##   (9 observations deleted due to missingness)
## AIC: 355.6
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_HK_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3745  -0.3068  -0.0309   0.3223   1.0848  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.6415     0.0981   16.73   <2e-16 ***
## age              0.0276     0.0024   11.53   <2e-16 ***
## shotVaccinated  -0.0109     0.0611   -0.18     0.86    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2193)
## 
##     Null deviance: 87.716  on 263  degrees of freedom
## Residual deviance: 57.235  on 261  degrees of freedom
##   (9 observations deleted due to missingness)
## AIC: 353.6
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_HK_log ~ age, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -1.377  -0.304  -0.035   0.321   1.081  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.63848    0.09649    17.0   <2e-16 ***
## age          0.02754    0.00233    11.8   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2185)
## 
##     Null deviance: 87.716  on 263  degrees of freedom
## Residual deviance: 57.242  on 262  degrees of freedom
##   (9 observations deleted due to missingness)
## AIC: 351.6
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h4"></a>
#### H4: neither shot nor age

```
## 
## Call:
## glm(formula = H4_log ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.9014  -0.1201  -0.0077   0.1315   1.5033  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.99426    0.09597   20.78   <2e-16 ***
## age                -0.00139    0.00252   -0.55     0.58    
## shotVaccinated     -0.06722    0.12629   -0.53     0.60    
## age:shotVaccinated  0.00263    0.00314    0.84     0.40    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07996)
## 
##     Null deviance: 19.480  on 245  degrees of freedom
## Residual deviance: 19.351  on 242  degrees of freedom
##   (27 observations deleted due to missingness)
## AIC: 82.65
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H4_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.8842  -0.1194  -0.0032   0.1335   1.4996  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    1.933157   0.062110   31.12   <2e-16 ***
## age            0.000296   0.001507    0.20     0.84    
## shotVaccinated 0.033313   0.038292    0.87     0.39    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07986)
## 
##     Null deviance: 19.480  on 245  degrees of freedom
## Residual deviance: 19.407  on 243  degrees of freedom
##   (27 observations deleted due to missingness)
## AIC: 81.35
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H4_log ~ shot, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.8872  -0.1174  -0.0046   0.1340   1.4985  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.9439     0.0296   65.75   <2e-16 ***
## shotVaccinated   0.0350     0.0372    0.94     0.35    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07955)
## 
##     Null deviance: 19.48  on 245  degrees of freedom
## Residual deviance: 19.41  on 244  degrees of freedom
##   (27 observations deleted due to missingness)
## AIC: 79.39
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h5_dil"></a>
#### H5 effect at first dilution: shot only

```
## 
## Call:
## glm(formula = H5_1st_dil_percent ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.40   -4.40   -0.92    3.00   69.18  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)
## (Intercept)         -0.5799     3.3600   -0.17     0.86
## age                  0.0565     0.0900    0.63     0.53
## shotVaccinated       5.2465     4.4561    1.18     0.24
## age:shotVaccinated  -0.0494     0.1127   -0.44     0.66
## 
## (Dispersion parameter for gaussian family taken to be 113.9)
## 
##     Null deviance: 31494  on 272  degrees of freedom
## Residual deviance: 30644  on 269  degrees of freedom
## AIC: 2073
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H5_1st_dil_percent ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.25   -4.20   -0.89    2.78   69.53  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)  
## (Intercept)      0.5393     2.1835    0.25    0.805  
## age              0.0249     0.0541    0.46    0.645  
## shotVaccinated   3.3861     1.3672    2.48    0.014 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 113.6)
## 
##     Null deviance: 31494  on 272  degrees of freedom
## Residual deviance: 30665  on 270  degrees of freedom
## AIC: 2072
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H5_1st_dil_percent ~ shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.46   -4.46   -0.92    2.58   69.04  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)   
## (Intercept)        1.42       1.04    1.36   0.1738   
## shotVaccinated     3.54       1.33    2.67   0.0081 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 113.2)
## 
##     Null deviance: 31494  on 272  degrees of freedom
## Residual deviance: 30690  on 271  degrees of freedom
## AIC: 2070
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ic50h7_dil"></a>
#### H7 effect at first dilution: neither age nor shot

```
## 
## Call:
## glm(formula = H7_1st_dil_percent ~ age * shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.66   -9.63   -1.90    7.43   43.20  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         13.3386     3.8048    3.51  0.00053 ***
## age                  0.0315     0.1020    0.31  0.75736    
## shotVaccinated      -6.9838     5.0459   -1.38  0.16749    
## age:shotVaccinated   0.1474     0.1276    1.16  0.24910    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 146.1)
## 
##     Null deviance: 40131  on 272  degrees of freedom
## Residual deviance: 39293  on 269  degrees of freedom
## AIC: 2141
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_1st_dil_percent ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -22.66   -9.22   -1.83    7.33   43.65  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     10.0020     2.4778    4.04  7.1e-05 ***
## age              0.1256     0.0614    2.05    0.042 *  
## shotVaccinated  -1.4375     1.5514   -0.93    0.355    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 146.3)
## 
##     Null deviance: 40131  on 272  degrees of freedom
## Residual deviance: 39488  on 270  degrees of freedom
## AIC: 2141
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_1st_dil_percent ~ age, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.48   -8.95   -1.62    7.89   43.25  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   9.6399     2.4462    3.94   0.0001 ***
## age           0.1121     0.0596    1.88   0.0609 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 146.2)
## 
##     Null deviance: 40131  on 272  degrees of freedom
## Residual deviance: 39613  on 271  degrees of freedom
## AIC: 2140
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50"></a>
### EC50

<a id="ec50h1pdm09"></a>
#### H1 pandemic 2009: both shot and age without interaction

```
## 
## Call:
## glm(formula = H1_pdm09_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.7359  -0.2104   0.0016   0.1937   0.7995  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.28347    0.10002   12.83   <2e-16 ***
## age                 0.00235    0.00267    0.88     0.38    
## shotVaccinated      0.00857    0.13216    0.06     0.95    
## age:shotVaccinated  0.00432    0.00334    1.30     0.20    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.09922)
## 
##     Null deviance: 30.372  on 271  degrees of freedom
## Residual deviance: 26.590  on 268  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 149.4
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_pdm09_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.7925  -0.2195  -0.0021   0.1831   0.8261  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.18484    0.06496   18.24  < 2e-16 ***
## age             0.00512    0.00160    3.19   0.0016 ** 
## shotVaccinated  0.17157    0.04053    4.23  3.2e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.09947)
## 
##     Null deviance: 30.372  on 271  degrees of freedom
## Residual deviance: 26.757  on 269  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 149.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_pdm09_log ~ shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.7163  -0.2021  -0.0101   0.1949   0.8134  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.3670     0.0316   43.26   <2e-16 ***
## shotVaccinated   0.2016     0.0401    5.03    9e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1029)
## 
##     Null deviance: 30.372  on 271  degrees of freedom
## Residual deviance: 27.770  on 270  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 157.2
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h1pr8"></a>
#### H1 PR8: effect of both, but no interaction

```
## 
## Call:
## glm(formula = H1_PR8_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.9297  -0.2093   0.0053   0.1873   1.0806  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.771087   0.102209   17.33   <2e-16 ***
## age                 0.008895   0.002739    3.25   0.0013 ** 
## shotVaccinated      0.367045   0.135550    2.71   0.0072 ** 
## age:shotVaccinated -0.000979   0.003428   -0.29   0.7754    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1054)
## 
##     Null deviance: 40.307  on 272  degrees of freedom
## Residual deviance: 28.355  on 269  degrees of freedom
## AIC: 166.5
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_PR8_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.9375  -0.2090   0.0032   0.1881   1.0747  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.79325    0.06641   27.00  < 2e-16 ***
## age             0.00827    0.00164    5.03  9.0e-07 ***
## shotVaccinated  0.33021    0.04158    7.94  5.4e-14 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.1051)
## 
##     Null deviance: 40.307  on 272  degrees of freedom
## Residual deviance: 28.364  on 270  degrees of freedom
## AIC: 164.6
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h2"></a>
#### H2: small signal from the interaction, but the age only fits almost
Bootstrapping and looking at the AIC there is no reason to include the shots,
and the age alone explain everything equally well. Last fit forces the
intercept to zero.

```
## 
## Call:
## glm(formula = H2_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.8669  -0.2943  -0.0111   0.3151   1.6909  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         0.13879    0.16619    0.84    0.404    
## age                 0.02446    0.00443    5.52  8.1e-08 ***
## shotVaccinated     -0.43695    0.21926   -1.99    0.047 *  
## age:shotVaccinated  0.01166    0.00553    2.11    0.036 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.272)
## 
##     Null deviance: 115.19  on 269  degrees of freedom
## Residual deviance:  72.35  on 266  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 420.7
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H2_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.9225  -0.2863  -0.0036   0.3022   1.7351  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    -0.12781    0.10846   -1.18     0.24    
## age             0.03194    0.00267   11.96   <2e-16 ***
## shotVaccinated  0.00287    0.06767    0.04     0.97    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2755)
## 
##     Null deviance: 115.185  on 269  degrees of freedom
## Residual deviance:  73.558  on 267  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 423.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H2_log ~ age, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.9245  -0.2866  -0.0023   0.3026   1.7359  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -0.1270     0.1067   -1.19     0.23    
## age           0.0320     0.0026   12.32   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2745)
## 
##     Null deviance: 115.185  on 269  degrees of freedom
## Residual deviance:  73.558  on 268  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 421.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H2_log ~ 0 + age, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.9188  -0.3131  -0.0235   0.3035   1.7622  
## 
## Coefficients:
##     Estimate Std. Error t value Pr(>|t|)    
## age 0.029016   0.000776    37.4   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2749)
## 
##     Null deviance: 458.294  on 270  degrees of freedom
## Residual deviance:  73.947  on 269  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 420.6
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h3"></a>
#### H3: both contribute, but no interaction

```
## 
## Call:
## glm(formula = H3_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2192  -0.3243  -0.0402   0.3013   1.3745  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         3.78978    0.15099   25.10  < 2e-16 ***
## age                -0.01563    0.00405   -3.86  0.00014 ***
## shotVaccinated     -0.11842    0.20024   -0.59  0.55477    
## age:shotVaccinated  0.00895    0.00506    1.77  0.07836 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.23)
## 
##     Null deviance: 68.041  on 272  degrees of freedom
## Residual deviance: 61.877  on 269  degrees of freedom
## AIC: 379.5
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2531  -0.3219  -0.0404   0.2933   1.3818  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     3.58723    0.09865   36.36  < 2e-16 ***
## age            -0.00992    0.00244   -4.06  6.4e-05 ***
## shotVaccinated  0.21829    0.06177    3.53  0.00048 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2318)
## 
##     Null deviance: 68.041  on 272  degrees of freedom
## Residual deviance: 62.595  on 270  degrees of freedom
## AIC: 380.7
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h4"></a>
#### H4: neither age nor shot

```
## 
## Call:
## glm(formula = H4_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.4648  -0.3277   0.0514   0.3390   2.4037  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.32850    0.21074    6.30  1.2e-09 ***
## age                 0.00498    0.00564    0.88     0.38    
## shotVaccinated      0.26120    0.28051    0.93     0.35    
## age:shotVaccinated -0.00353    0.00707   -0.50     0.62    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4445)
## 
##     Null deviance: 118.61  on 266  degrees of freedom
## Residual deviance: 116.89  on 263  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 547.2
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H4_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.4718  -0.3204   0.0446   0.3473   2.4212  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.40817    0.13752   10.24   <2e-16 ***
## age             0.00274    0.00340    0.81     0.42    
## shotVaccinated  0.12791    0.08616    1.48     0.14    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4432)
## 
##     Null deviance: 118.61  on 266  degrees of freedom
## Residual deviance: 117.00  on 264  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 545.4
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H4_log ~ shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.4569  -0.3145   0.0414   0.3445   2.3840  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.5056     0.0656   22.97   <2e-16 ***
## shotVaccinated   0.1444     0.0836    1.73    0.085 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4426)
## 
##     Null deviance: 118.61  on 266  degrees of freedom
## Residual deviance: 117.29  on 265  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 544.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H4_log ~ age, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.4318  -0.3291   0.0495   0.3279   2.4840  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.43970    0.13618   10.57   <2e-16 ***
## age          0.00394    0.00331    1.19     0.24    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.4452)
## 
##     Null deviance: 118.61  on 266  degrees of freedom
## Residual deviance: 117.98  on 265  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 545.6
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h5"></a>
#### H5: both contribute, but no interaction

```
## 
## Call:
## glm(formula = H5_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2326  -0.3418  -0.0208   0.2794   1.3767  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.08812    0.15153    7.18  6.8e-12 ***
## age                 0.00872    0.00406    2.15    0.033 *  
## shotVaccinated      0.00520    0.20097    0.03    0.979    
## age:shotVaccinated  0.00703    0.00508    1.38    0.168    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2317)
## 
##     Null deviance: 77.389  on 272  degrees of freedom
## Residual deviance: 62.326  on 269  degrees of freedom
## AIC: 381.5
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H5_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3085  -0.3280  -0.0335   0.2644   1.3831  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     0.92891    0.09879    9.40  < 2e-16 ***
## age             0.01321    0.00245    5.40  1.5e-07 ***
## shotVaccinated  0.26984    0.06185    4.36  1.8e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2325)
## 
##     Null deviance: 77.389  on 272  degrees of freedom
## Residual deviance: 62.770  on 270  degrees of freedom
## AIC: 381.4
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h7"></a>
#### H7: barely an effect of age

```
## 
## Call:
## glm(formula = H7_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5249  -0.1917  -0.0046   0.1854   1.0107  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.761111   0.088516   19.90   <2e-16 ***
## age                -0.003045   0.002372   -1.28     0.20    
## shotVaccinated      0.005758   0.117391    0.05     0.96    
## age:shotVaccinated -0.000311   0.002969   -0.10     0.92    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07906)
## 
##     Null deviance: 21.718  on 272  degrees of freedom
## Residual deviance: 21.267  on 269  degrees of freedom
## AIC: 87.95
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5232  -0.1912  -0.0003   0.1847   1.0092  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.76816    0.05750   30.75   <2e-16 ***
## age            -0.00324    0.00142   -2.28    0.024 *  
## shotVaccinated -0.00596    0.03600   -0.17    0.869    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07877)
## 
##     Null deviance: 21.718  on 272  degrees of freedom
## Residual deviance: 21.267  on 270  degrees of freedom
## AIC: 85.96
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_log ~ age, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5192  -0.1936   0.0016   0.1841   1.0078  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.76666    0.05668   31.17   <2e-16 ***
## age         -0.00330    0.00138   -2.39    0.018 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07849)
## 
##     Null deviance: 21.718  on 272  degrees of freedom
## Residual deviance: 21.270  on 271  degrees of freedom
## AIC: 83.99
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h7_vir"></a>
#### H7 virus: no FX

```
## 
## Call:
## glm(formula = H7_vir_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1668  -0.1605   0.0079   0.1750   0.5868  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.27681    0.08618   14.82   <2e-16 ***
## age                 0.00116    0.00231    0.50     0.62    
## shotVaccinated     -0.06398    0.11429   -0.56     0.58    
## age:shotVaccinated -0.00027    0.00289   -0.09     0.93    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07494)
## 
##     Null deviance: 20.497  on 272  degrees of freedom
## Residual deviance: 20.158  on 269  degrees of freedom
## AIC: 73.34
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_vir_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1679  -0.1594   0.0075   0.1745   0.5854  
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.282920   0.055985   22.92   <2e-16 ***
## age             0.000989   0.001386    0.71    0.476    
## shotVaccinated -0.074131   0.035054   -2.11    0.035 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07466)
## 
##     Null deviance: 20.497  on 272  degrees of freedom
## Residual deviance: 20.159  on 270  degrees of freedom
## AIC: 71.35
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_vir_log ~ shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1743  -0.1590   0.0132   0.1742   0.5772  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.3180     0.0268    49.2   <2e-16 ***
## shotVaccinated  -0.0682     0.0340    -2.0    0.046 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07453)
## 
##     Null deviance: 20.497  on 272  degrees of freedom
## Residual deviance: 20.197  on 271  degrees of freedom
## AIC: 69.87
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H7_vir_log ~ age, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1291  -0.1625  -0.0041   0.1879   0.6228  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.264250   0.055637   22.72   <2e-16 ***
## age         0.000294   0.001355    0.22     0.83    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.07562)
## 
##     Null deviance: 20.497  on 272  degrees of freedom
## Residual deviance: 20.493  on 271  degrees of freedom
## AIC: 73.84
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50h12"></a>
#### H12: barely an effect of age and shot, but no interaction

```
## 
## Call:
## glm(formula = H12_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0532  -0.3413  -0.0355   0.2635   1.5024  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.50951    0.14358   17.48   <2e-16 ***
## age                -0.00938    0.00385   -2.44    0.015 *  
## shotVaccinated     -0.11583    0.19042   -0.61    0.543    
## age:shotVaccinated  0.00653    0.00482    1.36    0.177    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.208)
## 
##     Null deviance: 58.020  on 272  degrees of freedom
## Residual deviance: 55.957  on 269  degrees of freedom
## AIC: 352.1
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H12_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0513  -0.3413  -0.0318   0.2798   1.5178  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     2.36180    0.09359   25.23   <2e-16 ***
## age            -0.00521    0.00232   -2.25    0.025 *  
## shotVaccinated  0.12971    0.05860    2.21    0.028 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2087)
## 
##     Null deviance: 58.020  on 272  degrees of freedom
## Residual deviance: 56.339  on 270  degrees of freedom
## AIC: 351.9
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H12_log ~ age, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1265  -0.3375  -0.0435   0.2885   1.5565  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.39447    0.09308   25.72   <2e-16 ***
## age         -0.00400    0.00227   -1.76    0.079 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2117)
## 
##     Null deviance: 58.020  on 272  degrees of freedom
## Residual deviance: 57.362  on 271  degrees of freedom
## AIC: 354.8
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H12_log ~ shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1179  -0.3343  -0.0283   0.2697   1.4837  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.1769     0.0451   48.24   <2e-16 ***
## shotVaccinated   0.0985     0.0574    1.72    0.087 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for gaussian family taken to be 0.2118)
## 
##     Null deviance: 58.020  on 272  degrees of freedom
## Residual deviance: 57.396  on 271  degrees of freedom
## AIC: 355
## 
## Number of Fisher Scoring iterations: 2
```



<a id="#median-and-iqr-where-no-effect-was-found"></a>
### Median and IQR where no effect was found

```
## [1] "EC50; H4"
```

```
## [1] "1.625 +/- 0.682"
```

```
## [1] "EC50; H7"
```

```
## [1] "1.645 +/- 0.362"
```

```
## [1] "EC50; H7_vir"
```

```
## [1] "1.273 +/- 0.352"
```

```
## [1] "EC50; H12"
```

```
## [1] "2.215 +/- 0.619"
```

```
## [1] "IC50; H7_1st_dil_percent"
```

```
## [1] "11.500 +/- 17.500"
```


[1]: http://r-eco-evo.blogspot.ch/2011/08/comparing-two-regression-slopes-by.html

#### _Latest update: 07 April 2014_.
