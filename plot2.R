library(lubridate)
library(magrittr)
library(dplyr)

plot2 <- function()
{
    fileName <- "household_power_consumption.txt"
    file <- read.table(fileName, sep = ";", header = TRUE)
    file <- file[grep("^1/2/2007|^2/2/2007",file$Date),]
    file$Global_active_power <- as.numeric(file$Global_active_power)
    png("plot2.png", width = 480, height = 480)
    file <- file %>% mutate(dt = dmy_hms(paste(Date,Time)))
    plot(file$dt, file$Global_active_power,type = "n", ylab = "Global Active Power (kilowatts)")
    lines(file$dt,file$Global_active_power)
    dev.off()
}