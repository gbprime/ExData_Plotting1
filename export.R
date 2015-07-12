exportPlot <- function(filename) {
  # using the graphics package to copy the plot to the current folder.
  dev.copy(png, file=filename, width=480, height=480)
  dev.off()
  cat("Your plot is ready!")
}