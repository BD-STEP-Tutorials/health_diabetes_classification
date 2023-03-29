# clean_split_data.R
library(optparse)
suppressMessages(library(tidyverse))
suppressMessages(library(caret))

# Input: takes in input and output commands via the terminal. 
#   Defining what the names of the raw train and raw test data files
#   of interest are and what the created files will be named that will 
#   have appropriate train and test rows after further cleaning/imputation.
# Output: csv files of the cleaned/imputed train and test datasets.

option_list = list(
  make_option(c("-i","--input1"),
              type="character",
              default="train_raw.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-I","--input2"),
              type="character",
              default="test_raw.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-o","--output1"),
              type="character",
              default="train.csv",
              help="output training file name",
              metavar="character"
  ),
  make_option(c("-O","--output2"),
              type="character",
              default="test.csv",
              help="output test file name",
              metavar="character"
  )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) # parsing the terminal arguments into a variable 

train_raw <- read.csv(paste0("data/",args[1])) # take in first argument, runs base function to read in filename from data/ folder
test_raw <- read.csv(paste0("data/",args[2])) # take in second argument, runs base function to read in filename from data/ folder

train <- ???
test <- ???

write.csv(train, paste0("data/",args[3]),row.names=FALSE) # takes in third argument, runs base function write/save with filename into data/ folder
write.csv(test, paste0("data/",args[4]),row.names=FALSE) # takes in forth argument, runs base function write/save with filename into data/ folder
