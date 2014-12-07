## ################################################################################################
## Function Plot2 - Creates the 2nd plot for Course Assignment 1.  
##                  The plot is a line graph of the data/time (on the x-axis)
##                  vs. the Global_active_power fields (on the y-axis) that is saved to a png file. 
##
## Notes - Made this a function for maintainability and understandibility, but the assignment could
##         have also just been a straight R script.
##         Takes as an input, the data file and plot file names
## ################################################################################################
plot2 <- function(data_file_name = "household_power_consumption.txt", plot_file_name = "plot2.png") 
{
## First read in the data from the file
power_consumption_ds <- read.table(data_file_name, header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 1, 7)), na.strings="?")

## Now select out a subset of the original data between 2007-02-01 and 2007-02-02
power_consumption_ds <- power_consumption_ds[with(power_consumption_ds, Date == "1/2/2007" | Date == "2/2/2007"), ]

## Now add a date-time field that will be used in creating a plot
power_consumption_ds$Date_time <- strptime(paste(power_consumption_ds$Date, power_consumption_ds$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

## Open up the png device to which the plot will be written
png(filename = plot_file_name, width = 480, height = 480, units = "px")

## Now create a line plot with Date/Time on the x-axis and Global Active Power on the y-axis
with(power_consumption_ds, plot(x = Date_time, y = Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))

## Now close the png device
dev.off()
}
