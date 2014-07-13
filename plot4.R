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


# Open png device; create 'plot4.png'
png(filename = "plot4.png", width = 480, height = 480 )

    par(mfcol = c(2,2))

  # Graph 1
    
    # Getting the variables 
<<<<<<< HEAD
    x <- powerSelect$dateTime
=======
    x <- powerSelect[,1]
>>>>>>> e7aeb92c9c67c3a780d3d8afd34e9659f81c3e5f
    y <- powerSelect$Global_active_power

    # Ploting the grahp
    plot(x,y, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l") 


  # Graph 2
    
    # Getting the variables
    sub1 <- powerSelect$Sub_metering_1
    sub2 <- powerSelect$Sub_metering_2
    sub3 <- powerSelect$Sub_metering_3

    # Plotting the graph
    plot(x,sub1, xlab = "", ylab = "Energy sub metering", type = "n") 
    lines(x, sub1, col ="black")
    lines(x, sub2, col = "red")
    lines(x, sub3, col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
<<<<<<< HEAD
           lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
=======
           lty = c(1,1,1), col = c("black", "red", "blue"))
>>>>>>> e7aeb92c9c67c3a780d3d8afd34e9659f81c3e5f


  # Graph 3
    
    # Getting the variable
    Vol <- powerSelect$Voltage

    # Plotting the graph
    plot(x, Vol, xlab = "datetime", ylab = "Voltage", type = "l") 


  # Graph 4
    
    # Getting the variable
    Grp <- powerSelect$Global_reactive_power

    # Plotting the graph
<<<<<<< HEAD
    plot(x, Grp, xlab = "datetime", ylab = "Global_reactive_power", type = "n") 
    lines(x, Grp, col ="dimgrey")
    points(x, Grp, pch = 46, col = "black")
=======
    plot(x, Grp, xlab = "datetime", ylab = "Global_reactive_power", type = "l") 
    
>>>>>>> e7aeb92c9c67c3a780d3d8afd34e9659f81c3e5f
    par(mfrow = c(1,1))

# Close the png file device
dev.off() 

    


























 