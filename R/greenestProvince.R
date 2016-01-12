greenestProvince <- function(month){
	if (month == "Average"){
		sprintf("On yearly %s %s is the greenest province with a NDVI of %f",month, names(which.max(NDVImonth[,month])), max(NDVImonth[,month]))
	}
	else{
		sprintf("%s is the greenest province in %s with a NDVI of %f", names(which.max(NDVImonth[,month])),month, max(NDVImonth[,month]))
	}
}