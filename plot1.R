##################################
##                              ##
##  Code to create plot1.png    ##
##                              ##
##################################
# Created by L.T. van der Heijden
# Date created: 30-05-2019
# Date updated: 

### Start of Script ###
# Empty global environment
rm(list = ls())

# Set workingdirectory
wd <- "~/Documents/datasciencecourse/course 4/week 1"
setwd(wd)

# Read the electric power consumption dataset
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                  colClasses = c('character','character','numeric','numeric','numeric','numeric',
                                 'numeric','numeric','numeric'))

# Change the date variable to class date
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

## Subset the data for only the dates of 2007-02-01 and 2007-02-02
newdat <- subset(dat,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Convert Date and Time to one Datetime variable
datetime <- paste(as.Date(newdat$Date), newdat$Time)
newdat$datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

# Make a histogram of Global Active Power
hist(newdat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power")

# Copy plot to a pgn file
dev.copy(png,"plot1.png", width=480, height=480)

# Close graphic device 
dev.off()

### End of Script ###