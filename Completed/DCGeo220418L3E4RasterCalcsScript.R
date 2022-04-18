#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Raster Calculations (Episode 4)

#Compare metadata about DTM and DSM data files
GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DTM/HARV_dtmCrop.tif")
GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

#Plot DSM
ggplot() +
  geom_raster(data = DSM_HARV_df , 
              aes(x = x, y = y, fill = HARV_dsmCrop)) +
  scale_fill_gradientn(name = "Elevation", colors = terrain.colors(10)) + 
  coord_quickmap()

#Plot DTM
ggplot() +
  geom_raster(data = DTM_HARV_df , 
              aes(x = x, y = y, fill = HARV_dtmCrop)) +
  scale_fill_gradientn(name = "Elevation", colors = terrain.colors(10)) + 
  coord_quickmap()

#Use raster calculations to subtract DTM from DSM to create CHM
CHM_HARV <- DSM_HARV - DTM_HARV

#Create dataframe from CHM
CHM_HARV_df <- as.data.frame(CHM_HARV,xy = TRUE)

#Plot CHM
ggplot() +
  geom_raster(data = CHM_HARV_df , 
              aes(x = x, y = y, fill = layer)) + 
  scale_fill_gradientn(name = "Canopy Height", colors = terrain.colors(10)) + 
  coord_quickmap()

#Create histogram of CHM to check distribution
ggplot(CHM_HARV_df) +
  geom_histogram(aes(layer))

#Use overlay function to create CHM
CHM_ov_HARV <- overlay(DSM_HARV,
                       DTM_HARV,
                       fun = function(r1, r2) { return( r1 - r2) })

#Convert to dataframe
CHM_ov_HARV_df <- as.data.frame(CHM_ov_HARV, xy = TRUE)

#Plot
ggplot() +
  geom_raster(data = CHM_ov_HARV_df, 
              aes(x = x, y = y, fill = layer)) + 
  scale_fill_gradientn(name = "Canopy Height", colors = terrain.colors(10)) + 
  coord_quickmap()

#Export a GeoTIFF to the results folder in your working directory
writeRaster(CHM_ov_HARV, filename = file.path("results", "CHM_HARV.tiff"),
            format="GTiff",
            overwrite=TRUE,
            NAflag=-9999)
