#Read directly from the zipped folder present in local dir
readFullData <- read.table(unz("C:\\Users\\hp\\Desktop\\Coursera\\Data\\Data Science Specialization\\4- Exploratory data analysis\\Week 1\\powerConsumption.zip","household_power_consumption.txt"),header=T,sep=";",dec=".",stringsAsFactors=FALSE)

#Suubsetting the data
readSubData <- subset(readFullData,readFullData$Date %in% c("1/2/2007","2/2/2007"))
readSubData$Global_active_power<- as.numeric(readSubData$Global_active_power)

#Plotting
png("plot1.png", width = 480, height = 480)
hist(readSubData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")

dev.off()