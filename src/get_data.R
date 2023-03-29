# get_data.R
library(optparse)

# Input: takes in input and output commands via the terminal.
#   Defining what the name of the dataset file of interest is and
#   what the created csv file will be named
# Output: A .csv file of the raw data named after the output command

option_list = list(
  make_option(c("-i","--input"),
               type="character",
               default="diabetes.csv",
               help="dataset file name",
               metavar="character"
              ),
  make_option(c("-o","--output"),
               type="character",
               default="data_raw.csv",
               help="output file name",
               metavar="character"
              )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) # parsing the terminal arguments into a variable 

data_raw <- read.csv(paste0("data/",args[1])) # takes in first argument, runs base function to read in filename from data/ folder
write.csv(data_raw, paste0("data/",args[2]),row.names=FALSE) # takes in second argument, runs base function write/save with filename into data/ folder
