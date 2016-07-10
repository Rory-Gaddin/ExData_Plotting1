#-------------------------------------------------------------------------------------------------------------------
#
#   Date    : 2016-07-10
#   Author  : Rory Gaddin
#
#   Creates plot1.png for the first Exploratory Data Analysis assignment.
#
#-------------------------------------------------------------------------------------------------------------------

# Load the data
d <- read.table (
    file = "C:\\R\\assignments\\exploratory-data\\household_power_consumption.txt"
,   header = TRUE
,   sep = ";"
)

d$Date <- as.Date(strptime(d$Date, "%d/%m/%Y"))

# Filter for the dates we are interested in
d.f <- subset(d, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

# Draw the graph...
plot(
    y = as.numeric(d.f$Sub_metering_1)
,   x = as.POSIXct(paste(d.f$Date, d.f$Time), format="%Y-%m-%d %H:%M:%S")
,   type = "n"
,   ylab = "Energy Sub-Metering"
,   xlab = NA
,   )

# Add the lines
lines(y = as.numeric(d.f$Sub_metering_1), x = as.POSIXct(paste(d.f$Date, d.f$Time), format="%Y-%m-%d %H:%M:%S"), col = "red")
lines(y = as.numeric(d.f$Sub_metering_2), x = as.POSIXct(paste(d.f$Date, d.f$Time), format="%Y-%m-%d %H:%M:%S"), col = "blue")
lines(y = as.numeric(d.f$Sub_metering_3), x = as.POSIXct(paste(d.f$Date, d.f$Time), format="%Y-%m-%d %H:%M:%S"), col = "green")

legend(
    "topright"
,   legend = c("Sub-Metering 1", "Sub-Metering 2", "Sub-Metering 3"), 
,   lty=c(1,1,1)
,   lwd=c(2,2,2)
,   col=c("red", "blue", "green")
)

# Render the graph in PNG format
if(length(dev.list() == 1) { dev.new() } # make sure we have an RStudio graphics device present
dev.copy(png, "C:\\gitProjects\\exploratory_data_analysis\\assignment1\\plot3.png")
dev.off(length(dev.list()) + 1) # switch off the last device in the list, which will be the PNG we just created

