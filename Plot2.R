#Read in Entire Data Set from Text File
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")

#coerce date field using as.Date function
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")

#created start and end dates for query
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")

#subset dataset based on start and end dates
power_data_subset <- subset (power_data, Date >= startdate & Date <= enddate)

#copied power_data_subset into new dataset to experiment with new concepts
PD2 <- power_data_subset 

#combined weekday and time variables into new combined variable called Date_Time
PD2$Date_Time <- paste(PD2$Date, PD2$Time)
PD2$Date_Time = strptime(PD2$Date_Time, "%Y-%m-%d %H:%M:%S")

#Limited Dataset to 2 variables of Interest
PD3 <- PD2[,c(10,3)]

### Plot 2
#LineGraph
plot(PD3$Date_Time, PD3$Global_active_power, 
     pch = ".", 
     type = "l", 
     xlab = " ",
     ylab = "Global Active Power (kilowatts)")

