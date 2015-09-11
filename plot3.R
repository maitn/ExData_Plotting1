## plot3.R - trend for energy sub metering 1/2/3 over time.
## V1 - 09/11/2015. Inital Version

library(data.table)

#Read the raw data file and subset only for the dates required.
rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subData <- rawData[rawData$Date == "1/2/2007" | rawData$Date == "2/2/2007", ]


#Create column containing date and time combined and converted to correct format
subData$DateTime <- as.POSIXlt(paste(subData$Date,subData$Time), format="%d/%m/%Y %H:%M:%S")


#Plot 3 - trend lines for energy sub metering 1/2/3 over time

#Determine range of graph
xrange <- range(subData$DateTime) 
yrange <- range(subData$Sub_metering_1, subData$Sub_metering_2, subData$Sub_metering_3) 

plot(xrange 
    ,yrange 
    ,type="n"
    ,ylab="Energy sub metering"
    ,xlab="")

# sub metering 1 trend line
lines(subData$DateTime
     ,subData$Sub_metering_1)

# sub metering 2 trend line
lines(subData$DateTime 
     ,subData$Sub_metering_2
     ,col="red")

# sub metering 3 trend line
lines(subData$DateTime 
     ,subData$Sub_metering_3
     ,col="blue")

#legend
legend("topright"
      ,lty = 1
      ,col = c("black","blue","red")
      ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Generate png file
dev.copy(png, file = "plot3.png" ,width=480 ,height=480) 
dev.off()
