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

png("Plot4.png", width = 480, height=480, type="window")

par(mfcol = c(2,2))

with(df, plot(Time, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

with(df, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

## add the 3 sets of points (lines)

points(df$Time, df$Sub_metering_1, col = "black", type = "l")
points(df$Time, df$Sub_metering_2, col = "red", type = "l")
points(df$Time, df$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"), bty ="n")


## next plot shows Voltage line on Y and datetime on X.  

with(df, plot(Time, Voltage, type="l", xlab="datetime"))

## last plot shows Global_reactive_power on y and datetime on X

with(df, plot(Time, Global_reactive_power, type = "l", xlab="datetime"))

## save to file 

## dev.copy(png, file="plot4.png")
dev.off()