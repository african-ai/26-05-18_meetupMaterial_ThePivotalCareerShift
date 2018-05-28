# import all the packages you'll need
# just arranging my work :P

library(tidyverse)
library(corrplot)
library(stringr)
library(readr)
library(caret)

# importing data with read.csv function
(iris.ml <- read.csv('/Users/brendamainye/Documents/machine.learning.presentation/archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data',
                     col.names = c('sepal_length', 'sepal_width', 'petal_length','petal_width', 'species')))

# confirm if its correct: see the first 5 observations of the dataset
head(iris.ml)

# if you copy-paste more than 2 twice. It is time to write a function Hadley Wickham  
iris.ml$species <- str_remove_all(iris.ml$species,  'Iris-')

# confirm always: this shows you the last observations
tail(iris_ml)

# concise summary of dataset
str(iris_ml)

# looking for missing values
x = sum(is.na(iris.ml))
paste(c('I\'ve','looked','through','your', 'dataset.','I', 'found', 'entries', 'in' ,'your','dataset', 'it','has','missing values = ', x), collapse = " ")

# countplot with ggplot2
# setosa are fewer only by one
ggplot(iris.ml, aes(x = species)) + geom_bar(fill = 'red', color = 'black') +  theme_classic()  
+ ggtitle('Counts of each species in the iris dataset.')


# Guess the name of this plot?
# gotta remove the species column
iris.ml.cor <- cor(iris.ml[-5])
corrplot(iris.ml.cor, method = "ellipse")

# concise summary of the dataset 
summary(iris.ml)

# changing the type of the variable species
iris.ml$species <- as.factor(iris.ml$species)

# caret time
set.seed(42)

# Create reusable trainControl object
# use 10 fold cross-validation and show me what how the training is proceeding
ctrl <- trainControl(
  method = "cv",
  number = 10,
  classProbs = TRUE,
  verboseIter = TRUE
)

# train a knn model, scale the data, return the accuracy
(mod <- train(species ~ ., data = iris.ml,
             preProcess = 'scale',
             method = "knn",
             metric = 'Accuracy',
             tuneLength = 10,
             trControl = ctrl))

# view the results of training
mod
plot(mod)

# predicting time
# this is data.table syntax
# taking the 19th observation and all 4 columns
predict(mod, iris.ml[19,1:4])

# see the observation in the original observation to confirm
iris.ml[19, 1:5]

# take the 140th observation and 4 columns that will be used to test the model
predict(mod, iris.ml[140, 1:4])

# confirm if the model has done the right thing
iris.ml[140, 1:5]

# Information about my R session
sessionInfo()