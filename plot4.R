# read data into R
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdataset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 4
# convert data and time to specific format
datatime <- strptime(paste(subdataset$Date, subdataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subdataset$Global_active_power) 
GlobalReactivePower <- as.numeric(subdataset$Global_reactive_power) 
voltage <- as.numeric(subdataset$Voltage) 
SubMetering1 <- as.numeric(subdataset$Sub_metering_1) 
SubMetering2 <- as.numeric(subdataset$Sub_metering_2) 
SubMetering3 <- as.numeric(subdataset$Sub_metering_3) 

# generate plots
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2)) 

plot(datatime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datatime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datatime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datatime, SubMetering2, type="l", col="red") 
lines(datatime, SubMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(datatime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 
