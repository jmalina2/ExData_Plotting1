#### read and subset data set ####
household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

household_power_consumption_subset <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

household_power_consumption_subset$Date <- as.Date(strptime(household_power_consumption_subset$Date, "%d/%m/%Y"))

household_power_consumption_subset$datetime <- strptime(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

#### save histogram as PNG
png("plot4.png")

par(mfrow=c(2,2))

#graph 1
with(household_power_consumption_subset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#graph 2
with(household_power_consumption_subset, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

#graph 3
with(household_power_consumption_subset, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

with(household_power_consumption_subset, lines(datetime, Sub_metering_2, col = "red"))

with(household_power_consumption_subset, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.95, bty = "n")

#graph 4
with(household_power_consumption_subset, plot(datetime, Global_reactive_power, type = "l"))

dev.off()