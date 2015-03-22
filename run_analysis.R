setwd("C:/Users/harric17/Desktop/gacd/project/")


### read in train and test files
### combine with Y and user files

train = read.table("X_train.txt")
trainy = read.table("y_train.txt")
trainu = read.table("subject_train.txt")
names(trainy)="Y"
names(trainu)="user"
train2 = cbind(trainu,trainy,train)
names(train2)[1:10]
dim(train2) 
train2[1:10,1:10]

test = read.table("X_test.txt")
testy = read.table("y_test.txt")
testu = read.table("subject_test.txt")

names(testy)="Y"
names(testu)="user"
test2 = cbind(testu,testy,test)
names(test2)[1:10]
dim(test2)
test2[1:10,1:10]


### combine test and train files

test3 = rbind(test2,train2)
dim(test3)
names(test3)
head(test3[,])
table(test3$user)

### rename variables

vars = read.table("features.txt")
vars2=as.character(vars$V2)
names(test3)[3:length(names(test3))]=vars2
names(test3)[2] = "activity2"



### rename activity levels

mylabs=read.table("activity_labels.txt")
mylabs$V2 = as.character(mylabs$V2)
sort(unique(test3$activity2))
for (i in 1:length(mylabs$V2)){
test3$activity[test3$activity2==i]=mylabs$V2[i]
}

class(test3$activity)
test3$activity=as.factor(test3$activity)
test3$activity2=NULL

### get vars with means and std's
test3=test3[,c("user","activity",names(test3)[grepl("[Mm]ean|[Ss]t.*[Dd]ev|[Ss][Dd]|[Ss][Dd]|[Ss][Tt][Dd]",names(test3))])]
dim(test3)
table(test3$activity)

### get means and sds
# x = names(test3)[-1]
# mymean = rep(0,length(x))
# mysd = rep(0,length(x))
# for (i in 1:length(x)){
#   mymean[i] = mean(test3[,x[i]])
#   mysd[i] = sd(test3[,x[i]])
# }
# 
# mydf = as.data.frame(cbind(Var=x,Mean=mymean,SD=mysd))
# mydf$Mean = as.numeric(as.character(mydf$Mean))
# mydf$SD = as.numeric(as.character(mydf$SD))
# mydf



###Aggregate by subject
x=names(test3)[-c(1,2)]
aggdata = aggregate(test3[,x],by=list(user=test3$user,activity=test3$activity),FUN=mean)
dim(aggdata)
aggdata[1:10,1:6]


### Output
 
write.table(aggdata,file = "../project/project.txt", row.name=FALSE)

