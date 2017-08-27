###Exploratory Data Assignment 1###

###Getting the dataset ###

raw_data <- read.csv("C:/Users/ramou/Documents/COURSERA TRAINING/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

###Subsetting the data ###

data <- subset(raw_data, Date %in% c("1/2/2007", "2/2/2007"))

###Converting time ###

data_Date <- as.Date(data$Date, "%d/%m/%Y")

date_Time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

dataDateTime <- as.POSIXct(date_Time)

###Plot 3 ###

with(data, {
  plot(Sub_metering_1 ~ dataDateTime, type="l",
       ylab = "Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ dataDateTime, col = 'Red')
  lines(Sub_metering_3 ~ dataDateTime, col = 'Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

###Saving to file ###
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()