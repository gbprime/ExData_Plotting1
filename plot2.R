## *********************************************************************************************
## Gabriel Becerra
## Data Analysis
## Project 1 - File: plot2.R
## *********************************************************************************************

## *********************************************************************************************
## This function takes 1 parameter as input: filename.txt
##
## This function follows the recommendations of formatting the columns and subsetting data in
## order to improve time and space usage.

## A new column titled "timestamp" is added to the dataFrame object. This column consists of the 
## Date and Time pasted together and reforamtted as a POSIXct class.
## 
## The function doesn't return a value.  Instead, it uses the graphics package to create and 
## copy the histogram/plot to the current folder as required.
## *********************************************************************************************
plot2 <- function(file) {
  # reading the file and allocating info to the dataFrame object.
  dataFrame <- readData(file)
  
  # casting active power as numeric values.
  dataFrame$Global_active_power <- as.numeric(as.character(dataFrame$Global_active_power))
  
  # modifying the dataFrame object based on the Date and Time requirements
  dataFrame <- transform(dataFrame, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(dataFrame$timestamp,
       dataFrame$Global_active_power, 
       type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  # using the graphics package to copy the plot to the current folder.
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}