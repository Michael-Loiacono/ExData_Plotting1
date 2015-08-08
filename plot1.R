## plot1.R
## usage: 
## (0) Ensure you have data downloaded from 
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## (1) source("plot1.R") to read in the code into your R environment
## (2) make_plot1() to create the plot and save it as a png in your directory


make_plot1 <- function(){
    ## Ensure you have enough memory for the data file
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
    ##convert first column to dates
    data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
    datemin <- as.Date("2007/2/1")
    datemax <- as.Date("2007/2/2")
    datacut <- data[data$Date >= datemin & data$Date <= datemax, ]
    #convert Global Active Power to character then numeric
    datacut$Global_active_power <- as.numeric(as.character(datacut$Global_active_power))
    DT <- as.POSIXct(paste(datacut$Date, datacut$Time), format="%Y-%m-%d %H:%M:%S")
    ##Launch Graphics Device
    png("plot1.png", width = 480, height = 480)
    ##set up histogram
    hist(datacut$Global_active_power, xlab = "Global Active Power (kilowatts)", 
         col = "red", main = "Global Active Power")

    dev.off()
}