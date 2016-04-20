mnist
=============

This package makes [the MNIST dataset](http://yann.lecun.com/exdb/mnist/) easily accessible in R.

It also provides a few convenience functions, some of them taken from [this gist by brendano](https://gist.github.com/brendano/39760).

Installation
-------

The package cannot be made available on the CRAN (the dataset is not open source, some of the code included is copyrighted), but can be installed easily with  [devtool](https://github.com/hadley/devtools/wiki) (make sure you follow [the full instructions to get started](http://www.rstudio.com/projects/devtools/)):

```R
install.packages("devtools")
library("devtools")
devtools::install_github("xrobin/mnist")
```

Getting started
-------

```R
library(mnist)
plot.mnist()
?mnist
```
