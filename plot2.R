## plot2.R
## usage:
## (0) Ensure you have data downloaded from 
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## (1) source("plot2.R") to read in the code into your R environment
## (2) make_plot2() to actually create the plot
## (3) make_plot2_png() to save to a PNG file


make_plot2 <- function(){
    ## Ensure you have enough memory for the data file
    data <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";")
    ##convert first column to dates
    data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
    datemin <- as.Date("2007/2/1")
    datemax <- as.Date("2007/2/2")
    datacut <- data[data$Date >= datemin & data$Date <= datemax, ]
    #convert Global Active Power to character then numeric
    datacut$Global_active_power <- 
        as.numeric(as.character(datacut$Global_active_power))
    DT <- as.POSIXct(paste(datacut$Date, datacut$Time), format="%Y-%m-%d %H:%M:%S")
    ##Set up plot with no datapoints visible
    plot(DT, datacut$Global_active_power, type ="n", 
         ylab = "Global Active Power (kilowatts)", 
         xlab = "", cex.lab=.75, cex.axis = .75)
    ##Add lines to plot
    lines(DT, datacut$Global_active_power, type = "l")
}

make_plot2_png <- function(){
    dev.copy(png, file = "plot2.png", height = 480, width = 480)
    dev.off()
}