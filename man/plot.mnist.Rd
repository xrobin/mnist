\name{plot.mnist}
\alias{plot.mnist}

\title{
Nice plot of the MNIST digits with dimensionality reduction
}
\description{
Plots MNIST digits (left), projections on a 2-D space (prediction, center) and their reconstructions (right).
}

\usage{
plot.mnist(x = mnist$test$x, label = mnist$test$y + 1, model = prcomp(mnist$train$x),
           predictions = predict(model, x)[,1:2], reconstructions = tcrossprod(predictions, model$rotation[,1:2]),
		   show.reconstructions = TRUE, highlight.digits = c(11, 3, 2, 91, 20, 188, 92, 1, 111, 13),
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
		   ylim = NULL,
		   ncol = 10,
		   ...)
}

\arguments{
	\item{x}{A Nx784 matrix of data from which to draw the MNIST digits.}
	\item{label}{A vector of length N with labels corresponding to \code{data}.}
	\item{model}{An optional model to compute predictions and reconstructions. If supplied, you probably need to supply \code{reconstructions} as well. Ignored when both \code{predictions} and \code{reconstructions} are provided}
	\item{predictions}{A Nx2 matrix with 2 columns containing predictions.}
	\item{reconstructions}{A Nx784 matrix with the reconstructions of the digits.}
	\item{show.reconstructions}{Whether to plot a column of reconstructions to the right.}
	\item{highlight.digits}{The indices of the P digits to draw in the margin, ideally 10 of them.}
	\item{digits.col}{A vector of P colors for the \code{highlight.digits}.}
	\item{digits.alphas.reverse}{A logical vector of length P, \code{TRUE} when the digits has to be plotted white-on-color, \code{FALSE} when the digit has to be plotted color-on-white.}
	\item{pch, pch.col, pch.bg}{Plotting character and associated \code{col} and \code{bg} properties for the central plot.}
	\item{cex,cex.axis, cex.lab, cex.highlight}{Character expansion factor for the center points, the center plot axis, the center plot labels and the highlight digit points, respectively.}
	\item{xlab, ylab}{Labels for the x and y axis, see  \code{\link{par}}}
	\item{xlim, ylim}{Plot limits, see \code{\link{par}}}
	\item{col}{a vector of colors to represent the digit. See \code{\link{image}} for more details.}
	\item{ncol}{Number of \code{\link{layout}} columns assigned to the central predictions plot. See \dQuote{Layout} section below.}
	\item{\dots}{further arguments passed to \code{\link{image}}.}
}
\details{
\code{plot.mnist} plots model \code{predictions} surrounded by a selection of the original digits (\code{x}) and, if requested (with \code{show.reconstructions = TRUE}), their \code{reconstructions}. The \code{highlight.digits} argument is an numeric index of which digits to highlight, in order.

\subsection{Layout}{
\code{plot.mnist} uses a graphical \code{\link{layout}}. The original digits \code{x} will always use exactly one column. If requested, the \code{reconstructions} will use a second one. The \code{ncol} argument controls how many columns are assigned to the \code{predictions} themselves and should be adjusted to the width of the graphical device. For instance if \code{ncol = 1} the projections will use 1/2 or 1/3 of the plot.

With a square device and 10 highlighted digits, \code{ncol = 8} will make the digits and reconstructions square. To have the predictions displayed in a square too, you should open a device with a 12:10 ratio. Graphical devices with a 16:10 ratio should use \code{ncol = 14} to have the predictions slightly stretched. If more or fewer than 10 digits are highlighted, \code{ncol} should be adjusted too. See the Examples sections for a demo.
}
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
# library(DeepLearning)
# plot.mnist(prediction = predict(trained.mnist.dbn, mnist$test$x), reconstruction=reconstruct(trained.mnist.dbn, mnist$test$x))

# With PCA
pca <- prcomp(mnist$train$x)
plot.mnist(prediction = predict(pca, mnist$test$x), reconstruction=tcrossprod(predict(pca, mnist$test$x)[,1:2], pca$rotation[,1:2]))

# Reconstruct with all 784 components of the prediction
plot.mnist(prediction = predict(pca, mnist$test$x), reconstruction=tcrossprod(predict(pca, mnist$test$x), pca$rotation))

# Note that it also works with no arguments - pca is performed
plot.mnist()

# Change the number of columns. Digits should be square in a square plot device
\dontrun{
plot.mnist(ncol = 8)
# Digits will be sqare in a 16:10 plot
plot.mnist(ncol = 14)
}

# With a different number of digits one should adjust ncol
mnist.02 <- mnist
mnist.02$train$x <- mnist$train$x[mnist$train$y < 3,]
mnist.02$train$y <- mnist$train$y[mnist$train$y < 3]
mnist.02$test$x <- mnist$test$x[mnist$test$y < 3,]
mnist.02$test$y <- mnist$test$y[mnist$test$y < 3]
pca <- prcomp(mnist.02$train$x)
plot.mnist(prediction = predict(pca, mnist.02$test$x)[,2:1], reconstruction=tcrossprod(predict(pca, mnist.02$test$x)[,1:2], pca$rotation[,1:2]),
           x = mnist.02$test$x, label = mnist.02$test$y + 1, highlight.digits = c(3, 2, 1),
           ncol = 1)

}

\keyword{ graphics }
