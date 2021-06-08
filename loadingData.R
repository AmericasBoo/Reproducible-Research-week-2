 fileurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
    zipfile <- "./course5week2/data.zip" 
    # download the file to folder DataScience under the working
    # directory
    filedir <- "./courseRRweek2"
    unzip_path <- "./course5week2/data"  ##### path for storing the unzipped files #######
    if (!file.exists(filedir)){
        dir.create(filedir)
    }
    download.file(fileurl,file.path(zipfile))
    unzip(zipfile,exdir=unzip_path) ####### exdir is the extract directory ##########
    datafile <- file.path(unzip_path,"activity.csv")
    
    activity <- read.csv(datafile)
    
    activity$date <- ymd(activity$date)
    activity$weekend <- as.factor(ifelse(weekdays(activity$date)=="Saturday" | weekdays(activity$date)=="Sunday","weekend","weekday"))
