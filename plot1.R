# The file named 02-2007-household_power_consumption.csv contains only
# the data for the dates of interest, namely, 01/02/2007 and 02/02/2007.

# I created a shell-script (get_data.sh, also in this repo) that downloads
# the zip file if needed, and extract only the data for those two dates
raw_data <- read.csv("02-2007-household_power_consumption.csv", sep=";")

png("plot1.png")
hist(raw_data$Global_active_power, col='red', breaks=15,
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()