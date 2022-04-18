getwd()
#result should be "<your path>/r-geospatial" if you used the tip at the beginning of lesson 2

#To mute warnings of possible GDAL/OSR exportToProj4() degradation, use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal.
options("rgdal_show_exportToProj4_warnings"="none")

library(raster)
library(rgdal)
library(ggplot2)
library(dplyr)

#Lesson 3 Episode 1

GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

HARV_dsmCrop_info <- capture.output(
  GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
)

DSM_HARV <- 
  raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
DSM_HARV

summary(DSM_HARV)
summary(DSM_HARV, maxsamp = ncell(DSM_HARV))

DSM_HARV_df <- as.data.frame(DSM_HARV, xy = TRUE)
str(DSM_HARV_df)

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = HARV_dsmCrop)) +
  scale_fill_viridis_c() +
  coord_quickmap()

#For faster, simpler plots, you can use the plot function from the raster package.
plot(DSM_HARV)

crs(DSM_HARV)
#ignore WKT2 2019 representation output
#<+ellps=WGS84 +towgs84=0,0,0> is missing - PROJ4 deprecation related issue

minValue(DSM_HARV)
maxValue(DSM_HARV)

#If the minimum and maximum values haven’t already been calculated, we can calculate them using the setMinMax() function.
#DSM_HARV <- setMinMax(DSM_HARV)

nlayers(DSM_HARV)

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = HARV_dsmCrop)) +
  scale_fill_viridis_c(na.value = 'deeppink') +
  coord_quickmap()

HARV_dsmCrop_info

ggplot() +
  geom_histogram(data = DSM_HARV_df, aes(HARV_dsmCrop))

ggplot() +
  geom_histogram(data = DSM_HARV_df, aes(HARV_dsmCrop), bins = 40)

#Challenge
GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_DSMhill.tif")

HARV_DSMhill_info <- capture.output(
  GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_DSMhill.tif")
)