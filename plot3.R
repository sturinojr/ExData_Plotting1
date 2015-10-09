plotData3 <- function(workingDirectory, fileName="household_power_consumption.txt") {
  setwd(workingDirectory)
  energyData <- read.table(fileName, sep=";", header=TRUE, na.strings = "?")
  
  energyData$DateTime <- paste(energyData$Date, energyData$Time) 
  energyData$DateTime <- strptime(energyData$DateTime, "%d/%m/%Y %H:%M:%S")
  energyData$Date <- as.Date(energyData$Date, format="%d/%m/%Y")
  
  energyData <- energyData[energyData$Date == "2007-02-01" 
                           | energyData$Date == "2007-02-02",]
  
  #create the plot, but put nothing on the plot
  plot(x=energyData$DateTime, y=energyData$Sub_metering_1, xlab="", 
       ylab="Energy sub metering", type ="n")
  #plot the lines and color
  lines(x=energyData$DateTime, y=energyData$Sub_metering_1, col="black")
  lines(x=energyData$DateTime, y=energyData$Sub_metering_2, col="red")
  lines(x=energyData$DateTime, y=energyData$Sub_metering_3, col="blue")
  #add the legend
  legend("topright", legend = c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), 
         lty = 1, col = c("black", "red", "blue"), cex=.75)
  
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
}