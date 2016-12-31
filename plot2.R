## The script assumes the file has been downloaed and extracted to the working directory. The file name is household_power_consumption.txt
AllData <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
workingData <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(workingData$Date, workingData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
workingData <- cbind(SetTime, workingData)
## Generating plot 2
png(filename="./plot2.png", width=480,height=480)
plot(workingData$SetTime, workingData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()