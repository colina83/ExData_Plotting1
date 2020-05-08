
zipF<- "C:/Users/fc00765/Dropbox (Polarcus)/My PC/Documents/R Course/Exploratory Data Analysis - Course_Project 1/exdata_data_household_power_consumption.zip"
outDir<-"C:/Users/fc00765/Dropbox (Polarcus)/My PC/Documents/R Course/Exploratory Data Analysis - Course_Project 1"
unzip(zipF,exdir=outDir)

raw_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) # Original Data

## This code converts the date to a readable format
raw_data$Date <- as.Date(raw_data$Date,"%d/%m/%Y")


# This is a vector to extract the data
e <- c(grep("2007-02-01",raw_data$Date),grep("2007-02-02", raw_data$Date))

# Please note that for this plot, I tried to use a different method, the data in plots 2 and 3 were put together with Subset
Data_February_2Days <- raw_data[e,]
Data_February_2Days$Global_active_power <- as.numeric(Data_February_2Days$Global_active_power)

############### Plot 1 ##########

png("C:/Users/fc00765/Dropbox (Polarcus)/My PC/Documents/R Course/Exploratory Data Analysis - Course_Project 1/plot1.png",width=480, height=480)
plot(hist(Data_February_2Days$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

