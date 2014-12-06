library(dplyr)
library(lubridate)

household_consumption <- read.csv('household_power_consumption.txt', sep=";")
household_consumption$Date <- as.Date(household_consumption$Date, "%d/%m/%Y")
household_consumption <- mutate(household_consumption, date_time = paste(Date, Time))
household_consumption$date_time <- ymd_hms(household_consumption$date_time)

png("plot3.png", width=480, height=480)
with( household_consumption, plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with( household_consumption, lines(date_time, Sub_metering_2, type="l", col="red"))
with( household_consumption, lines(date_time, Sub_metering_3, type="l", col="blue"))
with( household_consumption, legend("topright", legend=names(household_consumption)[7:9], lty=c(1,1), col=c("black", "red", "blue") ))
dev.off()