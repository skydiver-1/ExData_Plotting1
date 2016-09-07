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


#Limited Dataset to 4 variables of Interest
PD3 <- PD2[,c(10,7,8,9)]


### Plot 3

#Set up plotting region
plot (PD3$Date_Time, PD3$Sub_metering_1, 
      type = "n",     
      xlab = " ",
      ylab = "Energy sub metering")

#plot data
points(PD3$Date_Time, PD3$Sub_metering_1, 
     pch = ".", 
     type = "l") 

points(PD3$Date_Time, PD3$Sub_metering_2, 
     pch = ".", 
     type = "l",
     col = "red") 

points(PD3$Date_Time, PD3$Sub_metering_3, 
     pch = ".", 
     type = "l",
     col = "blue") 


legend("topright", adj = 0.5, x.intersp = 10, y.intersp = 1.8, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       pch = c("_", "_","_"), col = c("black", "red", "blue"))
       
