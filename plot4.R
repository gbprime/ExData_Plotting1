# *********************************************************************************************
## Gabriel Becerra
## Data Analysis
## Project 1 - File: plot4.R
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
## Plot Layout is changed from (1,1) to (2,2) using the par command.
## 
## The function doesn't return a value.  Instead, it uses the graphics package to create and 
## copy the histogram/plot to the current folder as required.
## *********************************************************************************************
plot4 <- function(file) {
  # reading the file and allocating info to the dataFrame object.
  dataFrame <- readData(file)
  
  # casting the sub metering info as numeric
  dataFrame$Sub_metering_1 <- as.numeric(as.character(dataFrame$Sub_metering_1))
  dataFrame$Sub_metering_2 <- as.numeric(as.character(dataFrame$Sub_metering_2))
  dataFrame$Sub_metering_3 <- as.numeric(as.character(dataFrame$Sub_metering_3))
  
  # casting active, reactive and voltage as numeric values
  dataFrame$Global_active_power <- as.numeric(as.character(dataFrame$Global_active_power))
  dataFrame$Global_reactive_power <- as.numeric(as.character(dataFrame$Global_reactive_power))
  dataFrame$Voltage <- as.numeric(as.character(dataFrame$Voltage))
  
  # modifying the dataFrame object based on the Date and Time requirements
  dataFrame <- transform(dataFrame, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  # modifying the layout in order to match the specified format
  par(mfrow=c(2,2))
  
  # Creating Plot 1
  plot(dataFrame$timestamp,
       dataFrame$Global_active_power, 
       type="l", xlab="", ylab="Global Active Power")

  # Creating Plot 2
  plot(dataFrame$timestamp,
       dataFrame$Voltage, 
       type="l", xlab="datetime", ylab="Voltage")
  
  # Creating Plot 3
  plot(dataFrame$timestamp,
       dataFrame$Sub_metering_1, 
       type="l", xlab="", ylab="Energy sub metering")
  
  lines(dataFrame$timestamp,dataFrame$Sub_metering_2,col="red")
  lines(dataFrame$timestamp,dataFrame$Sub_metering_3,col="blue")
  # Removing the box, shrinking the text, etc.
  legend("topright", col=c("black","red","blue"), 
         c("Sub_metering_1  ",
           "Sub_metering_2  ", 
           "Sub_metering_3  "),
         lty=c(1,1), bty="n", cex=.5) 
  
  # Creating Plot 4
  plot(dataFrame$timestamp,
       dataFrame$Global_reactive_power, 
       type="l", xlab="datetime", ylab="Global_reactive_power")
  
  exportPlot("plot4.png")
}