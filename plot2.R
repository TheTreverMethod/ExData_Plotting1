plot2 <- function() {
    library(dplyr)
    library(lubridate)
    
    # loads the initial data set
    hpc <- read.table("../datasets/household power consumption/household_power_consumption.txt",
                      header = TRUE, sep = ";")
    
    # filters the data set
    hpc2 <- filter(hpc, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")
    
    # convert global active power to numeric
    hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))
    
    # create a datetime value
    hpc2$DateAndTime <- dmy_hms(paste(hpc2$Date, hpc2$Time))
    
    # creates the histogram pdf
    png(file = "plot2.png")
    with(hpc2, plot(hpc2$DateAndTime, hpc2$Global_active_power,
                    type = 'l',
                    xlab = "",
                    ylab = "Global Active Power (kilowatts)"))
    dev.off()
}