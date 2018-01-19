library(plyr)
library(dplyr)
library(data.table)
ytest <-read.table("C:/Users/Anon/Desktop/cleandat/test/Y_test.txt")
Xtest <-read.table("C:/Users/Anon/Desktop/cleandat/test/X_test.txt")
subtest <-read.table("C:/Users/Anon/Desktop/cleandat/test/subject_test.txt")
Xtrain <-read.table("C:/Users/Anon/Desktop/cleandat/train/X_train.txt")
ytrain <-read.table("C:/Users/Anon/Desktop/cleandat/train/Y_train.txt")
subtrain <-read.table("C:/Users/Anon/Desktop/cleandat/train/subject_train.txt")
feat <-read.table("C:/Users/Anon/Desktop/cleandat/features.txt")
colnames(Xtrain) <- t(feat[2])
colnames(Xtest) <- t(feat[2])
Xtrain$activities <- Ytrain[,1]
Xtrain$participants <- subtrain[,1]
Xtest$activiteis <- ytest[,1]
Xtest$participants <- subtest[,1]
main <- rbind(Xtrain,Xtest)
duplicated(colnames(main))
main <-main[,!duplicated(colnames(main))]
mean <-grep("mean()",names(main),value = FALSE,fixed = TRUE)
mean <- append(mean,471:477)
imeanmat<-main[mean] 
std <- grep("std()",names(main),value = TRUE)
Istdmat <- main[std]
main$activiteis <- as.character(main$activiteis)
main$activiteis <- ["main$activiteis == 1"] <- "walking"
main$activiteis[main$activiteis == 2] <- "walking Upstairs"
main$activiteis[main$activiteis == 3] <- "walking downstairs"
main$activiteis[main$activiteis == 4] <- "sitting"
main$activiteis[main$activiteis == 5] <- "standing"
main$activiteis[main$activiteis == 6] <- "laying"
main$activiteis <- as.factor(main$activiteis)
names(main) <- gsub("Mag", "Magnitude" , names(main))
names(main) <- gsub("Gyro", "Gyroscope" , names(main))
names(main) <- gsub("t", "time" , names(main))
names(main) <- gsub("f", "Frequency" , names(main))
names(main) <- gsub("time", "t" , names(main))
names(main) <- gsub("^t", "time" , names(main))
names(main) <- gsub("Frequency", "f" , names(main))
names(main) <- gsub("^f", "Frequency" , names(main))
main$participants <- as.character(main$participants)
main$participants[main$participants == 1] = "Participant 1"
main$participants[main$participants == 2] = "Participant 2"
main$participants[main$participants == 3] = "Participant 3"
main$participants[main$participants == 4] = "Participant 4"
main$participants[main$participants == 5] = "Participant 5"
main$participants[main$participants == 6] = "Participant 6"
main$participants[main$participants == 7] = "Participant 7"
main$participants[main$participants == 8] = "Participant 8"
main$participants[main$participants == 9] = "Participant 9"
main$participants[main$participants == 10] = "Participant 10"
main$participants[main$participants == 11] = "Participant 11"
main$participants[main$participants == 12] = "Participant 12"
main$participants[main$participants == 13] = "Participant 13"
main$participants[main$participants == 14] = "Participant 14"
main$participants[main$participants == 15] = "Participant 15"
main$participants[main$participants == 16] = "Participant 16"
main$participants[main$participants == 17] = "Participant 17"
main$participants[main$participants == 18] = "Participant 18"
main$participants[main$participants == 19] = "Participant 19"
main$participants[main$participants == 20] = "Participant 20"
main$participants[main$participants == 21] = "Participant 21"
main$participants[main$participants == 22] = "Participant 22"
main$participants[main$participants == 23] = "Participant 23"
main$participants[main$participants == 24] = "Participant 24"
main$participants[main$participants == 25] = "Participant 25"
main$participants[main$participants == 26] = "Participant 26"
main$participants[main$participants == 27] = "Participant 27"
main$participants[main$participants == 28] = "Participant 28"
main$participants[main$participants == 29] = "Participant 29"
main$participants[main$participants == 30] = "Participant 30"
main$participants <- as.factor(main$participants)
finadat <-data.table(main)
finaldat <-data.table(main)
tidydat <- finaldat[,lapply(.SD,mean), by = "participants,activiteis"]
write.table(tidydat,file = "cleandat.txt",row.names = FALSE)
