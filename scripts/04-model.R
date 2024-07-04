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

# Load necessary libraries
library(ggplot2)

# Filter out the row with Sample Size 2500000
#poll_data_filtered <- cleaned_opinion_poll %>%
#  filter(Sample.size != 2500000)

# Fit a linear model
lm_model <- lm(NDA ~ Sample.size, data = cleaned_opinion_poll)

# Summary of the linear model (optional)
summary(lm_model)

# Extract coefficients
intercept <- coef(lm_model)[1]
slope <- coef(lm_model)[2]

# Scatter plot with trend line
ggplot(cleaned_opinion_poll, aes(x = Sample.size, y = NDA)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add trend line
  labs(x = "Sample Size", y = "NDA Seats") +
  ggtitle("Sample Size vs. NDA Seats with Trend Line") +
  theme_minimal()

print(coef(lm_model))

# Print summary of the linear model
summary(lm_model)

# NDA seat predictions
nda_seats <- c(368, 242, 316, 221, 381, 371, 386, 377, 362, 400, 360, 360, 359, 358, 346)

# Create a data frame with an index as the predictor
data <- data.frame(index = 1:length(nda_seats), nda_seats = nda_seats)

# Perform linear regression
model <- lm(nda_seats ~ index, data = data)

# Print the summary of the regression model
summary(model)

# Plot the data points and the regression line
ggplot(data, aes(x = index, y = nda_seats)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red", linetype = "dashed") +
  labs(title = "Linear Regression of NDA Seat Predictions",
       x = "Index",
       y = "NDA Seats") +
  theme_minimal()


# Read the CSV file
cleaned_exit_poll <- read.csv("/cloud/project/data/analysis_data/cleaned_exit_poll.csv", stringsAsFactors = FALSE)

# Load necessary libraries
library(ggplot2)

poll_exitdata_filtered <- cleaned_exit_poll %>%
  
# Fit a linear model
lm_model <- lm(NDA ~ Sample.size, data = cleaned_opinion_poll)

# Summary of the linear model (optional)
summary(lm_model)

# Extract coefficients
intercept <- coef(lm_model)[1]
slope <- coef(lm_model)[2]

# Scatter plot with trend line
ggplot(poll_exitdata_filtered, aes(x = Sample.size, y = NDA)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add trend line
  labs(x = "Sample Size", y = "NDA Seats") +
  ggtitle("Sample Size vs. NDA Seats exit with Trend Line") +
  theme_minimal()

print(coef(lm_model))

# Print summary of the linear model
summary(lm_model)






# Read the CSV file
cleaned_opinion_poll <- read.csv("/cloud/project/data/analysis_data/cleaned_opinion_poll.csv", stringsAsFactors = FALSE)

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Fit a linear model
lm_model <- lm(NDA ~ Sample.size, data = poll_data_filtered)

# Summary of the linear model (optional)
summary(lm_model)

# Extract coefficients
intercept <- coef(lm_model)[1]
slope <- coef(lm_model)[2]

# Predict the sample size for y = 293 (NDA seats)
target_y <- 293
predicted_sample_size <- (target_y - intercept) / slope

# Scatter plot with trend line and additional features
ggplot(poll_data_filtered, aes(x = Sample.size, y = NDA)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add trend line
  geom_hline(yintercept = 293, linetype = "dashed", color = "red") +  # Add horizontal line at y = 293
  geom_text(aes(label = NDA), vjust = -1, hjust = 1) +  # Add data labels to points
  labs(x = "Sample Size", y = "NDA Seats") +
  ggtitle("Sample Size vs. NDA Seats with Trend Line") +
  theme_minimal()

print(paste("Predicted sample size for NDA seats = 293:", round(predicted_sample_size, 2)))

