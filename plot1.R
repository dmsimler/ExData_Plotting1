## First read in the data from the file
power_consumption_ds <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 1, 7)), na.strings="?")

## Now select out a subset of the original data between 2007-02-01 and 2007-02-02
power_consumption_ds <- power_consumption_ds[with(power_consumption_ds, Date == "1/2/2007" | Date == "2/2/2007"), ]

## Open up the png device to which the histogram will be written
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Now create a histogram of the Global_active_power data with the correct title, x-axis label, and color
## for the bars.  Settling on orangered2 as the bar color since it most closely matches
## on my screen what is shown in the assignment's reference graph.
hist(power_consumption_ds$Global_active_power, col = "orangered2", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Now close the png device
dev.off()
