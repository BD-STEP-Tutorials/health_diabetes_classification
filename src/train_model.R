# train_model.R
suppressMessages(library(caret))
library(optparse)
set.seed(123)

# Input: takes in input and output commands via the terminal. 
#   Defining what the names of the final train data file of
#   interest is and what the created, fitted model will be named.
# Output: .rds file fit on the training dataset

option_list = list(
  make_option(c("-i","--input"),
              type="character",
              default="train.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-o","--output"),
              type="character",
              default="model.rds",
              help="output model file name",
              metavar="character"
  )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) # parsing the terminal arguments into a variable 
train <- read.csv(paste0("data/",args[1])) # takes in first argument, runs base function to read in filename from data/ folder

# trainControl: generates parameters that further control how models are created, with possible values:
#   -method: resampling method
#     -cv: divides your training dataset randomly into k-folds (k equaling the *number* parameter)
#       and then using each of k parts as testing dataset for the model trained on other k-1. 
#       Takes the average of the k error terms thus obtained.
#     -boot: consists of repeatedly selecting a sample of n observations from the original data set, and to evaluate the model on each copy. An average standard error is then calculated and the results provide an indication of the overall variance of the model performance.
#     -repeatCV: will run cv methodology a total of m-separate times (m equaling the *repeats* parameter)
#   -number: Number of folds or the number of resampling iterations
#   -repeats: For repeated k-fold cross-validation only: the number of complete sets of folds to compute
#   -classProbs: a logical; should class probabilities be computed for classification models 
#     (along with predicted values) in each resample?
#   -summaryFunction: a function to compute performance metrics across resamples


fitControl <- trainControl(method = ???,
                           number = ???, 
                           classProbs = ???,
                           summaryFunction = ???
                           )

# train: sets up a grid of tuning parameters for a number of classification and regression routines, 
#   fits each model, and calculates a resampling based performance measure.
#   - data: Data frame from which variables specified in the formula are preferentially to be taken.
#   - method: a string specifying which classification or regression model to use.
#   - trControl: a list of values that define how this function acts. Where we pass the trainControl object, arguments.
#   - metric: a string that specifies what summary metric will be used to select the optimal model. 
#       By default, possible values are "RMSE" and "Rsquared" for regression and "Accuracy" and "Kappa" for classification.
fit <- train(Diabetes~., 
              data=train, 
              method=???, 
              trControl = fitControl, 
              metric=???)

saveRDS(fit, file=paste0("data/",args[2])) # takes in second argument, runs base function to write in filename from data/ folder
