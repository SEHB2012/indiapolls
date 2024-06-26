#### Preamble ####
# Purpose: Downloads the required data using rvest from Wikipedia
# Author: Sehar Bajwa
# Date: 20 June 2024 
# Contact: sehar.bajwa@mail.utoronto.ca          
# License: MIT


# Load required libraries
library(rvest)
library(readr)
library(tidyverse)

# Read the HTML content from the Wikipedia page
the_raw_data <- read_html("https://en.wikipedia.org/wiki/Opinion_polling_for_the_2024_Indian_general_election")

 write_html(the_raw_data, "/cloud/project/data/raw_data/the_raw_data.html")
 # Read the HTML content from the Wikipedia page
 raw_data <- read_html("https://en.wikipedia.org/wiki/Opinion_polling_for_the_2024_Indian_general_election")
 
 # Extract all tables with the class "wikitable"
 tables <- raw_data %>% html_nodes(".wikitable")
 
 # Check the number of tables extracted
 length(tables)
 
 # Extract the opinion table (if it exists)
 if (length(tables) >= 2) {
   raw_opinion_poll <- tables[2] %>% html_table()
 } else {
   stop("The opinion table does not exist on the page.")
 }
 
 # Convert the extracted table to a data frame
 raw_opinion_poll_df <- as.data.frame(raw_opinion_poll)
 
 # Print the entire data frame
 print(raw_opinion_poll_df)
 
 # Save the extracted table data to a CSV file
 write_csv(
   x = raw_opinion_poll_df,
   file = "/cloud/project/data/raw_data/raw_opinion_poll.csv"
 )
 
 # Read the HTML content from the Wikipedia page
 raw_data <- read_html("https://en.wikipedia.org/wiki/Opinion_polling_for_the_2024_Indian_general_election")
 
 # Extract all tables with the class "wikitable"
 tables <- raw_data %>% html_nodes(".wikitable")
 
 # Check the number of tables extracted
 length(tables)
 
 # Extract the exit table (if it exists)
 if (length(tables) >= 76) {
   raw_exit_poll <- tables[76] %>% html_table()
 } else {
   stop("The exit table does not exist on the page.")
 }
 
 # Convert the extracted table to a data frame
 raw_exit_poll_df <- as.data.frame(raw_exit_poll)
 
 # Print the entire data frame
 print(raw_exit_poll_df)
 
 # Save the extracted table data to a CSV file
 write_csv(
   x = raw_exit_poll_df,
   file = "/cloud/project/data/raw_data/raw_exit_poll.csv"
 )

 
