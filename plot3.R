
## ################################################################################################
## Function Plot3 - Creates the 3rd plot for Course Assignment 1.  
##                  The plot is a line graph of the data/time (on the x-axis)
##                  vs. the three Sub_metering_xxx fields (on the y-axis) that is saved to a png file. 
##
## Notes - Made this a function for maintainability and understandibility, but the assignment could
##         have also just been a straight R script.
##         Takes as an input, the data file and plot file names
## ################################################################################################
plot3 <- function(data_file_name = "household_power_consumption.txt", plot_file_name = "plot3.png") 
{
## First read in the data from the file
power_consumption_ds <- read.table(data_file_name, header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 1, 7)), na.strings="?")

## Now select out a subset of the original data between 2007-02-01 and 2007-02-02
power_consumption_ds <- power_consumption_ds[with(power_consumption_ds, Date == "1/2/2007" | Date == "2/2/2007"), ]

## Now add a date-time field that will be used in creating a plot
power_consumption_ds$Date_time <- strptime(paste(power_consumption_ds$Date, power_consumption_ds$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")


## Open up the png device to which the plot will be written
png(filename = plot_file_name, width = 480, height = 480, units = "px")

## Now create a line plot with Date/Time on the x-axis and the 3 sub_metering values on the y-axis,
## each one in a different color
with(power_consumption_ds, plot(x = Date_time, y = Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering"))
with(power_consumption_ds, lines(x = Date_time, y = Sub_metering_1, type = "l", col="black"))
with(power_consumption_ds, lines(x = Date_time, y = Sub_metering_2, type = "l", col="red"))
with(power_consumption_ds, lines(x = Date_time, y = Sub_metering_3, type = "l", col="blue"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Now close the png device
dev.off()
}