#Clean up a data file so it is more useable  

#First, read it in to make it a dataframe with one header
#Select the line with the most useful information 
header_weather<-scan("weather.txt",skip = 1, sep= "\t", nlines = 1, what= character())
#Select all the data
weather<-read.table("weather.txt", skip= 4, na.strings = "?", sep = "\t", stringsAsFactors = FALSE)
#Put the header and the data together
names(weather)<-header_weather

#Lets just work with time, total rainfall, total solar radiation, max air temp, and min air temp -- select these columns

weat<- weather[,c(1,6,10,11,13)]

#Give the column new names -- "date", "total_rain_in", "total_rad_MJ", "max_temp_F", "min_temp_F"

names(weat)<- c("date", "total_rain_in", "total_rad_MJ", "max_temp_F", "min_temp_F")

#Filter the data to make sure you have reasonable values
  #Between 0 and 6 for total rain
  #Between 30 and 70 for total radiation
  #Between 0 and 100 for max temps
  #max temp cannot be lower than min temp

temp<-weat[weat$total_rain_in %in% c(0:6),]

#Create a rain column in millimeters and temperature columns in degrees C

#Create a column which labels anything before Sept 22 as "summer" and Sept 22 and after as "autumn" 

#Now get the date column to read as a date in R  

#Make a few simple plots of your data to see if it looks okay and everything is the right class

#Write the data to a .csv to share with your collaborator
write.csv(clean, file="2016 weather.csv", row.names=FALSE, quote=FALSE)

