# Type ctl+enter to run commands.
library(raster)
library(rgdal)
library(ggplot2)

harv_dsm = raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
harv_dsm
plot(harv_dsm)

harv_dsm_df = as.data.frame(harv_dsm, xy=TRUE)
head(harv_dsm_df)

harv_dsm_df$y[10000]

ggplot() + geom_raster(data=harv_dsm_df, aes(x=x, y=y, fill=HARV_dsmCrop)) +
  coord_quickmap() + scale_fill_viridis_c()

# Look at the min/max elevation values.
summary(harv_dsm_df)
range(harv_dsm_df$HARV_dsmCrop)
min(harv_dsm_df$HARV_dsmCrop)

# Investigate the coordinate reference system.
crs(harv_dsm)

# Layers in raster data files.
nlayers(harv_dsm)

# Missing data.
harv_ortho = raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_Ortho_wNA.tif")
harv_ortho
nlayers(harv_ortho)
plot(harv_ortho)
GDALinfo("data/NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_Ortho_wNA.tif")

harv_ortho_df = as.data.frame(harv_ortho, xy=TRUE)
head(harv_ortho_df)
ggplot() + geom_raster(data=harv_ortho_df, aes(x=x, y=y, fill=HARV_Ortho_wNA))

# Checking for bad data.
ggplot() + geom_histogram(data=harv_dsm_df, aes(HARV_dsmCrop))
ggplot() + geom_histogram(data=harv_dsm_df, aes(HARV_dsmCrop), bins=60)
range(harv_dsm_df$HARV_dsmCrop)

