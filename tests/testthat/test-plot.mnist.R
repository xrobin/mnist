context("plot.mnist")

test_that("'plot.mnist' works", {
	skip("Test has false positives")
	vdiffr::expect_doppelganger("plot.mnist.1", plot.mnist)
})


test_that("'plot.mnist' works with 2D PCA", {
	skip("Test has false positives")
	plot.mnist.2 <- function() {
		set.seed(42)
		pca <- prcomp(mnist$train$x)
		plot.mnist(prediction = predict(pca, mnist$test$x), reconstruction=tcrossprod(predict(pca, mnist$test$x)[,1:2], pca$rotation[,1:2]))
	}
	vdiffr::expect_doppelganger("plot.mnist.2", plot.mnist.2)
})


test_that("'plot.mnist' works", {
	skip("Test has false positives")
	plot.mnist.3 <- function() {
		set.seed(42)
		pca <- prcomp(mnist$train$x)
		plot.mnist(prediction = predict(pca, mnist$test$x), reconstruction=tcrossprod(predict(pca, mnist$test$x), pca$rotation))
	}
	vdiffr::expect_doppelganger("plot.mnist.3", plot.mnist.3)
})
