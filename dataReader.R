# *********************************************************************************************
## Gabriel Becerra
## Data Analysis
## Project 1 - File: dataReader.R
## *********************************************************************************************

## *********************************************************************************************
## Reading data from the given file
## *********************************************************************************************
readData <- function(fileName) {
  # reading the file and allocating info to the dataFrame object.
  docInfo <- read.table(fileName, header=T, sep=";")
  docInfo$Date <- as.Date(docInfo$Date, format="%d/%m/%Y")
  dataFrame <- docInfo[(docInfo$Date=="2007-02-01") | (docInfo$Date=="2007-02-02"),]
  
  return(dataFrame)
}