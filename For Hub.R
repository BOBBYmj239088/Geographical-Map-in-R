#Loading the necessary R Packages
library(ggplot2)
library(raster)
library(ggmap)
#Setting the baselines for the Map Template
options(digits = 3)
set.seed(1234)
theme_set(theme_minimal())
#Setting the Margins for the Map
margin <- c(left = 76.70,bottom = 10.60,right = 79.00,top = 12.30)
#Creating the Map Template based on the margins
template<-get_stamenmap(bbox = margin, maptype = "terrain",zoom = 9)
#Shows the Map Template
template
#Incorporation of Map template into ggmap 
ggmap(template)
#Creating our Dataframe.,i.e, Sampling details including Locations and Positivity
#Setting ID to read the dataframe easily
id<-c(1,2,3,4,5,6,7,8)
#Setting the Serial number
sr<-c(1,2,3,4,5,6,7,8)
# IDs of the Samples which gave positive results. 1=Positive 2=Negative
pos<-c(1,0,0,0,0,0,0,1)
#Latitudes of the Sampling places
lat<-c(10.9904,11.9804,11.1467,11.2467,11.1296,11.6460,11.1765,11.1042)
#Longitudes of the Sampling places
lng<-c(78.3356,78.1747, 78.1357, 78.1457, 78.1661, 78.6170, 78.2543, 77.8953)
# Making of the dataframe integrating all the variables above
df <- data.frame(id,pos,sr,lat,lng)
df # Map of all the locations as given above
(positivity <- df %>%filter(`pos` == 1)) #Declares how positives samples are assigned
positive<-(positivity <- df %>%filter(`pos` == 1)) #Creates the list(data) of positive samples
pos<-ggmap(template)+geom_point(data = positive,mapping = aes(x =lng,y =lat),size =4,shape = 24, fill = "red") #prints only the locations of positive samples
#Variable assignment to map all the sampling locations
a<- geom_point(data = df,mapping = aes(x =lng,y =lat),size =4,shape = 24, fill = "black")
#Variable assignment to map the locations of positive samples alone
b<- geom_point(data = positive,mapping = aes(x =lng,y =lat),size =4,shape = 24, fill = "red")
#Superimposition of both a (all locations) and b (positive locations) upon the Map Template
c<-ggmap(template)+a+b
#Visualization of the final map with locations of all samples , with positive ones highlighted
c
