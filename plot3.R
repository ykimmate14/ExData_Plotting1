# Reading and loading data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character"))
df$Date <- paste(df$Date, df$Time, sep = ",")
df$Time <- NULL
df$Date <- strptime(df$Date, format = "%d/%m/%Y,%H:%M:%S")


## extract data from the dates 2007-02-01 and 2007-02-02
df <- subset(df, df$Date >= "2007-02-01" & df$Date < "2007-02-03")

## convert class of columns with numbers to "numeric"
df[,2:8] <- lapply(df[,2:8], as.numeric)

# Creating plot 3
par(mfrow = c(1,1))
with(df, plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df, lines(Date, Sub_metering_2, col = "red") )
with(df, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
