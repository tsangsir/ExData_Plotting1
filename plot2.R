idx <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))

sample = read.table( "household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")
data = read.csv("household_power_consumption.txt", skip=min(idx)-2, nrows = length(idx), sep=";", col.names=colnames(sample))


png("plot2.png", bg="transparent")
dt <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
plot(dt, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
