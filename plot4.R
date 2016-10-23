#Read directly from the zipped folder present in local dir
readFullData <- read.table(unz("C:\\Users\\hp\\Desktop\\Coursera\\Data\\Data Science Specialization\\4- Exploratory data analysis\\Week 1\\powerConsumption.zip","household_power_consumption.txt"),header=T,sep=";",dec=".",stringsAsFactors=FALSE)

#Suubsetting the data
readSubData <- subset(readFullData,readFullData$Date %in% c("1/2/2007","2/2/2007"))

readSubData$Global_active_power<- as.numeric(readSubData$Global_active_power)

#Format date
formatedDate <- strptime(paste(readSubData$Date, readSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

readSubData$Sub_metering_1<- as.numeric(readSubData$Sub_metering_1)
readSubData$Sub_metering_2<- as.numeric(readSubData$Sub_metering_2)
readSubData$Sub_metering_3<- as.numeric(readSubData$Sub_metering_3)

readSubData$Voltage<- as.numeric(readSubData$Voltage)
readSubData$Global_reactive_power<- as.numeric(readSubData$Global_reactive_power)

#Plotting
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,1,1))

with(readSubData, {
  plot(formatedDate,readSubData$Global_active_power, type = "l",xlab="", ylab = "Global Active Power")
  plot(formatedDate,readSubData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(formatedDate, readSubData$Sub_metering_1, type = "l",xlab="", ylab = "Energy sub metering")
  lines(formatedDate,readSubData$Sub_metering_2,col='Red')
  lines(formatedDate,readSubData$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)
  plot(formatedDate, readSubData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})


dev.off()