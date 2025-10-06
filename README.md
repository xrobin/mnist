[![Build Status](https://travis-ci.org/xrobin/mnist.svg?branch=master)](https://travis-ci.org/xrobin/mnist)
[![Codecov coverage](https://codecov.io/github/xrobin/mnist/branch/master/graphs/badge.svg)](https://codecov.io/github/xrobin/mnist)
mnist
=============

This package makes [the MNIST dataset](http://yann.lecun.com/exdb/mnist/) easily accessible in R.

It also provides a few convenience functions, some of them taken from [this gist by brendano](https://gist.github.com/brendano/39760).

[See my blog for an example](https://xavier.robin.name/en/blog/2022/06/11/deep-learning-of-mnist-handwritten-digits).

Installation
-------

The package cannot be made available on the CRAN (the dataset is not open source, some of the code included is copyrighted), but can be installed easily with  [devtool](https://github.com/hadley/devtools/wiki) (make sure you follow [the full instructions to get started](http://www.rstudio.com/projects/devtools/)):

```R
install.packages("devtools")
library("devtools")
devtools::install_github("xrobin/mnist")
```
The first time the package is loaded, the `mnist` dataset is automatically downloaded from [the MNIST database](http://yann.lecun.com/exdb/mnist) and loaded into the global environment. Subsequently the dataset is simply loaded into the global environment.

Getting started
-------

```R
library(mnist)
str(mnist)
plot.mnist()
?mnist
```
