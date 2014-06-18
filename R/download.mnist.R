# Load the MNIST digit recognition dataset into R
# http://yann.lecun.com/exdb/mnist/
# assume you have all 4 files and gunzip'd them
# creates train$n, train$x, train$y and test$n, test$x, test$y
# e.g. train$x is a 60000 x 784 matrix, each row is one digit (28x28)
# call: show_digit(train$x[5,]) to see a digit.
# brendan o'connor - gist.github.com/39760 - anyall.org

download.mnist <- function() {

	load_image_file <- function(conn) {
		readBin(conn, 'integer', n=1, size=4, endian='big')
		n = readBin(conn, 'integer', n=1, size=4, endian='big')
		nrow = readBin(conn, 'integer', n=1, size=4, endian='big')
		ncol = readBin(conn, 'integer', n=1, size=4, endian='big')
		x = readBin(conn, 'integer', n=n*nrow*ncol, size=1, signed=F)
		x = matrix(x,  ncol=nrow * ncol,  byrow=T)
		close(conn)
		return(x)
	}
	
	load_label_file <- function(conn) {
		readBin(conn, 'integer', n=1, size=4, endian='big')
		n = readBin(conn, 'integer', n=1, size=4, endian='big')
		y = readBin(conn, 'integer', n = n, size=1, signed=F)
		close(conn)
		return(y)
	}
	
	mnist <- list(
		train = list(),
		test = list()
	)
	mnist$train$x <- load_image_file(gzcon(url("http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz", "rb")))
	mnist$test$x <- load_image_file(gzcon(url("http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz", "rb")))
	mnist$train$y <- load_label_file(gzcon(url("http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz", "rb")))
	mnist$test$y <- load_label_file(gzcon(url("http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz", "rb")))
	
	return(mnist)
}
