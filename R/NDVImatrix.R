NDVImatrix <- function(x,y){
	NDVI = matrix(data=NA, nrow=length(x), ncol=12)
	if (length(x)<15){
		rownames(NDVI) <- x$NAME_1}
	else{
		rownames(NDVI) <- x$NAME_2}
	for (i in 1:length(x)){
		maskExtent <- mask(y,x[i,])
		meanNDVI <- cellStats(maskExtent, stat='mean', na.rm=TRUE)
		NDVI[i,] <- c(meanNDVI)
	}
	NDVImatrixMeans <- cbind(NDVI, rowMeans(NDVI))
	colnames(NDVImatrixMeans)<- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "Average")
	return(NDVImatrixMeans)
}
