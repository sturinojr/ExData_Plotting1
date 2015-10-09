plotData2 <- function(workingDirectory, fileName="household_power_consumption.txt") {
  setwd(workingDirectory)
  energyData <- read.table(fileName, sep=";", header=TRUE, na.strings = "?")
  
  energyData$DateTime <- paste(energyData$Date, energyData$Time) 
  energyData$DateTime <- strptime(energyData$DateTime, "%d/%m/%Y %H:%M:%S")
  energyData$Date <- as.Date(energyData$Date, format="%d/%m/%Y")
  
  energyData <- energyData[energyData$Date == "2007-02-01" | energyData$Date == "2007-02-02",]
  
  plot (x = energyData$DateTime, y=energyData$Global_active_power, xlab="",  
        ylab="Global Active Power (kilowatts)", type="l")

  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
}
