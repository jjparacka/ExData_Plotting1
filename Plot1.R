
## collect the data. Assuming data file is present in the working directory
powerdata <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
powerdatafeb <- rbind(powerdata[powerdata$Date == "1/2/2007",] , powerdata[powerdata$Date == "2/2/2007",])
powerdatafeb$Date <- as.Date(powerdatafeb$Date, format="%d/%m/%Y")
powerdatafeb$Time <- strptime(paste(powerdatafeb$Date,powerdatafeb$Time) , format="%Y-%m-%d %H:%M:%S" )

## create plot1.png in working directory
png(file="plot1.png",width=480,height=480,res=72)
hist(powerdatafeb$Global_active_power, col=2, main="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off()

