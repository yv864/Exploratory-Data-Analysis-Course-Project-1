data <- "./household_power_consumption.txt"
dt <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dt1 <- data[dt$Date %in% c("1/2/2007","2/2/2007") ,]

# plot1
global_active_power <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

# plot2
datetime <- strptime(paste(dt1$Date, dt1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png",width = 480,height = 480)
plot(datetime,global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()

# plot3
sm1 <- as.numeric(dt1$Sub_metering_1)
sm2 <- as.numeric(dt1$Sub_metering_2)
sm3 <- as.numeric(dt1$Sub_metering_3)
png("plot3.png",width = 480,height = 480)
plot(datetime,sm1,type="l",ylab = "Energy Submetering",xlab = "")
lines(datetime,sm2,type="l",col="red")
lines(datetime,sm3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black", "red", "blue"))
dev.off()

# plot4
global_reactive_power <- as.numeric(dt1$Global_reactive_power)
voltage <- as.numeric(dt1$Voltage)
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(datetime,global_active_power,type = "l",xlab = "",ylab = "Global Active Power",cex=0.2)
plot(datetime,voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(datetime,sm1,type = "l",xlab = "",ylab = "Engergy Submetering")
lines(datetime,sm2,type="l",col="red")
lines(datetime,sm3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black", "red", "blue"),bty = "o")
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.off()
