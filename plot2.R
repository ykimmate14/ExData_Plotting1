# Reading and loading data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character"))
df$Date <- paste(df$Date, df$Time, sep = ",")
df$Time <- NULL
df$Date <- strptime(df$Date, format = "%d/%m/%Y,%H:%M:%S")


## extract data from the dates 2007-02-01 and 2007-02-02
df <- subset(df, df$Date >= "2007-02-01" & df$Date < "2007-02-03")

## convert class of columns with numbers to "numeric"
df[,2:8] <- lapply(df[,2:8], as.numeric)

# Creating plot 2
with(df, plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()
