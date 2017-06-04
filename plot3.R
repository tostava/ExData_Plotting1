# This script expects the datafile to be already downloaded and extracted.
# Due to the file size, the file is not stored in the Github repo.

# datasource: "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# unpacked filename: "./data/household_power_consumption.txt"

# Read the CSV-file into memory.
# Using fread to read the data since it seems to be one of the fastest methods:
# Ref. also https://csgillespie.github.io/efficientR/5-3-importing-data.html#fast-data-reading

# Set the filename.
filename <- "./data/household_power_consumption.txt"

# Read the data into memory.
library(data.table)
dt <- fread(filename, 
            na.strings="?", 
            colClasses = c(rep("character", 2), 
                           rep("numeric", 7)))

# Filter the data so that we only work with the days specified in the assignment.
library(dplyr)
dt <- filter(dt, Date %in% c("1/2/2007", "2/2/2007"))

# Convert date from character to proper date class
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

# Combine date and time to create a new posix formatted date and time column
dt$datetime <- as.POSIXct(paste(dt$Date, dt$Time))

# Set up the graphics device.
png("plot3.png", width = 480, height = 480)

# Plot the data and set up annotation.
with(dt, 
     plot(datetime,
          Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering"))

with(dt, 
     points(datetime,
            Sub_metering_2,
            type = "l",
            col = "red"))

with(dt, 
     points(datetime,
            Sub_metering_3,
            type = "l",
            col = "blue"
            ))

# Add a legend to the plot
legend("topright", 
       lty = 1,
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

# Always remember to close the graphics device when done.
dev.off()
