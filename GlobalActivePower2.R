#Get Data from Website and save file in your current working directory
# We will start by unzipping the file

unzip('./exdata-data-household_power_consumption.zip')

# Read data into R

data <- read.table('./household_power_consumption.txt',header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data to date range 2007-02-01 and 2007-02-02

newdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Change class of date and time variables

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Make Global Active Power variable into numeric and plot as histogram

GlobalActivePower <- as.numeric(newdata$Global_active_power)
par(mfrow = c(1,1))
hist(GlobalActivePower, col = "red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")

png("GlobalActivePower.png", width=480, height=480)
hist(GlobalActivePower, col = "red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

