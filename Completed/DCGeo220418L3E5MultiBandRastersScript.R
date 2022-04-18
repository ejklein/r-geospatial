#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Work with Multi-Band Rasters (Episode 5)

#Import raster band
RGB_band1_HARV <- raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_RGB_Ortho.tif")

#Convert to df
RGB_band1_HARV_df  <- as.data.frame(RGB_band1_HARV, xy = TRUE)

#Plot
ggplot() +
  geom_raster(data = RGB_band1_HARV_df,
              aes(x = x, y = y, alpha = HARV_RGB_Ortho)) + 
  coord_quickmap()

#Import the green band
RGB_band2_HARV <-  raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_RGB_Ortho.tif", band = 2)

#Convert to df
RGB_band2_HARV_df <- as.data.frame(RGB_band2_HARV, xy = TRUE)

#Plot
ggplot() +
  geom_raster(data = RGB_band2_HARV_df,
              aes(x = x, y = y, alpha = HARV_RGB_Ortho)) + 
  coord_equal()

#Import all bands of a multi-band raster at once
RGB_stack_HARV <- stack("data/NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_RGB_Ortho.tif")

#Preview the attributes of your stack object
RGB_stack_HARV

#Preview the attributes of each band in the stack in a single output
RGB_stack_HARV@layers

#Specify which band you'd like to view attributes for using an index value (starting with 1). This is helpful for hyper-spectral rasters.
RGB_stack_HARV[[2]]

#Convert the stack into df
RGB_stack_HARV_df  <- as.data.frame(RGB_stack_HARV, xy = TRUE)

#Check the structure of our df
str(RGB_stack_HARV_df)

#Create a histogram of the first band
ggplot() +
  geom_histogram(data = RGB_stack_HARV_df, aes(HARV_RGB_Ortho.1))

#Plot the second band
ggplot() +
  geom_raster(data = RGB_stack_HARV_df,
              aes(x = x, y = y, alpha = HARV_RGB_Ortho.2)) + 
  coord_quickmap()

#Plot a 3-band image using our stack (no df needed since we're not using ggplot2)
plotRGB(RGB_stack_HARV,
        r = 1, g = 2, b = 3)

#Stretch the pixel values to the full 0-255 scale using linear method
plotRGB(RGB_stack_HARV,
        r = 1, g = 2, b = 3,
        scale = 800,
        stretch = "lin")

#Stretch the pixel values to the full 0-255 scale using histogram method
plotRGB(RGB_stack_HARV,
        r = 1, g = 2, b = 3,
        scale = 800,
        stretch = "hist")

#Check size of stack created using RasterStack
object.size(RGB_stack_HARV)

#Create stack using RasterBrick instead of RasterStack
RGB_brick_HARV <- brick(RGB_stack_HARV)

#Check size of stack created with Raster Brick
object.size(RGB_brick_HARV)

#Plot the RasterBrick stack
plotRGB(RGB_brick_HARV)
