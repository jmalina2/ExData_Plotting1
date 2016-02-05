#### read and subset data set ####
household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

household_power_consumption_subset <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

household_power_consumption_subset$Date <- as.Date(strptime(household_power_consumption_subset$Date, "%d/%m/%Y"))

household_power_consumption_subset$datetime <- strptime(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

#### save histogram as PNG
png("plot2.png")

with(household_power_consumption_subset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()