data_power <- read.csv("household_power_consumption.txt", sep=";")

data_power$DateTime <- strptime(paste(data_power$Date, data_power$Time), format="%d/%m/%Y %H:%M:%S")

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

plot_data <- data_power[data_power$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

plot_data$DateTime <- as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(plot_data$DateTime, plot_data$Global_active_power, type = "l", col = "blue", xlab = "Days", ylab = "Global Active Power (kW)")

graphics.off()
