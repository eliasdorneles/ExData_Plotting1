# The file named 02-2007-household_power_consumption.csv contains only
# the data for the dates of interest, namely, 01/02/2007 and 02/02/2007.

# I created a shell-script (get_data.sh, also in this repo) that downloads
# the zip file if needed, and extract only the data for those two dates
raw_data <- read.csv("02-2007-household_power_consumption.csv", sep=";")

png("plot2.png", width=480, height=480)

# makes sure the week days are in English
Sys.setlocale("LC_ALL", 'en_GB.UTF-8')

strdates <- apply(raw_data, 1, function(d) paste(d[["Date"]], d[["Time"]]))
times <- strptime(strdates, format="%d/%m/%Y %H:%M:%S")
plot(times, raw_data$Global_active_power, type='l',
     xlab='',
     ylab="Global Active Power (kilowatts)")
dev.off()
