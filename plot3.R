data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
d <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")
data <- cbind(data, d)
colnames(data)<-c(colnames(data)[1:9], "Timestamp")
data1 <- data[which(data$Timestamp >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %T") & data$Timestamp < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %T")),]

png(file = "plot3.png")
plot(data1$Timestamp,data1$Sub_metering_1, ylab = "Energy sub metering", xlab ="", type = "l")
lines(data1$Timestamp,data1$Sub_metering_2, col = "red", type = "l")
lines(data1$Timestamp,data1$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()

