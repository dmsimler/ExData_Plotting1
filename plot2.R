## First read in the data from the file
power_consumption_ds <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 1, 7)), na.strings="?")

## Now select out a subset of the original data between 2007-02-01 and 2007-02-02
power_consumption_ds <- power_consumption_ds[with(power_consumption_ds, Date == "1/2/2007" | Date == "2/2/2007"), ]

## Now add a date-time field that will be used in creating a plot
power_consumption_ds$Date_time <- strptime(paste(power_consumption_ds$Date, power_consumption_ds$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

## Open up the png device to which the plot will be written
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Now create a line plot with Date/Time on the x-axis and Global Active Power on the y-axis
with(power_consumption_ds, plot(x = Date_time, y = Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))

## Now close the png device
dev.off()
