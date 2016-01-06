## Code for producing plot 1, which is a histogram of Global Active Power.

## Read the power consumption data
power.data <- read.table("household_power_consumption.txt", header = TRUE,
                         sep = ";", na.strings = "?",
                         colClasses = c(rep("character", 2), rep("numeric", 7)))

## Convert date and time to appropriate classes
power.data$Time <- strptime(paste(power.data$Date, power.data$Time), "%d/%m/%Y %H:%M:%S")
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")

## Subset to dates of interest
power.data <- subset(power.data, (Date == "2007-02-01") | (Date == "2007-02-02"))

## Plot histogram on a PNG graphics device
png("plot1.png")
hist(power.data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()