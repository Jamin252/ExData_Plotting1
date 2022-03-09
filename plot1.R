library(lubridate)
library(magrittr)

plot1 <- function()
{
    fileName <- "household_power_consumption.txt"
    file <- read.table(fileName, sep = ";", header = TRUE)
    file <- file[grep("^1/2/2007|^2/2/2007",file$Date),]
    file$Global_active_power <- as.numeric(file$Global_active_power)
    png("plot1.png", width = 480, height = 480)
    hist(file$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    dev.off()
}