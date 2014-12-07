## ################################################################################################
## Function Plot4 - Creates the 4th plot for Course Assignment 1.  
##                  The plot is a set of 4 graphs:
##                  1) A histogram of data/time vs. global active power
##                  2) A line graph of Date/Time vs. Voltage
##                  3) A line graph of Date/Time vs. the 3 sub_metering_xxx fields
##                  4) A line graph of Date/Time vs. Global_reactive_power
##
## Notes - Made this a function for maintainability and understandibility, but the assignment could
##         have also just been a straight R script.
##         Takes as an input, the data file and plot file names
## ################################################################################################
plot4 <- function(data_file_name = "household_power_consumption.txt", plot_file_name = "plot4.png") 
{
  ## First read in the data from the file
  power_consumption_ds <- read.table(data_file_name, header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 1, 7)), na.strings="?")
  
  ## Now select out a subset of the original data between 2007-02-01 and 2007-02-02
  power_consumption_ds <- power_consumption_ds[with(power_consumption_ds, Date == "1/2/2007" | Date == "2/2/2007"), ]
  
  ## Now add a date-time field that will be used in creating a plot
  power_consumption_ds$Date_time <- strptime(paste(power_consumption_ds$Date, power_consumption_ds$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
  
  
  ## Open up the png device to which the plot will be written
  png(filename = plot_file_name, width = 480, height = 480, units = "px")
  
  ## Set the layout for the 4 graphs to be 2 x 2
  par(mfrow = c(2, 2))
  
  ## Plot #1 (top far left) Date/Time vs. Global Active Power
  with(power_consumption_ds, plot(x = Date_time, y = Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))
  
  ## Plot #2 (top far right) Date/Time vs. Voltage
  with(power_consumption_ds, plot(x = Date_time, y = Voltage, type="l", xlab="datetime", ylab="Voltage"))
  
  
  ## Plot #3 (bottom far left) Date/Time vs. the 3 sub_metering_xxx fields
  with(power_consumption_ds, plot(x = Date_time, y = Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering"))
  with(power_consumption_ds, lines(x = Date_time, y = Sub_metering_1, type = "l", col="black"))
  with(power_consumption_ds, lines(x = Date_time, y = Sub_metering_2, type = "l", col="red"))
  with(power_consumption_ds, lines(x = Date_time, y = Sub_metering_3, type = "l", col="blue"))
  legend("topright", col = c("black", "red", "blue"), lwd = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Plot #4 (bottom far right) Date/Time vs. Global_reactive_power
  with(power_consumption_ds, plot(x = Date_time, y = Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  
  ## Now close the png device
  dev.off()
}