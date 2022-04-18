#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Intro to Raster Data (Episode 1)

#Check working directory path
getwd()

#Mute warnings of possible GDAL/OSR exportToProj4() degradation, use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal.
options("rgdal_show_exportToProj4_warnings"="none")

#Load raster, rgdal, ggplot2, and dplyr libraries


#View raster file attributes/metadata


#Store the metadata in an object


#Import the raster file


#View data structure of imported file


#View descriptive statistics of imported file


#View descriptive statistics of imported file using more (or all) cells


#Convert raster file to dataframe


#View structure of dataframe


#Plot the data


#For faster, simpler plots, you can use the plot function from the raster package.


#View CRS metadata (ignore WKT2 2019 representation output)


#Calculate minimum and maximum values


#If the minimum and maximum values haven’t already been calculated, we can calculate them using the setMinMax() function.
#DSM_HARV <- setMinMax(DSM_HARV)

#View number of bands


#Plot with highlighted NA values


#Plot histogram to view distribution of values


#Plot histogram with 40 bins
