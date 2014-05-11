# The file named 02-2007-household_power_consumption.csv contains only
# the data for the dates of interest, namely, 01/02/2007 and 02/02/2007.

# I created a shell-script (get_data.sh, also in this repo) that downloads
# the zip file if needed, and extract only the data for those two dates
raw_data <- read.csv("02-2007-household_power_consumption.csv", sep=";")

png("plot3.png", width=480, height=480)

# makes sure the week days are in English
Sys.setlocale("LC_ALL", 'en_GB.UTF-8')

strdates <- apply(raw_data, 1, function(d) paste(d[["Date"]], d[["Time"]]))
times <- strptime(strdates, format="%d/%m/%Y %H:%M:%S")
plot(times, raw_data$Sub_metering_1, type='n',
     xlab='',
     ylab="Energy sub metering")

columns <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
columns_colors <- c('black', 'red', 'blue')

mapply(function(column, color){
    lines(times, raw_data[[column]], col=color)
}, columns, columns_colors)
legend("topright", legend=columns, col=columns_colors, lwd=1)

dev.off()
