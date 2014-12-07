## ################################################################################################
## Function Plot1 - Creates the 1st plot for Course Assignment 1.  
##                  The plot is a histogram of the Global_active_power field that is saved to a png file. 
##
## Notes - Made this a function for maintainability and understandibility, but the assignment could
##         have also just been a straight R script.
##         Takes as an input, the data file and plot file names
## ################################################################################################
plot1 <- function(data_file_name = "household_power_consumption.txt", plot_file_name = "plot1.png") 
{
## First read in the data from the file
power_consumption_ds <- read.table(data_file_name, header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 1, 7)), na.strings="?")

## Now select out a subset of the original data between 2007-02-01 and 2007-02-02
power_consumption_ds <- power_consumption_ds[with(power_consumption_ds, Date == "1/2/2007" | Date == "2/2/2007"), ]

## Open up the png device to which the histogram will be written
png(filename = plot_file_name, width = 480, height = 480, units = "px")

## Now create a histogram of the Global_active_power data with the correct title, x-axis label, and color
## for the bars.  Settling on orangered2 as the bar color since it most closely matches
## on my screen what is shown in the assignment's reference graph.
hist(power_consumption_ds$Global_active_power, col = "orangered2", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Now close the png device
dev.off()
}
