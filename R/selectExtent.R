selectExtent <- function(mapExtent){

	if(mapExtent == "city"){
		nlCity <- raster::getData('GADM',country='NLD', level=2)
		}
	else if(mapExtent == "province"){
		nlCity <- raster::getData('GADM',country='NLD', level=1)
	}
	else{print("Wrong input, type city or province.")
	}
	return(nlCity)
}
