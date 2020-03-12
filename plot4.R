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
## plot4
par(mfrow=c(2,2))
with(my_df,plot(datetime,Global_active_power,ylab="Global Active Power", type="l",xlab=""))
with(my_df,plot(datetime,Voltage,ylab="Voltage", type="l",xlab="datetime"))
with(my_df,plot(datetime,Sub_metering_1,ylab="Energy sub metering", type="l",xlab=""))
with(my_df,lines(datetime,Sub_metering_2, col="red"))
with(my_df,lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(my_df,plot(datetime,Global_reactive_power,ylab="Global_reactive_power", type="l",xlab="datetime"))
dev.copy(png,file="plot4.png")
dev.off()


