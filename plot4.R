# Coursera Exploratory Data Analysis
# Course Project 1
# Author: pmadar
# Assignment Plot4

print("Begin plot4")

# The data file to read, as a connection
con <- file("exdata-data-household_power_consumption/household_power_consumption.txt","rt")

# Read the entire file into R at one gulp.
# Reading in chunks to pre-filter for desired date range did not produce much speed improvement.
print("Reading the data ...")
df <- read.table(con, header=TRUE, sep=';', na.strings="?")
close(con)

print("Converting timestamps ...")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

print("Subsetting to desired date range ...")
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"), ]

# create a separate POSIX timestamp by pasting Date and Time together
datetime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

print("Creating plot4.png")
png("plot4.png", 480, 480)
par(mfrow=c(2,2))

#upper left corner
plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#upper right corner
plot(datetime, df$Voltage, type="l", ylab="Voltage")
#lower left corner
plot(datetime, df$Sub_metering_1, col="black", type="l", xlab="",ylab="Energy sub metering")
lines(datetime, df$Sub_metering_2, col="red")
lines(datetime, df$Sub_metering_3, col="blue")
legend('topright',names(df[7:9]), lty=1, bty="n", col=c("black","red","blue"))
# lower right corner
plot(datetime,df$Global_reactive_power,type="l",ylab=names(df[4]))

dev.off()
par(mfrow=c(1,1))
print("Plot4 done.")
