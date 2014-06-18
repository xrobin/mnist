\name{mnist}
\alias{mnist}
\alias{download.mnist}
\title{MNIST handwritten digits dataset}

\description{
A dataset of handwritten digits provided by \url{http://yann.lecun.com/exdb/mnist/}.
}

\usage{
mnist
download.mnist()
}

\format{A list with:
	\itemize{
		\item \code{train, test}: 60000 train and 10000 test digits. Both contain \code{x} (data) and \code{y} (labels) elements. \code{x} is a matrix with 784 columns (pixels).
		\item \code{show.digit}: a function to display a digit. Takes the following arguments:
		\itemize{
			\item \code{digit}: a digit, i.e. a row of \code{mnist$train$x} or \code{mnist$test$x}
			\item \code{col}: a colour gradient, see \code{\link{image}} for more details
			\item \code{\dots}: further arguments for \code{\link{image}}
		}
	}
}

\details{
At the first time the package is loaded, the mnist dataset is downloaded from \url{http://yann.lecun.com/exdb/mnist/} and saved in the package \code{data} directory.
}

\source{
Y. LeCun, L. Bottou, Y. Bengio, and P. Haffner. "Gradient-based learning applied to document recognition." Proceedings of the IEEE, 86(11):2278-2324, November 1998.

The dataset is downloaded with code inspired from: \url{https://gist.github.com/brendano/39760}
}

\examples{
data(mnist) # the dataset is implicitly loaded when the package is attached, so this line is optionnal
str(mnist)

show.digit(mnist$test$x[1:10,])

\dontrun{
mnist.copy <- download.mnist()
}
}

\keyword{ dataset }