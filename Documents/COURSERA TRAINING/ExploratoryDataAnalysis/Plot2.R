###Exploratory Data Assignment 1###

###Getting the dataset ###

raw_data <- read.csv("C:/Users/ramou/Documents/COURSERA TRAINING/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

###Subsetting the data ###

data <- subset(raw_data, Date %in% c("1/2/2007", "2/2/2007"))

###Converting time ###

data_Date <- as.Date(data$Date, "%d/%m/%Y")

date_Time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

dataDateTime <- as.POSIXct(date_Time)

GlobalActivePower <- as.numeric(data$Global_active_power)

###Plot 2 ###
png("plot2.png", width = 480, height = 480)

plot(data$Global_active_power ~ dataDateTime, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

###Saving to file ###
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()