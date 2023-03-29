# clean_data.R
library(optparse)
suppressMessages(library(tidyverse))

# Input: takes in input and output commands via the terminal.
#   Defining what the name of the featurized data file of interest 
#   and what the created csv file will be named that will have appropriate 
#   0 values converted to NA.
# Output: A csv file of the cleaned full data

option_list = list(
  make_option(c("-i","--input"),
              type="character",
              default="data_featured.csv",
              help="dataset file name",
              metavar="character"
  ),
  make_option(c("-o","--output"),
              type="character",
              default="data_clean.csv",
              help="output file name",
              metavar="character"
  )
);

opt_parser = OptionParser(option_list=option_list)
args = parse_args(opt_parser) # parsing the terminal arguments into a variable 
data <- read.csv(paste0("data/",args[1])) # take in first argument, runs base function to read in filename from data/ folder

non_zero_vars <- c('Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI','DiabetesPedigreeFunction', 'Age')
data <- data %>% mutate_at(non_zero_vars, ~na_if(.,0)) # modifies all instances in the specified variables as NA if equal to zero
write.csv(data, paste0("data/",args[2]),row.names=FALSE) # takes in second argument, runs base function write/save with filename into data/ folder
