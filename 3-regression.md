

  
Regression of antibody titer vs. age
------------------------------------

<a id="rlm_fit"></a>
## Analysis of antibody titer: robust linear regression
In the following, we fit a robust linear model to the relation:
antibody-titer vs. age. Lots of plots.

### IC50

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3316  -0.3840  -0.0966   0.2869   1.4268  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.28380    0.21066   10.84   <2e-16 ***
## age          0.00190    0.00574    0.33     0.74    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.3649)
## 
##     Null deviance: 31.061  on 86  degrees of freedom
## Residual deviance: 31.021  on 85  degrees of freedom
##   (17 observations deleted due to missingness)
## AIC: 163.2
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5414  -0.5139  -0.0704   0.4984   1.6803  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  3.27646    0.19058   17.19   <2e-16 ***
## age         -0.00957    0.00441   -2.17    0.032 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4497)
## 
##     Null deviance: 74.063  on 161  degrees of freedom
## Residual deviance: 71.947  on 160  degrees of freedom
##   (7 observations deleted due to missingness)
## AIC: 334.2
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic501.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0393  -0.1916  -0.0174   0.3037   0.7476  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.83891    0.12771   22.23   <2e-16 ***
## age          0.00254    0.00344    0.74     0.46    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1455)
## 
##     Null deviance: 13.467  on 93  degrees of freedom
## Residual deviance: 13.388  on 92  degrees of freedom
##   (10 observations deleted due to missingness)
## AIC: 89.56
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1690  -0.3235  -0.0147   0.2305   1.4335  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.87870    0.11832   24.33   <2e-16 ***
## age          0.00624    0.00274    2.28    0.024 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.18)
## 
##     Null deviance: 30.277  on 164  degrees of freedom
## Residual deviance: 29.340  on 163  degrees of freedom
##   (4 observations deleted due to missingness)
## AIC: 189.3
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic502.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -0.956  -0.170   0.004   0.170   0.827  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.80065    0.09608    18.7   <2e-16 ***
## age          0.02016    0.00255     7.9    4e-12 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.08918)
## 
##     Null deviance: 14.3915  on 100  degrees of freedom
## Residual deviance:  8.8293  on  99  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 46.48
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2207  -0.2490  -0.0003   0.2264   0.9413  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.28065    0.11425    11.2   <2e-16 ***
## age          0.03098    0.00263    11.8   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1684)
## 
##     Null deviance: 50.665  on 163  degrees of freedom
## Residual deviance: 27.284  on 162  degrees of freedom
##   (5 observations deleted due to missingness)
## AIC: 177.3
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic503.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.3079  -0.3594  -0.0177   0.4241   1.5608  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.59135    0.22318   11.61   <2e-16 ***
## age         -0.00311    0.00597   -0.52      0.6    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4615)
## 
##     Null deviance: 42.125  on 92  degrees of freedom
## Residual deviance: 42.000  on 91  degrees of freedom
##   (11 observations deleted due to missingness)
## AIC: 196
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.1594  -0.3779   0.0057   0.3706   1.2960  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.60961    0.16618   15.70   <2e-16 ***
## age          0.00253    0.00388    0.65     0.52    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.3475)
## 
##     Null deviance: 54.709  on 158  degrees of freedom
## Residual deviance: 54.561  on 157  degrees of freedom
##   (10 observations deleted due to missingness)
## AIC: 287.2
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic504.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0446  -0.2857  -0.0418   0.2442   0.9154  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.62255    0.14141   11.47  < 2e-16 ***
## age          0.02816    0.00374    7.52  2.7e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1907)
## 
##     Null deviance: 29.296  on 98  degrees of freedom
## Residual deviance: 18.501  on 97  degrees of freedom
##   (5 observations deleted due to missingness)
## AIC: 120.9
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3715  -0.3480  -0.0313   0.3527   1.0837  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.64280    0.13507   12.16  < 2e-16 ***
## age          0.02734    0.00311    8.79  2.1e-15 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2376)
## 
##     Null deviance: 57.069  on 164  degrees of freedom
## Residual deviance: 38.729  on 163  degrees of freedom
##   (4 observations deleted due to missingness)
## AIC: 235.1
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic505.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.9014  -0.0566   0.0135   0.1580   0.5868  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.99426    0.08514   23.42   <2e-16 ***
## age         -0.00139    0.00224   -0.62     0.54    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.06293)
## 
##     Null deviance: 5.6252  on 90  degrees of freedom
## Residual deviance: 5.6008  on 89  degrees of freedom
##   (13 observations deleted due to missingness)
## AIC: 10.54
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.6795  -0.1287  -0.0283   0.1102   1.5033  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.92704    0.08702   22.15   <2e-16 ***
## age          0.00124    0.00199    0.62     0.54    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.08987)
## 
##     Null deviance: 13.785  on 154  degrees of freedom
## Residual deviance: 13.751  on 153  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 70.41
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic506.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -17.45   -3.09    0.17    3.42   51.22  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)  -0.5799     2.6716   -0.22     0.83
## age           0.0565     0.0716    0.79     0.43
## 
## (Dispersion parameter for gaussian family taken to be 72.02)
## 
##     Null deviance: 7390.9  on 103  degrees of freedom
## Residual deviance: 7346.1  on 102  degrees of freedom
## AIC: 743.9
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.40   -4.88   -1.90    2.14   69.18  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)  4.66662    3.23903    1.44     0.15
## age          0.00704    0.07500    0.09     0.93
## 
## (Dispersion parameter for gaussian family taken to be 139.5)
## 
##     Null deviance: 23299  on 168  degrees of freedom
## Residual deviance: 23297  on 167  degrees of freedom
## AIC: 1318
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic507.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -20.82   -8.13   -1.38    7.20   29.84  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  13.3386     3.5868    3.72  0.00033 ***
## age           0.0315     0.0961    0.33  0.74354    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 129.8)
## 
##     Null deviance: 13255  on 103  degrees of freedom
## Residual deviance: 13241  on 102  degrees of freedom
## AIC: 805.2
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -21.66   -9.84   -1.90    7.84   43.20  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)  
## (Intercept)   6.3547     3.4252    1.86    0.065 .
## age           0.1789     0.0793    2.26    0.025 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 156)
## 
##     Null deviance: 26846  on 168  degrees of freedom
## Residual deviance: 26052  on 167  degrees of freedom
## AIC: 1337
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ic50](figure/plot_ic508.png) 

```
## pdf 
##   2
```


----

### EC50

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.7359  -0.1906   0.0112   0.1663   0.7995  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.28347    0.10680   12.02   <2e-16 ***
## age          0.00235    0.00285    0.82     0.41    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1131)
## 
##     Null deviance: 11.502  on 102  degrees of freedom
## Residual deviance: 11.426  on 101  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 71.82
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.6532  -0.2239  -0.0115   0.2045   0.7964  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.29204    0.08264   15.64  < 2e-16 ***
## age          0.00667    0.00191    3.49  0.00063 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.0908)
## 
##     Null deviance: 16.268  on 168  degrees of freedom
## Residual deviance: 15.164  on 167  degrees of freedom
## AIC: 78.15
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec501.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.9297  -0.2247   0.0312   0.2142   1.0806  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   1.7711     0.1121   15.80   <2e-16 ***
## age           0.0089     0.0030    2.96   0.0038 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1268)
## 
##     Null deviance: 14.050  on 103  degrees of freedom
## Residual deviance: 12.938  on 102  degrees of freedom
## AIC: 84.38
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.9060  -0.1976  -0.0005   0.1841   0.7752  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.13813    0.08332    25.7  < 2e-16 ***
## age          0.00792    0.00193     4.1  6.4e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.09231)
## 
##     Null deviance: 16.971  on 168  degrees of freedom
## Residual deviance: 15.417  on 167  degrees of freedom
## AIC: 80.94
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec502.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.8526  -0.3185  -0.0015   0.3383   1.1960  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.13879    0.16644    0.83     0.41    
## age          0.02446    0.00444    5.51  2.8e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2728)
## 
##     Null deviance: 35.568  on 101  degrees of freedom
## Residual deviance: 27.281  on 100  degrees of freedom
##   (2 observations deleted due to missingness)
## AIC: 160.9
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.8669  -0.2726  -0.0218   0.3119   1.6909  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -0.29816    0.14290   -2.09    0.038 *  
## age          0.03612    0.00331   10.91   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2715)
## 
##     Null deviance: 77.390  on 167  degrees of freedom
## Residual deviance: 45.069  on 166  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 261.7
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec503.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0417  -0.3305  -0.0556   0.2876   1.3745  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  3.78978    0.15221   24.90  < 2e-16 ***
## age         -0.01563    0.00408   -3.83  0.00022 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2338)
## 
##     Null deviance: 27.277  on 103  degrees of freedom
## Residual deviance: 23.844  on 102  degrees of freedom
## AIC: 148
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2192  -0.3086  -0.0276   0.3054   1.2904  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  3.67137    0.13087   28.05   <2e-16 ***
## age         -0.00668    0.00303   -2.21    0.029 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2277)
## 
##     Null deviance: 39.140  on 168  degrees of freedom
## Residual deviance: 38.032  on 167  degrees of freedom
## AIC: 233.5
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec504.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.8414  -0.3322   0.0201   0.3617   1.4422  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.32850    0.20051    6.63  1.7e-09 ***
## age          0.00498    0.00536    0.93     0.35    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4023)
## 
##     Null deviance: 40.984  on 102  degrees of freedom
## Residual deviance: 40.637  on 101  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 202.5
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.4648  -0.2919   0.0637   0.2877   2.4037  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.58971    0.19051    8.34    3e-14 ***
## age          0.00145    0.00440    0.33     0.74    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4707)
## 
##     Null deviance: 76.306  on 163  degrees of freedom
## Residual deviance: 76.255  on 162  degrees of freedom
##   (5 observations deleted due to missingness)
## AIC: 345.8
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec505.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2118  -0.2720  -0.0098   0.2383   1.1699  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.08812    0.14166    7.68    1e-11 ***
## age          0.00872    0.00380    2.30    0.024 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2025)
## 
##     Null deviance: 21.722  on 103  degrees of freedom
## Residual deviance: 20.654  on 102  degrees of freedom
## AIC: 133
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.2326  -0.3703  -0.0298   0.2897   1.3767  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.09332    0.13699    7.98  2.2e-13 ***
## age          0.01575    0.00317    4.97  1.7e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2495)
## 
##     Null deviance: 47.825  on 168  degrees of freedom
## Residual deviance: 41.672  on 167  degrees of freedom
## AIC: 249
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec506.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1668  -0.1722   0.0413   0.2044   0.5868  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.27681    0.09741   13.11   <2e-16 ***
## age          0.00116    0.00261    0.44     0.66    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.09575)
## 
##     Null deviance: 9.7854  on 103  degrees of freedom
## Residual deviance: 9.7665  on 102  degrees of freedom
## AIC: 55.13
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.7280  -0.1496   0.0013   0.1628   0.5678  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.212836   0.068408   17.73   <2e-16 ***
## age         0.000891   0.001584    0.56     0.57    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.06223)
## 
##     Null deviance: 10.412  on 168  degrees of freedom
## Residual deviance: 10.392  on 167  degrees of freedom
## AIC: 14.28
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec507.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5249  -0.1618   0.0162   0.1763   0.7821  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.76111    0.09535   18.47   <2e-16 ***
## age         -0.00304    0.00256   -1.19     0.24    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.09173)
## 
##     Null deviance: 9.4871  on 103  degrees of freedom
## Residual deviance: 9.3568  on 102  degrees of freedom
## AIC: 50.68
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.8793  -0.2021  -0.0136   0.1854   1.0107  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.76687    0.07323   24.13   <2e-16 ***
## age         -0.00336    0.00170   -1.98    0.049 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07132)
## 
##     Null deviance: 12.189  on 168  degrees of freedom
## Residual deviance: 11.910  on 167  degrees of freedom
## AIC: 37.32
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec508.png) 

```
## pdf 
##   2
```

```
## [1] "Fit on the non vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Non vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0532  -0.2865  -0.0304   0.2379   1.1134  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.50951    0.13025   19.27   <2e-16 ***
## age         -0.00938    0.00349   -2.69   0.0084 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1712)
## 
##     Null deviance: 18.698  on 103  degrees of freedom
## Residual deviance: 17.461  on 102  degrees of freedom
## AIC: 115.6
## 
## Number of Fisher Scoring iterations: 2
## 
## [1] "Fit on the vaccinated"
## 
## Call:
## glm(formula = value ~ age, data = melted, subset = (shot == "Vaccinated"))
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.8702  -0.3744  -0.0453   0.2928   1.5024  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.39368    0.13166   18.18   <2e-16 ***
## age         -0.00285    0.00305   -0.94     0.35    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2305)
## 
##     Null deviance: 38.698  on 168  degrees of freedom
## Residual deviance: 38.496  on 167  degrees of freedom
## AIC: 235.6
## 
## Number of Fisher Scoring iterations: 2
```

![plot of chunk plot_ec50](figure/plot_ec509.png) 

```
## pdf 
##   2
```


----

### Difference between IC50 and EC50, vs age
Her we plot the IC50 value minus EC50 vs. age and a loess smoothing.
![plot of chunk merge_and_delta](figure/merge_and_delta1.png) ![plot of chunk merge_and_delta](figure/merge_and_delta2.png) ![plot of chunk merge_and_delta](figure/merge_and_delta3.png) 


#### _Latest update: 26 November 2013_.
