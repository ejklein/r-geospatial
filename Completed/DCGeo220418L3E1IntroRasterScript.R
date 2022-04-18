#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Intro to Raster Data (Episode 1)

#Check working directory path
getwd()

#Mute warnings of possible GDAL/OSR exportToProj4() degradation, use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal.
options("rgdal_show_exportToProj4_warnings"="none")

#Load raster, rgdal, ggplot2, and dplyr libraries
library(raster)
library(rgdal)
library(ggplot2)
library(dplyr)

#View raster file attributes/metadata
GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

#Store the metadata in an object
HARV_dsmCrop_info <- capture.output(
  GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
)

#Import the raster file
DSM_HARV <- 
  raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

#View data structure of imported file
DSM_HARV

#View descriptive statistics of imported file
summary(DSM_HARV)

#View descriptive statistics of imported file using more (or all) cells
summary(DSM_HARV, maxsamp = ncell(DSM_HARV))

#Convert raster file to dataframe
DSM_HARV_df <- as.data.frame(DSM_HARV, xy = TRUE)

#View structure of dataframe
str(DSM_HARV_df)

#Plot the data
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = HARV_dsmCrop)) +
  scale_fill_viridis_c() +
  coord_quickmap()

#For faster, simpler plots, you can use the plot function from the raster package.
plot(DSM_HARV)

#View CRS metadata (ignore WKT2 2019 representation output)
crs(DSM_HARV)

#Calculate minimum and maximum values
minValue(DSM_HARV)
maxValue(DSM_HARV)

#If the minimum and maximum values haven’t already been calculated, we can calculate them using the setMinMax() function.
#DSM_HARV <- setMinMax(DSM_HARV)

#View number of bands
nlayers(DSM_HARV)

#Plot with highlighted NA values
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = HARV_dsmCrop)) +
  scale_fill_viridis_c(na.value = 'deeppink') +
  coord_quickmap()

#Plot histogram to view distribution of values
ggplot() +
  geom_histogram(data = DSM_HARV_df, aes(HARV_dsmCrop))

#Plot histogram with 40 bins
ggplot() +
  geom_histogram(data = DSM_HARV_df, aes(HARV_dsmCrop), bins = 40)