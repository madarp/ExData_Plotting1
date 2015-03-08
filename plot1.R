# Coursera Exploratory Data Analysis
# Course Project 1
# Author: pmadar
# Assignment Plot1

print("Begin plot1")

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

print("Creating plot1.png")
png("plot1.png", 480, 480)
par(mfrow=c(1,1))
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

print("Plot1 done.")
