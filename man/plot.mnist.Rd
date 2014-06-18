\name{plot.mnist}
\alias{plot.mnist}

\title{
Nice plot of the MNIST digits with dimensionality reduction
}
\description{
Plots MNIST digits (left), projections on a 2-D space (prediction, center) and their reconstructions (right).
}

\usage{
plot.mnist <- function(data = mnist$test$x, label = mnist$test$y + 1, prediction, reconstruction, 
					   highlight.digits = c(11, 3, 2, 91, 20, 188, 92, 1, 111, 13),
					   digits.col = c("#FF0000FF", "#0000FFFF", "#964B00FF", "#FF00FFFF", "#00AAAAFF", "#00EE00FF", "#000000FF", "#000000FF", "#AAAAAAFF", "#FF9900FF"),
					   digits.alphas.reverse = c(FALSE, TRUE)[c(1, 1, 1, 1, 1, 1, 2, 1, 1, 1)],
					   pch = 21,
					   pch.col = c("black", "white")[c(1, 2, 1, 1, 1, 1, 1, 2, 1, 1)],
					   pch.bg = c("#FF0000FF", "#0000FFFF", "#964B00FF", "#FF00FFFF", "#00AAAAFF", "#00EE00FF", "#FFFFFFFF", "#000000FF", "#AAAAAAFF", "#FF9900FF"),
					   cex = 1.5,
					   cex.axis = .5,
					   cex.lab = .5,
					   cex.highlight = 2.5,
					   xlab = "Node 1",
					   ylab = "Node 2",
					   xlim = NULL,
					   ylim = NULL
					   )
}

\arguments{
	\item{data}{A Nx784 matrix of data from which to draw the MNIST digits.}
	\item{label}{A vector of length N with labels corresponding to \code{data}.}
	\item{predictions}{A Nx2 matrix with 2 columns containing predictions.}
	\item{predictions}{A Nx784 matrix with the reconstructions of the digits.}
	\item{highlight.digits}{The indices of the P digits to draw in the margin, ideally 10 of them.}
	\item{digits.col}{A vector of P colors for the \code{highlight.digits}.}
	\item{digits.alphas.reverse}{A logical vector of length P, \code{TRUE} when the digits has to be plotted white-on-color, \code{FALSE} when the digit has to be plotted color-on-white.}
	\item{pch,pch.col,pch}{Plotting character and associated properties for the central plot.}
	\item{cex,cex.axis, cex.lab, cex.highlight}{Character expansion factor for the center points, the center plot axis, the center plot labels and the highlight digit points, respectively.}
	\item{xlab, ylab}{Labels for the x and y axis, see  \code{\link{par}}}
	\item{xlim, ylim}{Plot limits, see \code{\link{par}}}
	\item{col}{a vector of colors to represent the digit. See \code{\link{image}} for more details.}
	\item{\dots}{further arguments passed to \code{\link{image}}.}
}
\details{
...
}
\value{None}
\author{
	Xavier Robin
}

\seealso{
\code{\link{mnist}}
}
\examples{
data(mnist)

# DeepBeliefNet
library(DeepLearning)
plot.mnist(prediction = predict(trained.mnist.dbn, mnist$test$x), reconstruction=reconstruct(trained.mnist.dbn, mnist$test$x))

# With PCA
pca <- prcomp(mnist$train$x)
plot.mnist(prediction = predict(pca, mnist$test$x), reconstruction=tcrossprod(predict(pca, mnist$test$x)[,1:2], pca$rotation[,1:2]))

# Reconstruct with all 784 components of the prediction
plot.mnist(prediction = predict(pca, mnist$test$x), reconstruction=tcrossprod(predict(pca, mnist$test$x), pca$rotation))

}

\keyword{ graphics }
