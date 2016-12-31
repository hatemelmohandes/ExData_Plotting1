## The script assumes the file has been downloaed and extracted to the working directory. The file name is household_power_consumption.txt
AllData <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
workingData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(workingData$Date, workingData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
workingData <- cbind(SetTime, workingData)
## Generating Plot 4
png(filename="./plot4.png", width=480,height=480)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(workingData$SetTime, workingData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(workingData$SetTime, workingData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(workingData$SetTime, workingData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(workingData$SetTime, workingData$Sub_metering_2, type="l", col="red")
lines(workingData$SetTime, workingData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(workingData$SetTime, workingData$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()