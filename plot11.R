## plot1.R - histogram of frequency of global active power (kilowatts).
## V1 - 09/11/2015. Inital Version

library(data.table)

#Read the raw data file and subset only for the dates required.
rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subData <- rawData[rawData$Date == "2/1/2007" | rawData$Date == "2/2/2007", ]


#Create column containing date and time combined and converted to correct format
subData$DateTime <- as.POSIXlt(paste(subData$Date,subData$Time), format="%m/%d/%Y %H:%M:%S")


#Plot 1 - histogram of frequency of global active power
hist(subData$Global_active_power
    ,col="red"
    ,main="Global Active Power" 
    ,xlab="Global Active Power (kilowatts)")


#Generate png file
dev.copy(png, file = "plot1.png" ,width=480 ,height=480) 
dev.off()
