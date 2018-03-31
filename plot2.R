# read data into R
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdataset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 2
# convert data and time to specific format
datatime <- strptime(paste(subdataset$Date, subdataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subdataset$Global_active_power) 

# generate plot
png("plot2.png", width=480, height=480) 
plot(datatime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 
