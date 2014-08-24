trLb <- read.table("UCI HAR Dataset/train/y_train.txt")
tsLb <- read.table("UCI HAR Dataset/test/y_test.txt")
Lb <- rbind(trLb, tsLb)
names(Lb) <- c("ActivityType")

trSb <- read.table("UCI HAR Dataset/train/subject_train.txt")
tsSb <- read.table("UCI HAR Dataset/test/subject_test.txt")
Sb <- rbind(trSb, tsSb)
names(Sb) <- c("SubjectType")

trDt <- read.table("UCI HAR Dataset/train/X_train.txt")
tsDt <- read.table("UCI HAR Dataset/test/X_test.txt")
Dt <- rbind(trDt, tsDt)
names <- read.table("UCI HAR Dataset/features.txt")
names(Dt) <- names[,2]

selCols <- c(grep(names(Dt),pattern = "mean",ignore.case = TRUE),grep(names(Dt),pattern = "std",ignore.case = TRUE))
selCols <- selCols[order(selCols)]

Dt <- Dt[,selCols]

actLbs <- read.table("UCI HAR Dataset/activity_labels.txt")
Lb2 <- Lb
Lb2 <- cut(Lb2[[1]], breaks=6, labels=actLbs[,2])
Lb$ActivityType <- Lb2

Dt2 <- as.data.frame(cbind(Lb, Sb, Dt))

res <- data.frame()
by(Dt2, Dt2[,c(1:2)] , FUN = function(dt) { r <- data.frame(dt[1,1], dt[1,2]);
        mapply(function(a) { r <<- cbind(r, mean(a)) }, dt[,-(1:2)]);      res <<- rbind(res, r);  })

names(res) <- names(Dt2)
