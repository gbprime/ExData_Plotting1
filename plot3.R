# *********************************************************************************************
## Gabriel Becerra
## Data Analysis
## Project 1 - File: plot3.R
## *********************************************************************************************

source('dataReader.R')
source('export.R')

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
plot3 <- function(file) {
  # reading the file and allocating info to the dataFrame object.
  dataFrame <- readData(file)
  
  # casting the sub metering info as numeric
  dataFrame$Sub_metering_1 <- as.numeric(as.character(dataFrame$Sub_metering_1))
  dataFrame$Sub_metering_2 <- as.numeric(as.character(dataFrame$Sub_metering_2))
  dataFrame$Sub_metering_3 <- as.numeric(as.character(dataFrame$Sub_metering_3))
  
  # modifying the dataFrame object based on the Date and Time requirements
  dataFrame <- transform(dataFrame, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  # Creating the plot.
  plot(dataFrame$timestamp,
       dataFrame$Sub_metering_1, 
       type="l", xlab="", ylab="Energy sub metering")
  
  # Formatting the plot: lines and lables as required.
  lines(dataFrame$timestamp,dataFrame$Sub_metering_2,col="red")
  lines(dataFrame$timestamp,dataFrame$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), 
         c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
         lty=c(1,1), lwd=c(1,1))
  
  export("plot3.png")
}