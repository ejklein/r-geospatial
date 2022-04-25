#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Reproject Raster Data (Episode 3)

#Import DTM and DTM hillshade data
DTM_HARV <- raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DTM/HARV_dtmCrop.tif")
DTM_hill_HARV <- raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DTM/HARV_DTMhill_WGS84.tif")

#Convert DTM and DTM hillshade to dataframe
DTM_HARV_df <- as.data.frame(DTM_HARV, xy = TRUE)
DTM_hill_HARV_df <- as.data.frame(DTM_hill_HARV, xy = TRUE)

#Create map of DTM layered over hillshade
ggplot() +
  geom_raster(data = DTM_HARV_df , 
              aes(x = x, y = y, 
                  fill = HARV_dtmCrop)) + 
  geom_raster(data = DTM_hill_HARV_df, 
              aes(x = x, y = y, 
                  alpha = HARV_DTMhill_WGS84)) +
  scale_fill_gradientn(name = "Elevation", colors = terrain.colors(10)) + 
  coord_quickmap()

#Plot DTM on its own for datacheck
ggplot() +
  geom_raster(data = DTM_HARV_df,
              aes(x = x, y = y,
                  fill = HARV_dtmCrop)) +
  scale_fill_gradientn(name = "Elevation", colors = terrain.colors(10)) + 
  coord_quickmap()

#Plot DTM hillshade on its own for datacheck
ggplot() +
  geom_raster(data = DTM_hill_HARV_df,
              aes(x = x, y = y,
                  alpha = HARV_DTMhill_WGS84)) + 
  coord_quickmap()

#Check CRS metadata for DTM and DTM hillshade
crs(DTM_HARV)
crs(DTM_hill_HARV)

#Reproject DTM hillshade to match DTM data
DTM_hill_UTMZ18N_HARV <- projectRaster(DTM_hill_HARV,
                                       crs = crs(DTM_HARV))

#Compare CRS of DTM hillshade with reprojected DTM hillshade
crs(DTM_hill_UTMZ18N_HARV)
crs(DTM_hill_HARV)

#Compare extent of DTM hillshade with reprojected DTM hillshade
extent(DTM_hill_UTMZ18N_HARV)
extent(DTM_hill_HARV)

#Compare resolution of DTM with reprojected DTM hillshade
res(DTM_hill_UTMZ18N_HARV)
res(DTM_HARV)

#Force new reprojected DTM hillshade to 1mx1m resolution and CRS to match DTM
DTM_hill_UTMZ18N_HARV <- projectRaster(DTM_hill_HARV,
                                       crs = crs(DTM_HARV),
                                       res = res(DTM_HARV))

#Compare resolution of DTM with reprojected DTM hillshade
res(DTM_hill_UTMZ18N_HARV)
res(DTM_HARV)

#Create dataframe with new reprojected DTM hillshade
DTM_hill_HARV_2_df <- as.data.frame(DTM_hill_UTMZ18N_HARV, xy = TRUE)

#Plot DTM and new reprojected DTM hillshade
ggplot() +
  geom_raster(data = DTM_HARV_df , 
              aes(x = x, y = y, 
                  fill = HARV_dtmCrop)) + 
  geom_raster(data = DTM_hill_HARV_2_df, 
              aes(x = x, y = y, 
                  alpha = HARV_DTMhill_WGS84)) +
  scale_fill_gradientn(name = "Elevation", colors = terrain.colors(10)) + 
  coord_quickmap()