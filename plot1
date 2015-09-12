# Reading and loading data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character"))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## extract data from the dates 2007-02-01 and 2007-02-02
df <- subset(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")

## convert class of columns with numbers to "numeric"
df[,3:9] <- lapply(df[,3:9], as.numeric)

# Creating plot 1
## Histogram whose x-axis is Global Active Power (kilowatts), y-axis is frequency.
with(df, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()
