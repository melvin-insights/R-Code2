
library(e1071)

s<-sample(150,100)
col<- c("Petal.Length", "Petal.Width", "Species")
iris_train <- iris[s,col]
iris_test <- iris[-s,col]


svmfit <- svm(Species ~., data = iris_train, kernel = "linear", cost = 100, gamma=0.001, scale = FALSE) # linear svm, scaling turned OFF
print(svmfit)
plot(svmfit, iris_train[,col])
p<-predict(svmfit, iris_test[,col], type="class")
table(p, iris_test[,3] )
mean(p== iris_test[,3])



