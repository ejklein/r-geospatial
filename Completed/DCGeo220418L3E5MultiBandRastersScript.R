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
