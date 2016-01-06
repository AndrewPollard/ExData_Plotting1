## Code for producing plot 3, which is a line graph of Energy Sub Metering against time.

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
png("plot3.png")
with(power.data, {
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
})
legend("topright", legend = paste0("Sub_metering_", c(1,2,3)), lty = 1,
       col = c("black", "red", "blue"))
dev.off()