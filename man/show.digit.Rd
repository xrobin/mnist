\name{show.digit}
\alias{show.digit}

\title{
Show a MNIST digit
}
\description{
Plots an image representing the supplied MNIST digit
}

\usage{
show.digit(digit, col=gray(12:1/12), ...)
}

\arguments{
	\item{digit}{a digit from the \code{mnist} dataset.}
	\item{col}{a vector of colors to represent the digit. See \code{\link{image}} for more details.}
	\item{\dots}{further arguments passed to \code{\link{image}}.}
}
\details{
This function uses the \code{\link{image}} graphics function to represent a digit in a plot window.
}
\value{None}
\references{
	Freely inspired from https://gist.github.com/brendano/39760
}
\author{
	Xavier Robin
}

\seealso{
\code{\link{mnist}}
}
\examples{
data(mnist)

show.digit(mnist$test$x[1,])
show.digit(mnist$train$x[1,])

good.digits <- c(11, 3, 2, 91, 20, 188, 92, 1, 111, 13)
rainbow <- c("#FF0000FF", "#0000FFFF", "#964B00FF", "#FF00FFFF", "#00AAAAFF", "#00EE00FF", "#FFFFFFFF", "#000000FF", "#AAAAAAFF", "#FF9900FF")
alphas.gen <- expand.grid(c(0:9, LETTERS[1:6]), c(0:9, LETTERS[1:6]))
alphas <- paste(alphas.gen[,2], alphas.gen[,1], sep="")
circle.borders <- rep("black", 10)
circle.borders[c(2, 8)] <- "white"

layout(matrix(1:16, 4, 4))
par(cex=1.5)
sapply(1:10, function(i) {show.digit(mnist$test$x[good.digits[i],], col=paste(substring(rainbow[ifelse(i == 7, 8, i)], 1, 7), if (i ==7) rev(alphas) else alphas, sep=""))})

}

\keyword{ graphics }
