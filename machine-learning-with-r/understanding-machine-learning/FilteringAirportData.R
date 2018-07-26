#setwd("/Users/leeand/dev/machine-learning/machine-learning-with-r/understanding-machine-learning")
origData<-read.csv2("188820802_T_ONTIME.csv",sep=",",header=TRUE,stringsAsFactors = FALSE)
airports<-c('ATL','PHX')
origData<-subset(origData,DEST %in% airports & ORIGIN %in% airports)
nrow(origData)
head(origData)
tail(origData)
origData$X<-NULL

cor(origData[c("ORIGIN_AIRPORT_SEQ_ID","ORIGIN_AIRPORT_ID")]) #should be perfect correlation
cor(origData[c("DEST_AIRPORT_SEQ_ID","DEST_AIRPORT_ID")]) #should be perfect correlation

origData$ORIGIN_AIRPORT_SEQ_ID<-NULL
origData$DEST_AIRPORT_SEQ_ID<-NULL

mismatched<-origData[origData$CARRIER != origData$UNIQUE_CARRIER,]
nrow(mismatched) #should be zero

origData$UNIQUE_CARRIER<-NULL

head(origData,2)