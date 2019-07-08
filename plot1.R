setwd("C:\\Users\\udat\\Desktop\\Rdata\\JHU_EDA")

#reading data
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert the date to DATE format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert to Date Time format
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Graph 1
attach(data)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
