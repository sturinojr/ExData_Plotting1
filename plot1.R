plotData1 <- function(workingDirectory, fileName="household_power_consumption.txt") {
  setwd(workingDirectory)
  energyData <- read.table(fileName, sep=";", header=TRUE, na.strings = "?")
  energyData$Date <- as.Date(energyData$Date, format="%d/%m/%Y")
  
  energyData <- energyData[energyData$Date == "2007-02-01" | energyData$Date == "2007-02-02",]
  
  with(energyData, hist(as.numeric(Global_active_power), col="red", 
                        main = "Global Active Power", 
                        xlab="Global Active Power (kilowatts)", cex=.75))
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
}

