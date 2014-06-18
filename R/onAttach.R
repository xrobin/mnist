.onAttach <- function(lib, pkg) {
	# It makes no sense to request the user to say data(mnist) after loading the package
	# with library(mnist), so load it automatically
	mnist_data_file <- system.file("data/mnist.RData", package="mnist")
	if (mnist_data_file == "") {
		cat("Downloading mnist dataset...")
		mnist <- download.mnist()
		dir.create(paste(system.file(package="mnist"), "data", sep=.Platform$file.sep))
		save(mnist, file = paste(system.file(package="mnist"), "data", "mnist.RData", sep=.Platform$file.sep))
		cat(" done!\n")
	}
	data(mnist) 
	packageStartupMessage("'mnist' dataset loaded.")
}