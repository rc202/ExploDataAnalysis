###Exploratory Data Assignment 1###

###Getting the dataset ###

raw_data <- read.csv("C:/Users/ramou/Documents/COURSERA TRAINING/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

###Subsetting the data ###

data <- subset(raw_data, Date %in% c("1/2/2007", "2/2/2007"))

###Converting time ###

data$Date <- as.Date(data$Date, "%d/%m/%Y")

###Plot 1 ###
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

###Saving the file ###

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()

