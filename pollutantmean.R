wd <- getwd()

readfile <- function(id){
    read.csv(dir()[id])
}

meanof <- function(pollutant, id){
    t <- readfile(id)
    mean(t[ , pollutant], na.rm = T)
}

pollutantmean <- function(directory, pollutant, id = 1:332){
    setwd(directory)
    filemeans <- numeric()
    filelengths <- numeric()
    for(i in id){
        filemeans[i] <- meanof(pollutant, i)
        filelengths[i] <- nrow(
            na.omit(readfile(i)[ , pollutant, drop = F])
        )
    }
    setwd(wd)
    filemeans1 <- filemeans[!is.na(filemeans)]
    filelengths1 <- filelengths[!is.na(filelengths)]
    weighted.mean(filemeans1, filelengths1)
    
    

}