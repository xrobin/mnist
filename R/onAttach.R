.onAttach <- function(lib, pkg) {
	# It makes no sense to request the user to say data(mnist) after loading the package
	# with library(mnist), so load it automatically
	mnist_data_file <- system.file("data/mnist.RData", package="mnist")
	if (mnist_data_file == "") {
		packageStartupMessage("Downloading mnist dataset...")
		dir.create(paste(system.file(package="mnist"), "data", sep=.Platform$file.sep))
		mnist <- download.mnist(global = TRUE)
	}
	data(mnist) 
	packageStartupMessage("'mnist' dataset loaded.")
}