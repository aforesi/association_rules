#Now test application of income data geared towards how Prof McNicholas used on the titanic data set

library(arules)
source("C:/Users/Andrew Foresi/Documents/A Masters Year 1/CSE 780/Assignment 1/Practice Code/std_lift.R")
data(Income)
apriori(Income)

?Income


params<-list(support=0.02,confidence=0.75, minlen=2, maxlen=6)
fit1<-apriori(Income,parameter=params)
inspect(fit1, by="lift") 
inspect(sort(fit1[1:100], by="lift")) 

fit2<-fit1
quality(fit2)<-std_lift(fit2,Income)
inspect(sort(fit2[1:10], by = "slift"))


app<-list(rhs=c("income=$40,000+"),default="lhs")
fit3<-apriori(Income,parameter=params,appearance=app)
quality(fit3)<-std_lift(fit3,Income)
inspect(sort(fit3[1:10], by = "slift"))

app <- list(default="none", rhs=c("householder status=rent"),lhs=c("type of home=apartment"))
fit4 <- apriori(Income, parameter=params, appearance=app)
quality(fit4)<-std_lift(fit4,Income)
inspect(sort(fit4, by = "slift"))
?apriori()


