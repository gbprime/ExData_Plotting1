## *********************************************************************************************
## Gabriel Becerra
## Data Analysis
## Project 1 - File: plot1.R
## *********************************************************************************************

source('dataReader.R')

## *********************************************************************************************
## This function takes 1 parameter as input: filename.txt
##
## This function follows the recommendations of formatting the columns and subsetting data in
## order to improve time and space usage.
##
## The function doesn't return a value.  Instead, it uses the graphics package to create and 
## copy the histogram/plot to the current folder as required.
## *********************************************************************************************
plot1 <- function(file) {
  # reading the file and allocating info to the dataFrame object.
  dataFrame <- readData(file)
  
  # casting the active power as numeric values
  dataFrame$Global_active_power <- as.numeric(as.character(dataFrame$Global_active_power))
  
#   plot(dataFrame$Global_active_power, 
#        type="l", xlab="Global Active Power (kilowatts)", ylab="")
  
  hist(dataFrame$Global_active_power, 
       main = paste("Global Active Power"), 
       col="red", 
       xlab="Global Active Power (kilowatts)")
  
  # using the graphics package to copy the plot to the current folder.
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("plot1.png has been saved in", getwd())
}