## plot2.R - trend for global active power over time.
## V1 - 09/11/2015. Inital Version

library(data.table)

#Read the raw data file and subset only for the dates required.
rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007", ]


#Create column containing date and time combined and converted to correct format
subData$DateTime <- as.POSIXlt(paste(subData$Date,subData$Time), format="%d/%m/%Y %H:%M:%S")


#Plot 2 - line graph of global active power over time
plot(subData$DateTime 
    ,subData$Global_active_power
    ,type="l"
    ,ylab="Global Active Power (kilowatts)"
    ,xlab="")


#Generate png file
dev.copy(png, file = "plot2.png" ,width=480 ,height=480) 
dev.off()