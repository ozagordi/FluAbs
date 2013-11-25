


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
## -1.5504  -0.4561  -0.0764   0.4581   1.6812  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.324060   0.229206   10.14   <2e-16 ***
## age                 0.000519   0.006298    0.08   0.9344    
## shotVaccinated      0.974763   0.294667    3.31   0.0011 ** 
## age:shotVaccinated -0.010520   0.007614   -1.38   0.1683    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4197)
## 
##     Null deviance: 120.67  on 246  degrees of freedom
## Residual deviance: 101.98  on 243  degrees of freedom
##   (24 observations deleted due to missingness)
## AIC: 492.5
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H1_brisbane_log ~ age + shot, data = ic_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -1.515  -0.469  -0.085   0.454   1.680  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     2.57353    0.14145   18.19  < 2e-16 ***
## age            -0.00668    0.00355   -1.88    0.061 .  
## shotVaccinated  0.58706    0.09011    6.52  4.1e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4212)
## 
##     Null deviance: 120.67  on 246  degrees of freedom
## Residual deviance: 102.78  on 244  degrees of freedom
##   (24 observations deleted due to missingness)
## AIC: 492.4
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
## -1.5121  -0.5094  -0.0739   0.4522   1.7504  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.3420     0.0704   33.29  < 2e-16 ***
## shotVaccinated   0.5408     0.0871    6.21  2.3e-09 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4256)
## 
##     Null deviance: 120.67  on 246  degrees of freedom
## Residual deviance: 104.28  on 245  degrees of freedom
##   (24 observations deleted due to missingness)
## AIC: 494
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
## -1.1665  -0.3043  -0.0142   0.2770   1.4356  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.85961    0.13897   20.58   <2e-16 ***
## age                 0.00183    0.00377    0.49     0.63    
## shotVaccinated      0.01315    0.18037    0.07     0.94    
## age:shotVaccinated  0.00453    0.00461    0.98     0.33    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1681)
## 
##     Null deviance: 46.240  on 256  degrees of freedom
## Residual deviance: 42.534  on 253  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 277
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
## -1.1825  -0.2965  -0.0139   0.2769   1.4241  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     2.75333    0.08727   31.55   <2e-16 ***
## age             0.00485    0.00217    2.24   0.0261 *  
## shotVaccinated  0.18196    0.05504    3.31   0.0011 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1681)
## 
##     Null deviance: 46.240  on 256  degrees of freedom
## Residual deviance: 42.696  on 254  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 276
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
## -1.2340  -0.2623  -0.0119   0.2661   1.3872  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.9239     0.0428   68.24   <2e-16 ***
## shotVaccinated   0.2134     0.0536    3.98    9e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1707)
## 
##     Null deviance: 46.240  on 256  degrees of freedom
## Residual deviance: 43.538  on 255  degrees of freedom
##   (14 observations deleted due to missingness)
## AIC: 279
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
## -1.2207  -0.2144  -0.0009   0.2047   0.9413  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.83350    0.12053   15.21  < 2e-16 ***
## age                 0.01905    0.00322    5.91  1.1e-08 ***
## shotVaccinated     -0.54987    0.15907   -3.46  0.00064 ***
## age:shotVaccinated  0.01188    0.00401    2.96  0.00335 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1375)
## 
##     Null deviance: 63.781  on 262  degrees of freedom
## Residual deviance: 35.606  on 259  degrees of freedom
##   (8 observations deleted due to missingness)
## AIC: 230.5
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
## -1.178  -0.230   0.002   0.197   0.984  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.56045    0.07878   19.81   <2e-16 ***
## age             0.02672    0.00195   13.73   <2e-16 ***
## shotVaccinated -0.10131    0.04931   -2.05    0.041 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1416)
## 
##     Null deviance: 63.781  on 262  degrees of freedom
## Residual deviance: 36.812  on 260  degrees of freedom
##   (8 observations deleted due to missingness)
## AIC: 237.2
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
## -1.2040  -0.2083   0.0085   0.2240   0.9580  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   1.5364     0.0784    19.6   <2e-16 ***
## age           0.0257     0.0019    13.6   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1433)
## 
##     Null deviance: 63.781  on 262  degrees of freedom
## Residual deviance: 37.410  on 261  degrees of freedom
##   (8 observations deleted due to missingness)
## AIC: 239.5
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
## -2.3104  -0.3812  -0.0138   0.3830   1.5889  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.62674    0.20752   12.66   <2e-16 ***
## age                -0.00433    0.00559   -0.77     0.44    
## shotVaccinated     -0.01012    0.27280   -0.04     0.97    
## age:shotVaccinated  0.00672    0.00695    0.97     0.33    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.3902)
## 
##     Null deviance: 99.737  on 249  degrees of freedom
## Residual deviance: 95.994  on 246  degrees of freedom
##   (21 observations deleted due to missingness)
## AIC: 480.2
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
## -2.2746  -0.3717   0.0037   0.4086   1.5157  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    2.47e+00   1.34e-01   18.48   <2e-16 ***
## age            2.75e-05   3.32e-03    0.01   0.9934    
## shotVaccinated 2.41e-01   8.43e-02    2.86   0.0046 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.3901)
## 
##     Null deviance: 99.737  on 249  degrees of freedom
## Residual deviance: 96.359  on 247  degrees of freedom
##   (21 observations deleted due to missingness)
## AIC: 479.1
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
## -2.2748  -0.3714   0.0038   0.4083   1.5162  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.4743     0.0650   38.07   <2e-16 ***
## shotVaccinated   0.2410     0.0817    2.95   0.0035 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.3885)
## 
##     Null deviance: 99.737  on 249  degrees of freedom
## Residual deviance: 96.359  on 248  degrees of freedom
##   (21 observations deleted due to missingness)
## AIC: 477.1
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
## -1.3714  -0.3054  -0.0334   0.3204   1.0860  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.64e+00   1.54e-01   10.69  < 2e-16 ***
## age                 2.75e-02   4.10e-03    6.71  1.2e-10 ***
## shotVaccinated     -8.43e-03   2.02e-01   -0.04     0.97    
## age:shotVaccinated  3.26e-05   5.08e-03    0.01     0.99    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2208)
## 
##     Null deviance: 86.845  on 261  degrees of freedom
## Residual deviance: 56.958  on 258  degrees of freedom
##   (9 observations deleted due to missingness)
## AIC: 353.7
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
## -1.3712  -0.3054  -0.0334   0.3204   1.0860  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.64221    0.09857   16.66   <2e-16 ***
## age             0.02749    0.00242   11.35   <2e-16 ***
## shotVaccinated -0.00720    0.06163   -0.12     0.91    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2199)
## 
##     Null deviance: 86.845  on 261  degrees of freedom
## Residual deviance: 56.958  on 259  degrees of freedom
##   (9 observations deleted due to missingness)
## AIC: 351.7
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_HK_log ~ age, data = ic_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.3731  -0.3068  -0.0327   0.3210   1.0832  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.64036    0.09709    16.9   <2e-16 ***
## age          0.02742    0.00235    11.7   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2191)
## 
##     Null deviance: 86.845  on 261  degrees of freedom
## Residual deviance: 56.961  on 260  degrees of freedom
##   (9 observations deleted due to missingness)
## AIC: 349.7
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
## -0.9017  -0.1210  -0.0076   0.1341   1.5030  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.99637    0.09740   20.50   <2e-16 ***
## age                -0.00146    0.00257   -0.57     0.57    
## shotVaccinated     -0.06807    0.12792   -0.53     0.60    
## age:shotVaccinated  0.00267    0.00320    0.84     0.40    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.08062)
## 
##     Null deviance: 19.479  on 243  degrees of freedom
## Residual deviance: 19.348  on 240  degrees of freedom
##   (27 observations deleted due to missingness)
## AIC: 84.01
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
## -0.8843  -0.1208  -0.0036   0.1349   1.4992  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    1.933982   0.062570   30.91   <2e-16 ***
## age            0.000271   0.001527    0.18     0.86    
## shotVaccinated 0.033870   0.038750    0.87     0.38    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.08052)
## 
##     Null deviance: 19.479  on 243  degrees of freedom
## Residual deviance: 19.404  on 241  degrees of freedom
##   (27 observations deleted due to missingness)
## AIC: 82.71
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
## -0.8870  -0.1191  -0.0045   0.1349   1.4981  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.9437     0.0299   65.12   <2e-16 ***
## shotVaccinated   0.0355     0.0376    0.94     0.35    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.08019)
## 
##     Null deviance: 19.479  on 243  degrees of freedom
## Residual deviance: 19.407  on 242  degrees of freedom
##   (27 observations deleted due to missingness)
## AIC: 80.75
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
## -21.45   -4.43   -0.92    2.99   69.10  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)
## (Intercept)         -0.3528     3.4053   -0.10     0.92
## age                  0.0487     0.0918    0.53     0.60
## shotVaccinated       5.1594     4.5063    1.14     0.25
## age:shotVaccinated  -0.0443     0.1144   -0.39     0.70
## 
## (Dispersion parameter for gaussian family taken to be 114.6)
## 
##     Null deviance: 31466  on 270  degrees of freedom
## Residual deviance: 30595  on 267  degrees of freedom
## AIC: 2060
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
## -21.32   -4.23   -0.88    2.79   69.41  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)  
## (Intercept)      0.6544     2.1965    0.30    0.766  
## age              0.0201     0.0547    0.37    0.713  
## shotVaccinated   3.4975     1.3809    2.53    0.012 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 114.2)
## 
##     Null deviance: 31466  on 270  degrees of freedom
## Residual deviance: 30612  on 268  degrees of freedom
## AIC: 2058
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
## -21.49   -4.49   -0.86    2.64   69.01  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)   
## (Intercept)        1.36       1.05    1.30   0.1956   
## shotVaccinated     3.62       1.34    2.71   0.0071 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 113.9)
## 
##     Null deviance: 31466  on 270  degrees of freedom
## Residual deviance: 30628  on 269  degrees of freedom
## AIC: 2056
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
## -21.58   -9.54   -2.03    7.47   43.18  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         13.4257     3.8531    3.48  0.00058 ***
## age                  0.0285     0.1039    0.27  0.78377    
## shotVaccinated      -6.7582     5.0989   -1.33  0.18616    
## age:shotVaccinated   0.1444     0.1295    1.12  0.26564    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 146.7)
## 
##     Null deviance: 39939  on 270  degrees of freedom
## Residual deviance: 39170  on 267  degrees of freedom
## AIC: 2127
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
## -22.56   -9.21   -1.93    7.54   43.62  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      10.145      2.490    4.07  6.1e-05 ***
## age               0.122      0.062    1.96    0.051 .  
## shotVaccinated   -1.345      1.566   -0.86    0.391    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 146.8)
## 
##     Null deviance: 39939  on 270  degrees of freedom
## Residual deviance: 39352  on 268  degrees of freedom
## AIC: 2126
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
## -21.44   -8.96   -1.69    7.89   43.25  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    9.830      2.462    3.99  8.4e-05 ***
## age            0.108      0.060    1.81    0.072 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 146.7)
## 
##     Null deviance: 39939  on 270  degrees of freedom
## Residual deviance: 39461  on 269  degrees of freedom
## AIC: 2125
## 
## Number of Fisher Scoring iterations: 2
```


<a id="ec50"></a>
### EC50

<a id="ec50h1pdm09"></a>
#### H1 pandemic 2009: both shot and age without interaction, but almost
the shot alone

```
## 
## Call:
## glm(formula = H1_pdm09_log ~ age * shot, data = ec_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -0.7154  -0.2117   0.0027   0.1946   0.7970  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.30591    0.10063   12.98   <2e-16 ***
## age                 0.00158    0.00271    0.58     0.56    
## shotVaccinated     -0.00129    0.13267   -0.01     0.99    
## age:shotVaccinated  0.00485    0.00336    1.44     0.15    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.09835)
## 
##     Null deviance: 30.009  on 269  degrees of freedom
## Residual deviance: 26.160  on 266  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 146
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
## -0.7801  -0.2149  -0.0075   0.1816   0.8264  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.19489    0.06492   18.41  < 2e-16 ***
## age             0.00472    0.00161    2.93   0.0037 ** 
## shotVaccinated  0.18084    0.04067    4.45  1.3e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.09874)
## 
##     Null deviance: 30.009  on 269  degrees of freedom
## Residual deviance: 26.365  on 267  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 146.1
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
## -0.7194  -0.2010  -0.0098   0.1962   0.8103  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.3618     0.0316   43.16  < 2e-16 ***
## shotVaccinated   0.2099     0.0400    5.25  3.1e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1015)
## 
##     Null deviance: 30.009  on 269  degrees of freedom
## Residual deviance: 27.212  on 268  degrees of freedom
##   (1 observation deleted due to missingness)
## AIC: 152.6
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
## -0.9319  -0.2086   0.0037   0.1857   1.0795  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.781456   0.103546   17.20   <2e-16 ***
## age                 0.008540   0.002793    3.06   0.0025 ** 
## shotVaccinated      0.360182   0.137026    2.63   0.0091 ** 
## age:shotVaccinated -0.000691   0.003479   -0.20   0.8428    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1059)
## 
##     Null deviance: 40.268  on 270  degrees of freedom
## Residual deviance: 28.288  on 267  degrees of freedom
## AIC: 166.7
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
## -0.9373  -0.2090   0.0038   0.1857   1.0754  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.79715    0.06677   26.91  < 2e-16 ***
## age             0.00810    0.00166    4.87  1.9e-06 ***
## shotVaccinated  0.33429    0.04198    7.96  4.8e-14 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.1056)
## 
##     Null deviance: 40.268  on 270  degrees of freedom
## Residual deviance: 28.293  on 268  degrees of freedom
## AIC: 164.7
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
##    Min      1Q  Median      3Q     Max  
## -1.867  -0.295  -0.008   0.313   1.691  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         0.19520    0.16680    1.17    0.243    
## age                 0.02253    0.00448    5.03  8.9e-07 ***
## shotVaccinated     -0.49137    0.21961   -2.24    0.026 *  
## age:shotVaccinated  0.01355    0.00556    2.44    0.016 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2684)
## 
##     Null deviance: 112.382  on 267  degrees of freedom
## Residual deviance:  70.851  on 264  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 414
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
## -1.9062  -0.2842  -0.0018   0.3052   1.7410  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    -0.11564    0.10837   -1.07     0.29    
## age             0.03131    0.00268   11.67   <2e-16 ***
## shotVaccinated  0.01772    0.06789    0.26     0.79    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2734)
## 
##     Null deviance: 112.382  on 267  degrees of freedom
## Residual deviance:  72.442  on 265  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 418
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
## -1.9182  -0.2884  -0.0021   0.2996   1.7455  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -0.1112     0.1068   -1.04      0.3    
## age           0.0315     0.0026   12.11   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2724)
## 
##     Null deviance: 112.382  on 267  degrees of freedom
## Residual deviance:  72.461  on 266  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 416
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H2_log ~ 0 + age, data = ec_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -1.913  -0.311  -0.018   0.307   1.769  
## 
## Coefficients:
##     Estimate Std. Error t value Pr(>|t|)    
## age 0.028891   0.000776    37.2   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2725)
## 
##     Null deviance: 450.432  on 268  degrees of freedom
## Residual deviance:  72.756  on 267  degrees of freedom
##   (3 observations deleted due to missingness)
## AIC: 415.1
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
## -1.2203  -0.3239  -0.0396   0.3059   1.3554  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         3.76899    0.15288   24.65  < 2e-16 ***
## age                -0.01492    0.00412   -3.62  0.00036 ***
## shotVaccinated     -0.09503    0.20231   -0.47  0.63894    
## age:shotVaccinated  0.00819    0.00514    1.59  0.11217    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2309)
## 
##     Null deviance: 67.261  on 270  degrees of freedom
## Residual deviance: 61.662  on 267  degrees of freedom
## AIC: 377.9
## 
## Number of Fisher Scoring iterations: 2
```

```
## 
## Call:
## glm(formula = H3_log ~ age + shot, data = ec_data)
## 
## Deviance Residuals: 
##    Min      1Q  Median      3Q     Max  
## -1.251  -0.321  -0.039   0.289   1.379  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     3.58301    0.09905   36.17  < 2e-16 ***
## age            -0.00964    0.00247   -3.91  0.00012 ***
## shotVaccinated  0.21184    0.06227    3.40  0.00077 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2323)
## 
##     Null deviance: 67.261  on 270  degrees of freedom
## Residual deviance: 62.249  on 268  degrees of freedom
## AIC: 378.4
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
## -2.4651  -0.3285   0.0561   0.3296   2.4023  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.28820    0.21304    6.05  5.1e-09 ***
## age                 0.00636    0.00573    1.11     0.27    
## shotVaccinated      0.30454    0.28297    1.08     0.28    
## age:shotVaccinated -0.00497    0.00716   -0.69     0.49    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4448)
## 
##     Null deviance: 117.89  on 264  degrees of freedom
## Residual deviance: 116.11  on 261  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 543.4
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
## -2.4747  -0.3166   0.0391   0.3448   2.4266  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.40069    0.13807   10.14   <2e-16 ***
## age             0.00318    0.00343    0.93     0.36    
## shotVaccinated  0.11770    0.08687    1.35     0.18    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.444)
## 
##     Null deviance: 117.89  on 264  degrees of freedom
## Residual deviance: 116.32  on 262  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 541.8
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
## -2.4576  -0.3127   0.0413   0.3483   2.3833  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.5130     0.0660   22.94   <2e-16 ***
## shotVaccinated   0.1377     0.0841    1.64      0.1    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4437)
## 
##     Null deviance: 117.89  on 264  degrees of freedom
## Residual deviance: 116.70  on 263  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 540.7
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
## -2.4384  -0.3344   0.0546   0.3292   2.4849  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.42760    0.13685    10.4   <2e-16 ***
## age          0.00434    0.00333     1.3     0.19    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.4454)
## 
##     Null deviance: 117.89  on 264  degrees of freedom
## Residual deviance: 117.13  on 263  degrees of freedom
##   (6 observations deleted due to missingness)
## AIC: 541.7
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
## -1.2335  -0.3427  -0.0216   0.2751   1.3736  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.07372    0.15304    7.02  1.9e-11 ***
## age                 0.00921    0.00413    2.23    0.026 *  
## shotVaccinated      0.03848    0.20252    0.19    0.849    
## age:shotVaccinated  0.00618    0.00514    1.20    0.231    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2314)
## 
##     Null deviance: 76.732  on 270  degrees of freedom
## Residual deviance: 61.791  on 267  degrees of freedom
## AIC: 378.4
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
## -1.3121  -0.3283  -0.0367   0.2610   1.3791  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     0.93334    0.09895    9.43  < 2e-16 ***
## age             0.01319    0.00246    5.36  1.8e-07 ***
## shotVaccinated  0.27011    0.06221    4.34  2.0e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2318)
## 
##     Null deviance: 76.732  on 270  degrees of freedom
## Residual deviance: 62.125  on 268  degrees of freedom
## AIC: 377.9
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
## -1.5138  -0.1838   0.0037   0.1827   1.0110  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.782908   0.089201   19.99   <2e-16 ***
## age                -0.003791   0.002406   -1.58     0.12    
## shotVaccinated     -0.009910   0.118043   -0.08     0.93    
## age:shotVaccinated  0.000318   0.002997    0.11     0.92    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07863)
## 
##     Null deviance: 21.512  on 270  degrees of freedom
## Residual deviance: 20.993  on 267  degrees of freedom
## AIC: 85.87
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
## -1.5156  -0.1824   0.0025   0.1819   1.0125  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.77568    0.05752   30.87   <2e-16 ***
## age            -0.00359    0.00143   -2.50    0.013 *  
## shotVaccinated  0.00202    0.03616    0.06    0.955    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07834)
## 
##     Null deviance: 21.512  on 270  degrees of freedom
## Residual deviance: 20.994  on 268  degrees of freedom
## AIC: 83.88
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
## -1.5169  -0.1827   0.0034   0.1824   1.0130  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.77615    0.05679   31.28   <2e-16 ***
## age         -0.00357    0.00138   -2.58    0.011 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07805)
## 
##     Null deviance: 21.512  on 270  degrees of freedom
## Residual deviance: 20.994  on 269  degrees of freedom
## AIC: 81.89
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
## -1.1667  -0.1626   0.0067   0.1755   0.5875  
## 
## Coefficients:
##                     Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         1.267606   0.087276   14.52   <2e-16 ***
## age                 0.001476   0.002354    0.63     0.53    
## shotVaccinated     -0.058922   0.115495   -0.51     0.61    
## age:shotVaccinated -0.000506   0.002932   -0.17     0.86    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07527)
## 
##     Null deviance: 20.468  on 270  degrees of freedom
## Residual deviance: 20.097  on 267  degrees of freedom
## AIC: 74.04
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
## -1.1688  -0.1622   0.0059   0.1777   0.5848  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1.27910    0.05628   22.73   <2e-16 ***
## age             0.00115    0.00140    0.82    0.412    
## shotVaccinated -0.07789    0.03538   -2.20    0.029 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.075)
## 
##     Null deviance: 20.468  on 270  degrees of freedom
## Residual deviance: 20.099  on 268  degrees of freedom
## AIC: 72.07
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
## -1.1759  -0.1593   0.0124   0.1742   0.5780  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      1.3196     0.0270   48.94   <2e-16 ***
## shotVaccinated  -0.0707     0.0343   -2.06     0.04 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07491)
## 
##     Null deviance: 20.468  on 270  degrees of freedom
## Residual deviance: 20.150  on 269  degrees of freedom
## AIC: 70.75
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
## -1.1283  -0.1631  -0.0046   0.1922   0.6238  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.260854   0.056064   22.49   <2e-16 ***
## age         0.000383   0.001367    0.28     0.78    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.07607)
## 
##     Null deviance: 20.468  on 270  degrees of freedom
## Residual deviance: 20.462  on 269  degrees of freedom
## AIC: 74.93
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
## -1.0535  -0.3436  -0.0355   0.2662   1.5016  
## 
## Coefficients:
##                    Estimate Std. Error t value Pr(>|t|)    
## (Intercept)         2.50812    0.14551   17.24   <2e-16 ***
## age                -0.00933    0.00392   -2.38    0.018 *  
## shotVaccinated     -0.10581    0.19256   -0.55    0.583    
## age:shotVaccinated  0.00631    0.00489    1.29    0.198    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2092)
## 
##     Null deviance: 57.883  on 270  degrees of freedom
## Residual deviance: 55.865  on 267  degrees of freedom
## AIC: 351.1
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
## -1.0525  -0.3496  -0.0331   0.2807   1.5161  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     2.36470    0.09412   25.12   <2e-16 ***
## age            -0.00526    0.00234   -2.25    0.025 *  
## shotVaccinated  0.13084    0.05918    2.21    0.028 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2098)
## 
##     Null deviance: 57.883  on 270  degrees of freedom
## Residual deviance: 56.214  on 268  degrees of freedom
## AIC: 350.8
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
## -1.1282  -0.3394  -0.0353   0.2878   1.5545  
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.39535    0.09377   25.55   <2e-16 ***
## age         -0.00398    0.00229   -1.74    0.083 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2128)
## 
##     Null deviance: 57.883  on 270  degrees of freedom
## Residual deviance: 57.239  on 269  degrees of freedom
## AIC: 353.7
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
## -1.1201  -0.3380  -0.0279   0.2776   1.4821  
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)      2.1791     0.0455   47.93   <2e-16 ***
## shotVaccinated   0.0978     0.0577    1.69    0.092 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## (Dispersion parameter for gaussian family taken to be 0.2129)
## 
##     Null deviance: 57.883  on 270  degrees of freedom
## Residual deviance: 57.273  on 269  degrees of freedom
## AIC: 353.9
## 
## Number of Fisher Scoring iterations: 2
```



[1]: http://r-eco-evo.blogspot.ch/2011/08/comparing-two-regression-slopes-by.html
