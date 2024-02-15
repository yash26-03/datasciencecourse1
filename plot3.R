data_power <- read.csv("household_power_consumption.txt", sep=";")

data_power$DateTime <- strptime(paste(data_power$Date, data_power$Time), format="%d/%m/%Y %H:%M:%S")

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

plot_data <- data_power[data_power$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

plot_data$DateTime <- as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(plot_data$DateTime, plot_data$Sub_metering_1, type = "l", col = "green", lwd = 1, ylab = "energy sub metering", xlab = "days")
lines(plot_data$DateTime, plot_data$Sub_metering_2, col = "red", lwd = 1)
lines(plot_data$DateTime, plot_data$Sub_metering_3, col = "blue", lwd = 1)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("red", "green", "blue"), lty = 1)

graphics.off()
