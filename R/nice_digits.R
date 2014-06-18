
plot.mnist <- function(data = mnist$test$x, label = mnist$test$y + 1, model = prcomp(mnist$train$x),
					   prediction = predict(model, data)[,1:2], reconstruction = tcrossprod(prediction, model$rotation[,1:2]),
					   highlight.digits = c(11, 3, 2, 91, 20, 188, 92, 1, 111, 13),
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
					   ylim = NULL
					   ) {
	
	n.highlight <- length(highlight.digits)
	layout(cbind(seq_along(highlight.digits), matrix(21, nrow=n.highlight, ncol=15), seq_along(highlight.digits) + n.highlight))
	
	opar <- par(cex=cex)
	
	alphas.gen <- expand.grid(c(0:9, LETTERS[1:6]), c(0:9, LETTERS[1:6]))
	alphas <- paste(alphas.gen[,2], alphas.gen[,1], sep="")
	
	sapply(1:10, function(i) {show.digit(data[highlight.digits[i],], col=paste(str_sub(digits.col[label[highlight.digits[i]]], 1, 7), if (digits.alphas.reverse[i]) rev(alphas) else alphas, sep=""))})
	sapply(1:10, function(i) {show.digit(reconstruction[highlight.digits[i],], col=paste(str_sub(digits.col[label[highlight.digits[i]]], 1, 7), if (digits.alphas.reverse[i]) rev(alphas) else alphas, sep=""))})
	
	par(cex=cex, mar=c(3, 3, 0, 0), mgp=c(2, 1, 0))
	plot(prediction[, 1], prediction[, 2], xlab = xlab, ylab = ylab, xlim = xlim, ylim = ylim,
		 pch = pch, bg = pch.bg[label], col=pch.col[label], cex.axis=cex.axis, cex.lab=cex.lab)
	points(prediction[highlight.digits, 1], prediction[highlight.digits, 2], pch = pch, bg = pch.bg[label[highlight.digits]], col = pch.col[label[highlight.digits]], cex=cex.highlight)
	
	par(opar)
}

