### Read File
df <- read.csv('titanic.csv')

###Check structure of the file
head(df)
str(df)
summary(df)


###Visualization
library(ggplot2)
ggplot(df,aes(Survived)) + geom_bar()
ggplot(df,aes(Pclass)) +geom_bar(aes(fill=factor(Pclass)))
ggplot(df,aes(Sex)) +geom_bar(aes(fill=factor(Sex)))
ggplot(df,aes(SibSp)) +geom_bar(aes(fill=factor(SibSp)))


#Data clean up

df$Survived = factor(df$Survived)
df$Pclass = factor(df$Pclass)
df$Parch = factor(df$Parch)
df$SibSp = factor(df$SibSp)

df$Age[is.na(df$Age)] <- 28

library(dplyr)

df <-select(df, -PassengerId, -Name, -Ticket, -Cabin, -Parch)
head(df)
#Machine Learning Exercise -> Split Data, Identify important variables and run predictions

library(caTools)

set.seed(150)

split <- sample.split(df$Survived, SplitRatio = 0.7)
train <- subset(df, split ==TRUE)
test <- subset(df, split ==FALSE)

model = glm(Survived ~., family = binomial(link = 'logit'), data = train)
summary(model)

result = predict(model, test, type = 'response')
result <- ifelse(result > 0.5, 1,0)


misClassError <- mean(result!=test$Survived)
print(1-misClassError)
