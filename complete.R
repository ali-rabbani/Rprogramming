complete <- function(directory , id = 1:332){
    filelist <- list.files(path = directory, pattern = ".csv" , full.names = T)
    dataframe <- data.frame()
    for(i in id){
        compcases <- sum(complete.cases(read.csv(filelist[i])))
        dataframe1 <- data.frame("id" = i, "nobs" = compcases)
        dataframe <- rbind(dataframe, dataframe1)
    }
    print(dataframe)
}