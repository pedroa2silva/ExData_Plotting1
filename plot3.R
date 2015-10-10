# Required libraries
library(lubridate)

# Read the raw data
hpc_raw <- read.table("household_power_consumption.txt", sep = ";", dec = ".",
                      stringsAsFactors = FALSE, header=TRUE)

# Extract the subset for the graphics and convert the columns to the correct classes
hpc <- hpc_raw[hpc_raw$Date == "1/2/2007" | hpc_raw$Date == "2/2/2007", ]
hpc$Date = dmy(hpc$Date)
hpc$Time = hms(hpc$Time)
hpc$Global_active_power = as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power = as.numeric(hpc$Global_reactive_power)
hpc$Voltage = as.numeric(hpc$Voltage)
hpc$Global_intensity = as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 = as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 = as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 = as.numeric(hpc$Sub_metering_3)


png("plot3.png", width=480, height=480)

plot(datetime, hpc$Sub_metering_1, type="l", xlab = "", ylab="Energy Submetering")
points(datetime, hpc$Sub_metering_2, type="l", col="red")
points(datetime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", pch=1, col=c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
