Shiny App Presentation
========================================================
author: Michael Garcia
date: August 1, 2018
autosize: true

First Slide
========================================================

The Stock Analysis app is used to provide a graphical representation of the
price changes and the closing price for a particular stock.

- First graph plots price change percent with upper and lower confidence intervals
 - Also includes fitted line
- Second graph plots closing price with a simple moving average.
 - This plot can change the number of days lag
- Both graphs can be adjusted for the date range

Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](Shiny App Presentation-figure/unnamed-chunk-2-1.png)
