#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
# Load required libraries
library(rvest)
library(readr)
library(tidyverse)
library(dplyr)
library(readr)
library(stringr)

# Read the CSV file
clean_opinion_poll <- read_csv("/cloud/project/data/raw_data/raw_opinion_poll.csv")

# remove columns that are not required
clean_opinion_poll <- clean_opinion_poll %>% select(-X4, -X8)

#adding a new column with more specific dates for the polls
# Create a new vector with data for each row

new_column_data <-c("Exact date published", "2024-04-16", "2024-04-16", "2024-04-04", "2024-03-06", "2024-03-16", "2024-03-06", "2024-03-09", "2024-02-28", "2024-02-08", "2024-02-08", "2023-12-25", "2023-12-13", "2023-10-07", "2023-10-03", "2023-08-16", "2023-08-24", "2023-02-18") 

# Ensure the length of the new data vector matches the number of rows in the dataframe
if(length(new_column_data) == nrow(data)) {
  # Add the new vector as a new column to the dataframe with a specified name
  clean_opinion_poll <- clean_opinion_poll %>% mutate(date = new_column_data)
} else {
  stop("The length of new_column_data does not match the number of rows in the dataframe.")
}

#changing column names
colnames(clean_opinion_poll) <- c("Polling agency", "Date published", "Sample size", "NDA", "INDIA", "Others", "Exact date published")
clean_opinion_poll <- clean_opinion_poll[-1, ]

#changing data types
clean_opinion_poll$`Exact date published` <- as.Date(clean_opinion_poll$`Exact date published`)
clean_opinion_poll$`NDA` <- as.numeric(clean_opinion_poll$`NDA`)
print(clean_opinion_poll)

# Save the cleaned data to a new CSV file
write_csv(clean_opinion_poll, "/cloud/project/data/analysis_data/cleaned_opinion_poll.csv")


# Read the CSV file
clean_exit_poll <- read_csv("/cloud/project/data/raw_data/raw_exit_poll.csv")

# Function to clean and convert to numeric
clean_and_convert <- function(x) {
  # Replace ± with an empty string and convert to numeric
  as.numeric(gsub("±.*", "", gsub("-", "", x)))
}

# Apply the function to relevant columns
clean_exit_poll$NDA <- clean_and_convert(clean_exit_poll$NDA)
clean_exit_poll$INDIA <- clean_and_convert(clean_exit_poll$INDIA)
clean_exit_poll$Others <- clean_and_convert(clean_exit_poll$Others)
clean_exit_poll$Lead <- clean_and_convert(clean_exit_poll$Lead)


print(clean_exit_poll)
# Save the cleaned data to a new CSV file
write_csv(clean_exit_poll, "/cloud/project/data/analysis_data/cleaned_exit_poll.csv")
