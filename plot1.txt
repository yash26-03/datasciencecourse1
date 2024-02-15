data_power <- read.csv("household_power_consumption.txt", sep=";")

data_power$DateTime <- strptime(paste(data_power$Date, data_power$Time), format="%d/%m/%Y %H:%M:%S")

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

plot_data <- data_power[data_power$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)

png("plot1.png", width=480, height = 480)

hist(plot_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kiloWatts)", col = "red")

graphics.off()
