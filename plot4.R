library(dplyr)
library(lubridate)

household_consumption <- read.csv('household_power_consumption.txt', sep=";")
household_consumption$Date <- as.Date(household_consumption$Date, "%d/%m/%Y")
household_consumption <- mutate(household_consumption, date_time = paste(Date, Time))
household_consumption$date_time <- ymd_hms(household_consumption$date_time)

png("plot4.png", width=480, height=480)
plot_layout <- matrix(c(1,3,2,4), nrow=2, ncol=2, byrow=TRUE)
layout(plot_layout)
with( household_consumption, plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

with( household_consumption, plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with( household_consumption, lines(date_time, Sub_metering_2, type="l", col="red"))
with( household_consumption, lines(date_time, Sub_metering_3, type="l", col="blue"))
with( household_consumption, legend("topright", legend=names(household_consumption)[7:9], lty=c(1,1), col=c("black", "red", "blue") ))

with( household_consumption, plot(date_time, Voltage, type="l", xlab="", ylab="Voltage"))

with( household_consumption, plot(date_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()