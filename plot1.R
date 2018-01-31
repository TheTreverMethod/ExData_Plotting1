plot1 <- function() {
    library(dplyr)
    library(lubridate)
    
    # loads the initial data set
    hpc <- read.table("../datasets/household power consumption/household_power_consumption.txt",
                      header = TRUE, sep = ";")
    
    # filters the data set
    hpc2 <- filter(hpc, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")
    
    # creates the histogram pdf
    png(file = 'plot1.png')
    hist(as.numeric(as.character(hpc2$Global_active_power)),
         col = 'red',
         xlab = 'Global Active Power (kilowatts)',
         main = 'Global Active Power')
    dev.off()
}