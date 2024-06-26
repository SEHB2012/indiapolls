#### Preamble ####
# Purpose: Testing out Graphs for the paper
# Author: Sehar Bajwa
# Date: 20 June 2024 
# Contact: sehar.bajwa@mail.utoronto.ca          
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(ggplot2)

# Read the CSV file
cleaned_opinion_poll <- read.csv("/cloud/project/data/analysis_data/cleaned_opinion_poll.csv", stringsAsFactors = FALSE)

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Read the CSV file
cleaned_opinion_poll <- read.csv("/cloud/project/data/analysis_data/cleaned_opinion_poll.csv", stringsAsFactors = FALSE)

# Plot: Date vs. NDA Seats
ggplot(cleaned_opinion_poll, aes(x = `Exact`, y = NDA)) +
  geom_point() +
  geom_line() +
  geom_hline(yintercept = 293, color = "orange", linetype = "dashed") +  # Add a orange dashed line at y = 293
  
  labs(title = "Predicted NDA Seats Over Time",
       x = "Date Published",
       y = "Predicted NDA Seats") +
  theme_minimal()

# Plot: Date vs. INDIA Seats
ggplot(cleaned_opinion_poll, aes(x = `Exact`, y = INDIA)) +
  geom_point() +
  geom_line() +
  geom_hline(yintercept = 234, color = "blue", linetype = "dashed") +  # Add a blue dashed line at y = 234
  
  labs(title = "Predicted INDIA Seats Over Time",
       x = "Date Published",
       y = "Predicted INDIA Seats") +
  theme_minimal()

# Plot: Date vs. Others Seats
ggplot(cleaned_opinion_poll, aes(x = `Exact`, y = Others)) +
  geom_point() +
  geom_line() +
  geom_hline(yintercept = 16, color = "black", linetype = "dashed") +  # Add a black dashed line at y = 16
  
  labs(title = "Predicted Others Seats Over Time",
       x = "Date Published",
       y = "Predicted Others Seats") +
  theme_minimal()

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the CSV file
cleaned_exit_poll <- read.csv("/cloud/project/data/analysis_data/cleaned_exit_poll.csv", stringsAsFactors = FALSE)

# Plot: Polling Agency vs. NDA Seats
ggplot(cleaned_exit_poll, aes(x = agency, y = NDA)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "NDA Seats Reported by Polling Agencies",
       x = "Polling Agency",
       y = "NDA Seats") +
  geom_hline(yintercept = 293, color = "orange", linetype = "dashed") +  # Add a orange dashed line at y = 293
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme_minimal()



