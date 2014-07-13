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


# Open png device; create 'plot2.png'
png(filename = "plot2.png", width = 480, height = 480 )

    # Getting the variables 
    x <- powerSelect$dateTime
    y <- powerSelect$Global_active_power
    
    # Plotting the Grahp
    plot(x, y, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l") 

# Close the png file device
dev.off() 