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

#Plotting
png("plot3.png", width = 480, height = 480)

with(readSubData, {
  plot(formatedDate,readSubData$Sub_metering_1, type="l",lwd=1,xlab="",ylab="Energy sub metering")
  lines(formatedDate,readSubData$Sub_metering_2,col='Red')
  lines(formatedDate,readSubData$Sub_metering_3,col='Blue')
})

legend("topright", col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)

dev.off()