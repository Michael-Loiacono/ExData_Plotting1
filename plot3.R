## plot3.R
## usage:
## (0) Ensure you have data downloaded from 
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## (1) source("plot3.R") to read in the code into your R environment
## (2) make_plot3() to create the plot and save it as a png in your directory



make_plot3 <- function(){
    ## Ensure you have enough memory for the data file
    data <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";")
    ##convert first column to dates
    data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
    datemin <- as.Date("2007/2/1")
    datemax <- as.Date("2007/2/2")
    datacut <- data[data$Date >= datemin & data$Date <= datemax, ]
    #convert Global Active Power to character then numeric
    sm1<- as.numeric(as.character(datacut$Sub_metering_1))
    sm2<- as.numeric(as.character(datacut$Sub_metering_2))
    sm3<- as.numeric(as.character(datacut$Sub_metering_3))
    DT <- as.POSIXct(paste(datacut$Date, datacut$Time), format="%Y-%m-%d %H:%M:%S")
    ##Launch Graphics Device
    png("plot3.png", width = 480, height = 480)
    ##Set up plot with no datapoints visible
    plot(DT, sm1, type ="n", ylab = "Energy sub metering", xlab = "")
    ##Add lines to plot
    lines(DT, sm1)
    lines(DT, sm2, col = "red")
    lines(DT, sm3, col = "blue")
    ##Add legend
    legend("topright", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty = c(1,1,1))
    dev.off()
}
