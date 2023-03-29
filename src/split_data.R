# split_data.R
library(optparse)
suppressMessages(library(tidyverse))
set.seed(123) # sets a random seed for reproducibility when we call RNG related functions

# Input: takes in input and output commands via the terminal. 
#   Defining what the name of the cleaned full data file of 
#   interest and what the created csv files will be named that 
#   will have appropriate train and test rows.
# Output: csv files of the train and test datasets

option_list = list(
  make_option(c("-i","--input"),
              type="character",
              default="data_clean.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-o","--output1"),
              type="character",
              default="train_raw.csv",
              help="output file names",
              metavar="character"
  ),
  make_option(c("-O","--output2"),
              type="character",
              default="test_raw.csv",
              help="output file names",
              metavar="character"
  )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) # parsing the terminal arguments into a variable 
data <- read.csv(paste0("data/",args[1])) # takes in first argument, runs base function to read in filename from data/ folder

nrows <- nrow(data)
index <- sample(1:nrows, 0.7 * nrows)

train <- data[index,]
test <- data[-index,]

write.csv(train, paste0("data/",args[2]),row.names=FALSE) # takes in second argument, runs base function to wrtie in filename from data/ folder
write.csv(test, paste0("data/",args[3]),row.names=FALSE) # takes in third argument, runs base function to wrtie in filename from data/ folder
