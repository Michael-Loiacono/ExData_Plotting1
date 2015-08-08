## plot2.R
## usage:
## (0) Ensure you have data downloaded from 
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## (1) source("plot2.R") to read in the code into your R environment
## (2) make_plot2() to create the plot and save it as a png in your directory


make_plot2 <- function(){
    ## Ensure you have enough memory for the data file
    data <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";")
    ##convert first column to dates
    data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
    datemin <- as.Date("2007/2/1")
    datemax <- as.Date("2007/2/2")
    datacut <- data[data$Date >= datemin & data$Date <= datemax, ]
    #convert needed data to character then numeric
    datacut$Global_active_power <- 
        as.numeric(as.character(datacut$Global_active_power))
    DT <- as.POSIXct(paste(datacut$Date, datacut$Time), format="%Y-%m-%d %H:%M:%S")
    ##Launch Graphics Device
    png("plot2.png", width = 480, height = 480)
    ##Set up plot with no datapoints visible
    plot(DT, datacut$Global_active_power, type ="n", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    ##Add lines to plot
    lines(DT, datacut$Global_active_power, type = "l")
    dev.off()
}

