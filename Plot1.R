#Read in Entire Data Set from Text File
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")

#coerce date field using as.Date function
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")

#created start and end dates for query
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")

#subset dataset based on start and end dates
power_data_subset <- subset (power_data, Date >= startdate & Date <= enddate)

### Plot 1
#Histogram
hist(power_data_subset$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")



