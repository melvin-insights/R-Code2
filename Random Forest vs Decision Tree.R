library(rpart)
library(rpart.plot)
library(randomForest)

s<-sample(150,150)
iris_train <- iris[s,]
iris_test <- iris[-s,]

#rpart DT
dtm <- rpart(Species ~ ., data=iris_train, method="class")
#summary(dtm)
rpart.plot(dtm , type=4, extra=101)
p<-predict(dtm, iris_test, type="class")
table(iris_test[,5],p )
mean(p== iris_test[,5])

rfm <- randomForest(Species ~ ., iris_train)
#summary(rfm )
#rfm
p<-predict(rfm,iris_test)
#plot(p); text(p)
table(iris_test[,5],p)
mean(iris_test[,5]==p)
importance(rfm)