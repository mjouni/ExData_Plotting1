library(dplyr)
library(lubridate)

household_consumption <- read.csv('household_power_consumption.txt', sep=";")

png("plot1.png", width=480, height=480)
hist(household_consumption$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts", col='red')
dev.off()
