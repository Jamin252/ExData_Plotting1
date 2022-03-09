library(lubridate)
library(magrittr)
library(dplyr)

plot3 <- function()
{
    fileName <- "household_power_consumption.txt"
    file <- read.table(fileName, sep = ";", header = TRUE)
    file <- file[grep("^1/2/2007|^2/2/2007",file$Date),]
    file$Global_active_power <- as.numeric(file$Global_active_power)
    png("plot3.png", width = 480, height = 480)
    file <- file %>% mutate(dt = dmy_hms(paste(Date,Time)))
    plot(file$dt, file$Sub_metering_1,type = "n", ylab = "Energy sub metering")
    lines(file$dt,file$Sub_metering_1, col = "black")
    lines(file$dt,file$Sub_metering_2, col = "red")
    lines(file$dt,file$Sub_metering_3, col = "blue")
    colors <- c("black", "red", "blue")
    legendtxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright",legend = legendtxt, col = colors, lty = 1)
    dev.off()
}