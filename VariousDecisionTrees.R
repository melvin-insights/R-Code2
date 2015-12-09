library(rpart) 
library(rpart.plot)
library(tree)
library(evtree) 
 
pf <- Species~.
s<-sample(150,100)
iris_train <- iris[s,]
iris_test <- iris[-s,]

##rpart
dtm <- rpart(pf , data=iris_train, method="class")
rpart.plot(dtm , type=4, extra=101)
p<-predict(dtm, iris_test, type="class")
table(iris_test[,5],p )
mean(p== iris_test[,5])

##tree
dtm <- tree(pf , data=iris_train)
plot(dtm); text(dtm)
p<-predict(dtm, iris_test, type="class")
table(iris_test[,5],p )
mean(p== iris_test[,5])

##evtree
dtm <- evtree(pf , data=iris_train)
plot(dtm)
p<-predict(dtm, iris_test)
table(iris_test[,5],p )
mean(p== iris_test[,5])
