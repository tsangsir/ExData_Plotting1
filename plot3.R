idx <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))

sample = read.table( "household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")
data = read.csv("household_power_consumption.txt", skip=min(idx)-2, nrows = length(idx), sep=";", col.names=colnames(sample))


png("plot3.png", bg="transparent")
dt <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

plot(dt, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(dt, data$Sub_metering_2, col="red")
lines(dt, data$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1,
legend = names(data)[7:9])

dev.off()
