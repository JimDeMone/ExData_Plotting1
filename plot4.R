data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
d <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")
data <- cbind(data, d)
colnames(data)<-c(colnames(data)[1:9], "Timestamp")
data1 <- data[which(data$Timestamp >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %T") & data$Timestamp < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %T")),]

png(file = "plot4.png")
par(mfrow = c(2,2))
plot(data1$Timestamp,data1$Global_active_power, ylab = "Global Active Power", xlab ="", type = "l")
plot(data1$Timestamp,data1$Voltage, ylab = "Voltage", xlab ="datetime", type = "l")

plot(data1$Timestamp,data1$Sub_metering_1, ylab = "Energy sub metering", xlab ="", type = "l")
lines(data1$Timestamp,data1$Sub_metering_2, col = "red", type = "l")
lines(data1$Timestamp,data1$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n")

plot(data1$Timestamp,data1$Global_reactive_power, ylab = "Global_reactive_power", xlab ="datetime", type = "l")
dev.off()

