## Create a data frame
getData <- function(subjectFile,
                    labelFile,
                    dataFile,
                    activities,
                    features){
  if (!file.exists(type)){
    stop("File does not exist")
  }
  
  subjects <- read.table(subjectFile,
                         col.names=c("Subject.ID"))
  
  labels <- read.table(labelFile,
                       col.names=c("Activity.Code"))
  
  data <- read.table(dataFile,
                     col.names=features)
  
  ## get activity descriptions
  activities <- merge(x=labels,y=activities,
                      by.x="Activity.Code",
                      by.y="Activity.Code",
                      all.x=TRUE,
                      all.y=FALSE)
  
  return (data.frame(cbind(subjects,
                           activities,
                           data)))
}