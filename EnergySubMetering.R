#Get Data from Website and save file in your current working directory
# We will start by unzipping the file

unzip('./exdata-data-household_power_consumption.zip')

# Read data into R

data <- read.table('./household_power_consumption.txt',header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data to date range 2007-02-01 and 2007-02-02

newdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Change class of date and time variables

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Make Global Active Power variable and Sub Metering variables into numeric and plot

GlobalActivePower <- as.numeric(newdata$Global_active_power)
subMetering1 <- as.numeric(newdata$Sub_metering_1)
subMetering2 <- as.numeric(newdata$Sub_metering_2)
subMetering3 <- as.numeric(newdata$Sub_metering_3)
par(mfrow = c(1,1))
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

png("SubMetering.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

