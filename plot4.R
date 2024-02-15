data_power <- read.csv("household_power_consumption.txt", sep=";")

data_power$DateTime <- strptime(paste(data_power$Date, data_power$Time), format="%d/%m/%Y %H:%M:%S")

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

plot_data <- data_power[data_power$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

plot_data$DateTime <- as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1 of 4
plot(plot_data$DateTime, plot_data$Global_active_power, type = "l", col = "black", lwd = 1, ylab = "Global active power(kiloWatts)", xlab = "days")

# Plot 2 of 4
plot(plot_data$DateTime, plot_data$Voltage, type = "l", col = "purple", lwd = 1, ylab = "Voltage (Volts)", xlab = "days")

# Plot 3 of 4
plot(plot_data$DateTime, plot_data$Sub_metering_1, type = "l", col = "green", lwd = 1, ylab = "sub metering energy", xlab = "days")
lines(plot_data$DateTime, plot_data$Sub_metering_2, col = "red", lwd = 1)
lines(plot_data$DateTime, plot_data$Sub_metering_3, col = "blue", lwd = 1)
legend("topright", legend = c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"), col = c("green", "red", "blue"), lty = 1)

# Plot 4 of 4
plot(plot_data$DateTime, plot_data$Global_reactive_power, type = "l", col = "orange", lwd = 1, ylab = "Global Reactive Power (kiloWatts)", xlab = "days")

graphics.off()

