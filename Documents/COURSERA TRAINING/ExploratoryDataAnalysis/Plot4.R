###Exploratory Data Assignment 1###

###Getting the dataset ###

raw_data <- read.csv("C:/Users/ramou/Documents/COURSERA TRAINING/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

###Subsetting the data ###

data <- subset(raw_data, Date %in% c("1/2/2007", "2/2/2007"))

###Converting time ###

data_Date <- as.Date(data$Date, "%d/%m/%Y")

date_Time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

dataDateTime <- as.POSIXct(date_Time)

###Plot 4 ###

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power ~ dataDateTime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(Voltage ~ dataDateTime, type = "l", 
       ylab = "Voltage", xlab = "")
  plot(Sub_metering_1 ~ dataDateTime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ dataDateTime, col = 'Red')
  lines(Sub_metering_3 ~ dataDateTime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ dataDateTime, type="l", 
       ylab="Global_reactive_power", xlab = "")
})

###Saving to file ###

dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()