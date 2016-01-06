## Code for producing plot 2, which is a line graph of Global Active Power against time.

## Read the power consumption data
power.data <- read.table("household_power_consumption.txt", header = TRUE,
                         sep = ";", na.strings = "?",
                         colClasses = c(rep("character", 2), rep("numeric", 7)))

## Convert date and time to appropriate classes
power.data$Time <- strptime(paste(power.data$Date, power.data$Time), "%d/%m/%Y %H:%M:%S")
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")

## Subset to dates of interest
power.data <- subset(power.data, (Date == "2007-02-01") | (Date == "2007-02-02"))

## Plot line graph in a PNG graphics device
png("plot2.png")
with(power.data, plot(Time, Global_active_power, type = "l",
                      xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()