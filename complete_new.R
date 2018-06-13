complete <- function(directory, id= 1:332){
    filelist <- list.files(path = directory, pattern = ".csv", full.names = T)
    
    compcases <- numeric()
    casenames <- numeric()
    
    for(i in id){
        compcases[i] <- nrow(na.omit(read.csv(filelist[i])))
        casenames[i] <- i
    }
    compcases <- compcases[!is.na(compcases)]
    casenames <- casenames[!is.na(casenames)]
    
    data.frame('id' = casenames,  nobs = compcases)
}