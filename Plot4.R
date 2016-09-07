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


### Plot 4

#Set up 2 row by 2 column "grid" for the four graphs that follow
par (mfrow = c(2,2))
par (mar = c(4,4,1,1))

#___________________________________________
#Upper Left Quadrant
plot(PD2$Date_Time, PD2$Global_active_power, 
     pch = ".", 
     type = "l", 
     xlab = " ",
     ylab = "Global Active Power")

#____________________________________________
#Upper Right Quadrant
plot (PD2$Date_Time, PD2$Voltage,
      pch = ".",
      type = "l",
      xlab = "datetime",
      ylab = "Voltage")

#____________________________________________
#Lower Left Quadrant

plot (PD2$Date_Time, PD2$Sub_metering_1, 
      type = "n",     
      xlab = " ",
      ylab = "Energy sub metering")

points(PD2$Date_Time, PD2$Sub_metering_1, 
       pch = ".", 
       type = "l") 

points(PD2$Date_Time, PD2$Sub_metering_2, 
       pch = ".", 
       type = "l",
       col = "red") 

points(PD2$Date_Time, PD2$Sub_metering_3, 
       pch = ".", 
       type = "l",
       col = "blue") 

legend("topright", bty = "n", adj = 0.6, x.intersp = 14, y.intersp = 2.2, cex = 0.8, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       pch = c("_", "_","_"), col = c("black", "red", "blue"))


#____________________________________________
#Lower Right Quadrant
plot (PD2$Date_Time, PD2$Global_reactive_power,
      pch = ".",
      type = "l",
      xlab = "datetime",
      ylab = "Global_reactive_power")


