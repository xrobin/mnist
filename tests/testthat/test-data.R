context("Data")


test_that("'mnist' is available after package load", {
	mnist.dl <- download.mnist()
	expect_output_file(str(mnist), "../output/expect-str-mnist-output.txt")
})


test_that("can download mnist", {
	mnist.dl <- download.mnist()
	expect_identical(mnist, mnist.dl)
})


test_that("can download mnist with custom range", {
	mnist.dl.256 <- download.mnist(range = c(1, 256))
	expect_equal(mnist$train$x * 255 + 1, mnist.dl.256$train$x)
	expect_equal(mnist$test$x * 255 + 1, mnist.dl.256$test$x)
})