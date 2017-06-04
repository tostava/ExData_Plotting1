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

# Set up the graphics device.
png("plot1.png", width = 480, height = 480)

# Plot the data and set up annotation.
hist(dt$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     c = "red")

# Always remember to close the graphics device when done.
dev.off()
