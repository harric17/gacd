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
names(test3)[2] = "activity"

### get means and sds
x = names(test3)[-1]
mymean = rep(0,length(x))
mysd = rep(0,length(x))
for (i in 1:length(x)){
  mymean[i] = mean(test3[,x[i]])
  mysd[i] = sd(test3[,x[i]])
}

mydf = as.data.frame(cbind(Var=x,Mean=mymean,SD=mysd))
mydf$Mean = as.numeric(as.character(mydf$Mean))
mydf$SD = as.numeric(as.character(mydf$SD))
mydf



###Aggregate by subject

aggdata = aggregate(test3,by=list(test3$user,test3$activity),FUN=mean)
dim(aggdata)
aggdata[1:10,1:6]
aggdata$Group.1=NULL
aggdata$Group.2=NULL

### Output

write.table(aggdata,file = "../project/project.txt", row.name=FALSE)

