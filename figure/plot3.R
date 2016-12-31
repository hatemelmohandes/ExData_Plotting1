## The script assumes the file has been downloaed and extracted to the working directory. The file name is household_power_consumption.txt
AllData <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
workingData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(workingData$Date, workingData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
workingData <- cbind(SetTime, workingData)

## Generating Plot 3
png(filename="./plot3.png", width=480,height=480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(workingData$SetTime, workingData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(workingData$SetTime, workingData$Sub_metering_2, col=columnlines[2])
lines(workingData$SetTime, workingData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()