
## collect the data. Assuming data file is present in the working directory
powerdata <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
powerdatafeb <- rbind(powerdata[powerdata$Date == "1/2/2007",] , powerdata[powerdata$Date == "2/2/2007",])
powerdatafeb$Date <- as.Date(powerdatafeb$Date, format="%d/%m/%Y")
powerdatafeb$Time <- strptime(paste(powerdatafeb$Date,powerdatafeb$Time) , format="%Y-%m-%d %H:%M:%S" )


## create plot2.png in working directory
png(file="plot2.png",width=480,height=480,res=72)
plot(x=powerdatafeb$Time , y = powerdatafeb$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="" )
dev.off()

