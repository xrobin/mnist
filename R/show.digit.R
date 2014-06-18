# Adapted from https://gist.github.com/brendano/39760

show.digit <- function(digit, col=gray(12:1/12), ...) {
	opa <- par(mar = rep(0, 4))
	image(matrix(digit, nrow=28)[,28:1], col=col, axes = FALSE, ...)
	par(mar = opa)
}