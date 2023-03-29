# featurize_data.R
library(optparse)
suppressMessages(library(tidyverse))

# Input: takes in input and output commands via the terminal.
#   Defining what the name of the initial raw data file of interest
#   and what the created csv file will be named that will have features factorized.
# Output: A .csv file of the featurized data named after the output command

option_list = list(
  make_option(c("-i","--input"),
              type="character",
              default="data_raw.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-o","--output"),
              type="character",
              default="data_featured.csv",
              help="output file name",
              metavar="character"
  )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) # parsing the terminal arguments into a variable 

data <- as_tibble(read_csv(paste0("data/",args[1]), col_types=cols())) # take in first argument, runs base function to read in filename from data/ folder
data <- data %>% rename("Diabetes" = "Outcome") # changing name to Diabetes
data$Diabetes <- factor(data$Diabetes, levels=c(1,0), labels=c("Yes","No")) # making the outcome variable a factor as well as changing binary 0/1 to No/Yes for readibility
write.csv(data, paste0("data/",args[2]),row.names=FALSE) # takes in second argument, runs base function write/save with filename into data/ folder
