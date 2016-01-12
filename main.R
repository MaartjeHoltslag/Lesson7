#Stofzuigerzaag
#Jorn Habes & Maartje Holtslag
#12-1-2016

#Import libraries
library(raster)
library(rgdal)
library(sp)

#Import data
source("data/downloadFile.R")
source("R/selectExtent.R")
source("R/NDVImatrix.R")
source("R/greenestCity.R")
source("R/greenestProvince.R")

#Create rasterBrick
modisPath <- list.files(pattern = glob2rx('MOD13*.grd'), full.names = TRUE)
modis <- brick(modisPath)

#Select Province
#selection <- selectExtent("province")


#select City
selection <- selectExtent("city")
#Transfrom to modis coordinate system
transformSelection <- spTransform(selection, CRS(proj4string(modis)))
#Create matrix
NDVImonth <- NDVImatrix(transformSelection, modis)

#Examples Cities
greenestCity("Average")
greenestCity("January")
greenestCity("August")
#Example plot, greenest city August
VordenContour <- transformSelection[transformSelection$NAME_2 == "Vorden",]
maskVorden <- mask(modis,VordenContour)
plot(maskVorden,ext=VordenContour)

# #Examples Provinces
# greenestProvince("Average")
# greenestProvince("January")
# greenestProvince("August")

