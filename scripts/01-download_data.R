#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


# Load required libraries
library(rvest)
library(readr)
#install.packages("tidyverse")
library(tidyverse)
library(babynames)
library(gh)
library(here)
library(httr)
library(janitor)
library(jsonlite)
library(knitr)
library(lubridate)
library(pdftools)
library(purrr)
library(rvest)
library(spotifyr)
library(tesseract)
library(tidyverse)
library(usethis)
library(xml2)

# Read the HTML content from the Wikipedia page
the_raw_data <- read_html("https://en.wikipedia.org/wiki/Opinion_polling_for_the_2024_Indian_general_election")

 write_html(the_raw_data, "/cloud/project/data/raw_data/the_raw_data.html")
 # Read the HTML content from the Wikipedia page
 raw_data <- read_html("https://en.wikipedia.org/wiki/Opinion_polling_for_the_2024_Indian_general_election")
 
 # Extract all tables with the class "wikitable"
 tables <- raw_data %>% html_nodes(".wikitable")
 
 # Check the number of tables extracted
 length(tables)
 
 # Extract the second table (if it exists)
 if (length(tables) >= 2) {
   raw_opinion_poll <- tables[2] %>% html_table()
 } else {
   stop("The second table does not exist on the page.")
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
 
 # Extract the second table (if it exists)
 if (length(tables) >= 76) {
   raw_exit_poll <- tables[76] %>% html_table()
 } else {
   stop("The second table does not exist on the page.")
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
 
 
