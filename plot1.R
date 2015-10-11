## Project 1 - Kenneth Richlin - exdata-033 - plot 1
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

## Plot 1: Global Active Power histogram in red.  

## switch to red
## adjust scale
## add more bars - breaks
## title - global active power
## x axis - "Global Active Power (kilowatts)"

hist(df$Global_active_power, col = "red", breaks = 12, main ="Global Active Power", xlab="Global Active Power (kilowatts)")

## copy plot as PNG file with dimensions 480 x 480 pixels.

dev.copy(png, file="plot1.png")
dev.off()