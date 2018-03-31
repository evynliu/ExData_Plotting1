library("data.table")

# download data
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

# read data into R
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdataset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# generate Plot 1
GlobalActivePower <- as.numeric(subdataset$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 
