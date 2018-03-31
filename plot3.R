# read data into R
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdataset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 3
# convert data and time to specific format
datatime <- strptime(paste(subdataset$Date, subdataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subdataset$Global_active_power) 
SubMetering1 <- as.numeric(subdataset$Sub_metering_1) 
SubMetering2 <- as.numeric(subdataset$Sub_metering_2) 
SubMetering3 <- as.numeric(subdataset$Sub_metering_3) 

# generate plot
png("plot3.png", width=480, height=480) 
plot(datatime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datatime, SubMetering2, type="l", col="red") 
lines(datatime, SubMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue")) 
dev.off() 
