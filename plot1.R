## read and clean data
df <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep = ";",stringsAsFactors = FALSE)
my_df <- df[as.Date(df$Date,format="%d/%m/%Y")>=as.Date("01/02/2007",format="%d/%m/%Y") & as.Date(df$Date,format="%d/%m/%Y")<=as.Date("02/02/2007",format="%d/%m/%Y"),]
my_df$datetime <- strptime(paste(my_df$Date,my_df$Time), "%d/%m/%Y %H:%M:%S")
my_df$Global_active_power <- as.numeric(my_df$Global_active_power)
my_df$Global_reactive_power <- as.numeric(my_df$Global_reactive_power)
my_df$Voltage <- as.numeric(my_df$Voltage)
my_df$Sub_metering_1 <- as.numeric(my_df$Sub_metering_1)
my_df$Sub_metering_2 <- as.numeric(my_df$Sub_metering_2)
my_df$Sub_metering_3 <- as.numeric(my_df$Sub_metering_3)
## plot1
hist(my_df$Global_active_power,col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()