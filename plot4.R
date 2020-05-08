zipF<- "C:/Users/fc00765/Dropbox (Polarcus)/My PC/Documents/R Course/Exploratory Data Analysis - Course_Project 1/exdata_data_household_power_consumption.zip"
outDir<-"C:/Users/fc00765/Dropbox (Polarcus)/My PC/Documents/R Course/Exploratory Data Analysis - Course_Project 1"
unzip(zipF,exdir=outDir)

raw_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) # Original Data


# Creates a new date and time Column
DateTime <- strptime(paste(raw_data$Date,raw_data$Time, sep = ""), "%d/%m/%Y %H:%M:%S" )

#Adds the newly created column in to the raw data
raw_data <- cbind(raw_data,DateTime)

# Converts the date in raw data to a readable format - Date so we can subset base on the date values
raw_data$Date <- as.Date(raw_data$Date,"%d/%m/%Y")

# This script simple extract the 2 dates
Data_Feb <- subset(raw_data, Date == "2007-02-01" | Date == "2007-02-02")

# Converts the character values to a numeric format 

Data_Feb$Sub_metering_1 <- as.numeric(Data_Feb$Sub_metering_1)
Data_Feb$Sub_metering_2 <- as.numeric(Data_Feb$Sub_metering_2)
Data_Feb$Sub_metering_3 <- as.numeric(Data_Feb$Sub_metering_3)
Data_Feb$Global_active_power <- as.numeric(Data_Feb$Global_active_power)
Data_Feb$Voltage <- as.numeric(Data_Feb$Voltage)


##### Plot 4 #############

png("C:/Users/fc00765/Dropbox (Polarcus)/My PC/Documents/R Course/Exploratory Data Analysis - Course_Project 1/plot4.png", width=480, height=480)

par(mfrow = c(2,2)) # This command will generate an R template

# This code will generate thr first plot starting from the left 
with(Data_Feb, plot(DateTime, Global_active_power,  type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))

# This command will start the second plot 
with(Data_Feb, plot(DateTime, Voltage,  type="l", xlab="datetime", ylab="Voltage"))

# This generates the third plot 
with(Data_Feb, plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(Data_Feb$DateTime, Data_Feb$Sub_metering_2,type="l", col= "red")
lines(Data_Feb$DateTime, Data_Feb$Sub_metering_3,type="l", col= "blue")

# Final Plot -> Global Reactive Power
with(Data_Feb, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()