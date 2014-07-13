# Reading the Database 
power <- read.table("household_power_consumption.txt", sep =";", header = TRUE, 
                    na.strings = "?", nrows = 72000, colClasses = c("character",
                    "character","numeric","numeric","numeric","numeric","numeric",
                    "numeric","numeric"))

# It is Extracted the observations between 1/2/2007 and 2/2/2007, both included
nSelect <- power$Date == "1/2/2007" | power$Date == "2/2/2007"
powerSelect <- power[nSelect,]

# The Date and Time variables are converted to Date/Time classes 
fecha <- paste(as.Date(powerSelect[,1],format = "%d/%m/%Y"),powerSelect[,2])
dateTime <- strptime(fecha, "%Y-%m-%d %H:%M:%S")
powerSelect <- cbind(dateTime, powerSelect)


# Open png device; create 'plot3.png'
png(filename = "plot3.png", width = 480, height = 480 )

    # Getting the variables 
    x <- powerSelect[,1]
    sub1 <- powerSelect$Sub_metering_1
    sub2 <- powerSelect$Sub_metering_2
    sub3 <- powerSelect$Sub_metering_3

    # Plotting the Grahp
    plot(x,sub1, xlab = "", ylab = "Energy sub metering", type = "n") 
    lines(x, sub1, col ="black")
    lines(x, sub2, col = "red")
    lines(x, sub3, col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue")) 

# Close the png file device
dev.off() 