corr <- function(directory, threshold=0){
    filelist <- list.files(path = directory, pattern = ".csv", full.names = T )
    cors <- vector()
    for(i in seq(filelist)){
        if((complete("specdata", i))$nobs > threshold){
            t <- read.csv(filelist[i])
            good <- complete.cases(t)
            ti <- t[good, ]
            cors[i] <- cor(ti[ , "sulfate"], ti[, "nitrate"])
        }
    }
    cors <- cors[!is.na(cors)]
    cors
}