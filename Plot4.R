
## collect the data. Assuming data file is present in the working directory
powerdata <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
powerdatafeb <- rbind(powerdata[powerdata$Date == "1/2/2007",] , powerdata[powerdata$Date == "2/2/2007",])
powerdatafeb$Date <- as.Date(powerdatafeb$Date, format="%d/%m/%Y")
powerdatafeb$Time <- strptime(paste(powerdatafeb$Date,powerdatafeb$Time) , format="%Y-%m-%d %H:%M:%S" )

## create plot4.png in working directory
png(file="plot4.png",width=480,height=480,res=72)
par(mfrow=c(2, 2))
plot(x=powerdatafeb$Time , y = powerdatafeb$Global_active_power, type = "l", ylab="Global Active Power", xlab="" )
plot(x=powerdatafeb$Time , y = powerdatafeb$Voltage, type = "l", ylab="Voltage", xlab="datetime" )
plot(x=powerdatafeb$Time , y = powerdatafeb$Sub_metering_1 , type = "l", ylab="Energy sub metering", xlab="", col="black" )
points(x=powerdatafeb$Time , y=powerdatafeb$Sub_metering_2, col="red" , type = "l")
points(x=powerdatafeb$Time , y=powerdatafeb$Sub_metering_3, col="blue" , type = "l" )
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lwd=0.1, bty="n")
plot(x=powerdatafeb$Time , y = powerdatafeb$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime" )
dev.off()

