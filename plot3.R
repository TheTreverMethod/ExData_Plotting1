plot3 <- function() {
    library(dplyr)
    library(lubridate)
    
    # loads the initial data set
    hpc <- read.table("../datasets/household power consumption/household_power_consumption.txt",
                      header = TRUE, sep = ";")
    
    # filters the data set
    hpc2 <- filter(hpc, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")
    
    # convert to numerics
    hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))
    hpc2$Sub_metering_1 <- as.numeric(as.character(hpc2$Sub_metering_1))
    hpc2$Sub_metering_2 <- as.numeric(as.character(hpc2$Sub_metering_2))
    hpc2$Sub_metering_3 <- as.numeric(as.character(hpc2$Sub_metering_3))
    
    # create a datetime value
    hpc2$DateAndTime <- dmy_hms(paste(hpc2$Date, hpc2$Time))
    
    # creates the histogram pdf
    png(file = "plot3.png")
    with(hpc2, plot(DateAndTime, Sub_metering_1,
                    type = 'n',
                    xlab = '',
                    ylab = 'Energy sub metering'))
    lines(hpc2$DateAndTime, hpc2$Sub_metering_1, col = 'black')
    lines(hpc2$DateAndTime, hpc2$Sub_metering_2, col = 'red')
    lines(hpc2$DateAndTime, hpc2$Sub_metering_3, col = 'blue')
    legend('topright', lty=1, col=c('black', 'red', 'blue'),
           legend= c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
    dev.off()
}