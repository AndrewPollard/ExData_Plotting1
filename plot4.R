## Code for producing plot 4, which is a set of 4 line graphs.

## Read the power consumption data
power.data <- read.table("household_power_consumption.txt", header = TRUE,
                         sep = ";", na.strings = "?",
                         colClasses = c(rep("character", 2), rep("numeric", 7)))

## Convert date and time to appropriate classes
power.data$Time <- strptime(paste(power.data$Date, power.data$Time), "%d/%m/%Y %H:%M:%S")
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")

## Subset to dates of interest
power.data <- subset(power.data, (Date == "2007-02-01") | (Date == "2007-02-02"))

## Set up graphics device and sub-plots
png("plot4.png")
par(mfrow = c(2,2))

## Draw plots
with(power.data, {
    ## Top left
    plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    ## Top right
    plot(Time, Voltage, type = "l", xlab = "datetime")
    
    ## Bottom left
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", legend = paste0("Sub_metering_", c(1,2,3)), lty = 1,
           col = c("black", "red", "blue"), bty = "n")
    
    ## Bottom right
    plot(Time, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()