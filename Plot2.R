## load the data
setwd("C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA")

rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# convert the date variable to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert date and time to Date-Time Format
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
attach(data)

#Graph 2
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

#saving graph
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)