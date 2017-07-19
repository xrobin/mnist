context("Data")


test_that("'mnist' is available after package load", {
	mnist.dl <- download.mnist()
	expect_output_file(str(mnist), "../output/expect-str-mnist-output.txt")
})

test_that("mnist data looks OK", {
	expect_identical(names(mnist), c("train", "test"))
	expect_identical(names(mnist$train), c("x", "y"))
	expect_identical(names(mnist$test), c("x", "y"))
	expect_is(mnist$train$x, "matrix")
	expect_is(mnist$train$y, "integer")
	expect_is(mnist$test$x, "matrix")
	expect_is(mnist$test$y, "integer")
	expect_identical(dim(mnist$train$x), c(60000L, 784L))
	expect_identical(length(mnist$train$y), 60000L)
	expect_identical(dim(mnist$test$x), c(10000L, 784L))
	expect_identical(length(mnist$test$y), 10000L)
	
	expect_identical(range(mnist$train$x), range(0, 1))
	expect_identical(range(mnist$train$y), range(0:9))
	expect_identical(range(mnist$test$x), range(0, 1))
	expect_identical(range(mnist$test$y), range(0:9))
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