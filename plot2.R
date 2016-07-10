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
    y = as.numeric(d.f$Global_active_power) / 1000
    ,   x = as.POSIXct(paste(d.f$Date, d.f$Time), format="%Y-%m-%d %H:%M:%S")
    ,   type = "n"
    ,   ylab = "Global Active Power"
    ,   xlab = NA
    ,   )

# Add the line
lines(y = as.numeric(d.f$Global_active_power) / 1000, x = as.POSIXct(paste(d.f$Date, d.f$Time), format="%Y-%m-%d %H:%M:%S"))

# Render the graph in PNG format
if(length(dev.list() == 1) { dev.new() } # make sure we have an RStudio graphics device present
dev.copy(png, "C:\\gitProjects\\exploratory_data_analysis\\assignment1\\plot2.png")
dev.off(length(dev.list()) + 1) # switch off the last device in the list, which will be the PNG we just created

