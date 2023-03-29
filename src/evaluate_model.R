# evaluate_model.R
suppressMessages(library(caret))
library(optparse)

# Input: takes in input commands via the terminal. Defining what the name of the .rds data file for the fitted model.
# Output: Print out in the console the appropriate confusion matrix and other performance metrics.

option_list = list(
  make_option(c("-i","--input1"),
              type="character",
              default="test.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-I","--input2"),
              type="character",
              default="model.rds",
              help="model/fit file name",
              metavar="character"
  )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) 
test <- read.csv(paste0("data/",args[1])) # takes in first argument, runs base function to read in filename from data/ folder
fit <- readRDS(paste0("data/",args[2])) # takes in second argument, runs base function to read in filename from data/ folder

predict <- predict(fit, test[,-nrow(test)]) # caret predict function to use the trained fit model to predict the test
cm <- confusionMatrix(predict, as.factor(test$Diabetes)) # caret confusion matrix function to produce metrics via actual vs. predicted
capture.output(cm, file="report/results.txt") # writes report to the report/ folder
