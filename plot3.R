## Project 1 - Kenneth Richlin - exdata-033
library("dplyr", lib.loc="C:/Program Files/R/R-3.2.1/library")
setwd("~/R Projects/EDA_Project1")

## Reading and cleaning the data

## Read in data from file "household_power_consumption.txt" 
## make sure ? strings are represented as NA values

file <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))

## make sure the dates are formatted correctly - use POSTix

file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  

file$timetemp <- paste(file$Date, file$Time)  
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")  

## Subsetting the data

## we are only interested in two days : 2007-02-01 AND 2007-02-02, so create a subset

df <- subset(file, Date >="2007-02-01" & Date <="2007-02-02")

## Make the  requested plots


## Energy sub metering (y axis) by time (x axis).
## line type
## Sub_metering_1 in black
## Sub_metering_2 in red
## Sub_metering_3 in Blue
## y label - "Energy sub metering"
## no x label
## no title


## png("Plot3.png", width = 480, height=480, type="window")

## Start with Sub_metering_1 but don't populate data
png("Plot3.png", width = 480, height=480, type="window")

with(df, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

## add the 3 sets of points (lines)

points(df$Time, df$Sub_metering_1, col = "black", type = "l")
points(df$Time, df$Sub_metering_2, col = "red", type = "l")
points(df$Time, df$Sub_metering_3, col = "blue", type = "l")

## Add legend in topright

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))

## copy plot as PNG file with dimensions 480 x 480 pixels.

## dev.copy(png, file="plot3.png")
dev.off()

