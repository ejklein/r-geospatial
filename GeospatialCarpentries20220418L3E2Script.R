getwd()
#result should be "<your path>/r-geospatial" if you used the tip at the beginning of lesson 2

#To mute warnings of possible GDAL/OSR exportToProj4() degradation, use options("rgdal_show_exportToProj4_warnings"="none") before loading sp or rgdal.
options("rgdal_show_exportToProj4_warnings"="none")

library(raster)
library(rgdal)
library(ggplot2)
library(dplyr)

#Lesson 3 Episode 2

DSM_HARV_df <- DSM_HARV_df %>%
  mutate(fct_elevation = cut(HARV_dsmCrop, breaks = 3))

ggplot() +
  geom_bar(data = DSM_HARV_df, aes(fct_elevation))

unique(DSM_HARV_df$fct_elevation)

DSM_HARV_df %>%
  group_by(fct_elevation) %>%
  count()

custom_bins <- c(300, 350, 400, 450)

DSM_HARV_df <- DSM_HARV_df %>%
  mutate(fct_elevation_2 = cut(HARV_dsmCrop, breaks = custom_bins))

unique(DSM_HARV_df$fct_elevation_2)

ggplot() +
  geom_bar(data = DSM_HARV_df, aes(fct_elevation_2))

DSM_HARV_df %>%
  group_by(fct_elevation_2) %>%
  count()

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  coord_quickmap()

terrain.colors(3)

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  scale_fill_manual(values = terrain.colors(3)) + 
  coord_quickmap()

my_col <- terrain.colors(3)
ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  scale_fill_manual(values = my_col, name = "Elevation") + 
  coord_quickmap()

?ggplot
?ggplot2

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = fct_elevation_2)) + 
  scale_fill_manual(values = my_col, name = "Elevation") + 
  labs(x = "x coordinate",y = "y coordinate", title = "Elevation") +
  coord_quickmap()

#Guess: What do you think removing <name = "Elevation"> does?

ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y,
                                       fill = fct_elevation_2)) + 
  scale_fill_manual(values = my_col, name = "Elevation") +
  theme(axis.title = element_blank()) + 
  coord_quickmap()

DSM_hill_HARV <-
  raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_DSMhill.tif")
DSM_hill_HARV

DSM_hill_HARV_df <- as.data.frame(DSM_hill_HARV, xy = TRUE) 

str(DSM_hill_HARV_df)

ggplot() +
  geom_raster(data = DSM_hill_HARV_df,
              aes(x = x, y = y, alpha = HARV_DSMhill)) + 
  scale_alpha(range =  c(0.15, 0.65), guide = "none") + 
  coord_quickmap()

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

#Note ggtitle() as another way to add a title
