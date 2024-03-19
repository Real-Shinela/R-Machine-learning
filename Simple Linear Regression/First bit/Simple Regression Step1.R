# Linear Regression time!

dataset = read.csv("Salary_Data.csv")

# Splitting the dataset into Training and Testing set
# install.packages('caTools')

library(caTools)

set.seed(123)
split = sample.split(dataset$Salary,
                     SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Name, LinearModel(Formula = Salary "is proportional to" YearsExperience)
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting test set results
y_pred = predict(regressor, newdata = test_set)

# Time to visualise
# install.packages('ggplot2') -- THIS IS THE REQUIRED PACKAGE FOR VISUALISATION
library(ggplot2)

# geom_point makes a scatterplot
# aes is Aesthetic, requires an X and Y value
# We are basically comparing the real salaries and the predicted salaries by point vs line
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'purple') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
             colour = 'red') +
  ggtitle('Salaries vs Experience (Training set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# The same, but test set this time
# The regressor is already taught based on the training set, so we don't have to swap that
#   because the 
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'purple') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'red') +
  ggtitle('Salaries vs Experience (Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')



