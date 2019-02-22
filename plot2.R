data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
d <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")
data <- cbind(data, d)
colnames(data)<-c(colnames(data)[1:9], "Timestamp")
data1 <- data[which(data$Timestamp >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %T") & data$Timestamp < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %T")),]

png(file = "plot2.png")
plot(data1$Timestamp,data1$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab ="", type = "l")
dev.off()

