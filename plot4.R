## This R code contructs plot4 for assignment 1 in Exploratory Data Analysis

## Checks to see if data file is available and if not downloads it
if(!file.exists("household_power_consumption.txt")) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata-data-household_power_consumption.zip", method = "curl")
	unzip("exdata-data-household_power_consumption.zip")
}

# reads and subsets data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

dat_sub <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(dat_sub$Date, dat_sub$Time), "%d/%m/%Y %H:%M:%S")

new_dat <- cbind(dat_sub, datetime)

# Creates png file
png(filename = "plot4.png")
# Creates plot4
par(mfcol = c(2, 2))
with(new_dat, {
	plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
	plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
	lines(datetime, Sub_metering_1)
	lines(datetime, Sub_metering_2, col = "red")
	lines(datetime, Sub_metering_3, col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(datetime, Voltage, type = "l")
	plot(datetime, Global_reactive_power, type = "l")
})
#Close png file
dev.off()