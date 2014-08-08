## This R code contructs plot1 for assignment 1 in Exploratory Data Analysis

## Checks to see if data file is available and if not downloads it
if(!file.exists("household_power_consumption.txt")) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata-data-household_power_consumption.zip", method = "curl")
	unzip("exdata-data-household_power_consumption.zip")
}

# reads and subsets data
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

dat_sub <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# Creates png file
png(filename = "plot1.png")
# Creates plot1
hist(dat_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Close png file
dev.off()
