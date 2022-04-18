#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Work with Multi-Band Rasters (Episode 5)

#Import raster band


#Convert to df


#Plot


#Import the green band


#Convert to df


#Plot


#Import all bands of a multi-band raster at once


#Preview the attributes of your stack object


#Preview the attributes of each band in the stack in a single output


#Specify which band you'd like to view attributes for using an index value (starting with 1). This is helpful for hyper-spectral rasters.


#Convert the stack into df


#Check the structure of our df


#Create a histogram of the first band


#Plot the second band


#Plot a 3-band image using our stack (no df needed since we're not using ggplot2)


#Stretch the pixel values to the full 0-255 scale using linear method


#Stretch the pixel values to the full 0-255 scale using histogram method


#Check size of stack created using RasterStack


#Create stack using RasterBrick instead of RasterStack


#Check size of stack created with Raster Brick


#Plot the RasterBrick stack
