library(dplyr)
library(lubridate)

household_consumption <- read.csv('household_power_consumption.txt', sep=";")
household_consumption$Date <- as.Date(household_consumption$Date, "%d/%m/%Y")
household_consumption <- mutate(household_consumption, date_time = paste(Date, Time))
household_consumption$date_time <- ymd_hms(household_consumption$date_time)

png("plot2.png", width=480, height=480)
with( household_consumption, plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()

