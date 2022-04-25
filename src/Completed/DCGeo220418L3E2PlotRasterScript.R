#Introduction to Geospatial Raster and Vector Data with R (Lesson 3)
#Plot Raster Data (Episode 2)

#Split data into 3 bins
DSM_HARV_df <- DSM_HARV_df %>%
  mutate(fct_elevation = cut(HARV_dsmCrop, breaks = 3))

#Plot histogram
ggplot() +
  geom_bar(data = DSM_HARV_df, aes(fct_elevation))

#Get cutoff values by returning unique values
unique(DSM_HARV_df$fct_elevation)

#Get count of values
DSM_HARV_df %>%
  group_by(fct_elevation) %>%
  count()

#Create list of custom cutoff values
custom_bins <- c(300, 350, 400, 450)

#Bin data into 3 groups by custom cutoff values
DSM_HARV_df <- DSM_HARV_df %>%
  mutate(fct_elevation_2 = cut(HARV_dsmCrop, breaks = custom_bins))

#Check new custom cutoff values
unique(DSM_HARV_df$fct_elevation_2)

#Plot histogram with custom cutoff values
ggplot() +
  geom_bar(data = DSM_HARV_df, aes(fct_elevation_2))

#Get count of values
DSM_HARV_df %>%
  group_by(fct_elevation_2) %>%
  count()

#Plot raster data
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  coord_quickmap()

#Create a 3-color palette
terrain.colors(3)

#Plot using 3-color palette
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  scale_fill_manual(values = terrain.colors(3)) + 
  coord_quickmap()

#Create 3-color palette object
my_col <- terrain.colors(3)

#Plot using 3-color palette object
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  scale_fill_manual(values = my_col, name = "Elevation") + 
  coord_quickmap()

#Add x and y labels and a chart title
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  scale_fill_manual(values = my_col, name = "Elevation") + 
  labs(x = "x coordinate",y = "y coordinate", title = "Elevation") +
  coord_quickmap()

#Question: What do you think removing <name = "Elevation"> does?

#Turn off labels
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y,
                                       fill = fct_elevation_2)) + 
  scale_fill_manual(values = my_col, name = "Elevation") +
  theme(axis.title = element_blank()) + 
  coord_quickmap()

#Import DSM hillshade
DSM_hill_HARV <-
  raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_DSMhill.tif")

#View structure of DSM hillshade
DSM_hill_HARV

#Convert to dataframe
DSM_hill_HARV_df <- as.data.frame(DSM_hill_HARV, xy = TRUE) 

#View structure of dataframe
str(DSM_hill_HARV_df)

#Plot hillshade data
ggplot() +
  geom_raster(data = DSM_hill_HARV_df,
              aes(x = x, y = y, alpha = HARV_DSMhill)) + 
  scale_alpha(range =  c(0.15, 0.65), guide = "none") + 
  coord_quickmap()

#Plot DSM data over hillshade data; note ggtitle() as another way to add a title
ggplot() +
  geom_raster(data = DSM_HARV_df , 
              aes(x = x, y = y, 
                  fill = HARV_dsmCrop)) + 
  geom_raster(data = DSM_hill_HARV_df, 
              aes(x = x, y = y, 
                  alpha = HARV_DSMhill)) +  
  scale_fill_viridis_c() +  
  scale_alpha(range = c(0.15, 0.65), guide = "none") +  
  ggtitle("Elevation with hillshade") +
  coord_quickmap()