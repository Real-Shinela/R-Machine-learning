dataset = read.csv("50_Startups.csv")

# Splitting the dataset into Training and Testing set
# install.packages('caTools')

library(caTools)

set.seed(123)
split = sample.split(dataset$Profit,
                     SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


dataset$State = factor(dataset$State,
                       levels = c('California', 'Florida', 'New York'),
                       labels = c(1,2,3))

# regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
# The dot means all independent variables
regressor = lm(formula = Profit ~ .,
               data = training_set)