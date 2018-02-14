context("show.digits")


test_that("'show.digits' works", {
	sd1 <- function() show.digit(mnist$test$x[1,])
	vdiffr::expect_doppelganger("show.digit.1", sd1)
})


test_that("'show.digits' 'col' argument works", {
	sdrainbow <- function() show.digit(mnist$test$x[1,], col = rainbow(255))
	vdiffr::expect_doppelganger("show.digit.rainbow", sdrainbow)
})