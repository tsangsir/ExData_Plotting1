idx <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))

sample = read.table( "household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")
data = read.csv("household_power_consumption.txt", skip=min(idx)-2, nrows = length(idx), sep=";", col.names=colnames(sample))


png("plot1.png", bg="transparent")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off()
