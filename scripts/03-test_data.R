#### Preamble ####
# Purpose:Test the data types across both the cleaned exit poll data and the cleaned opinion poll data
# Author: Sehar Bajwa
# Date: 20 June 2024 
# Contact: sehar.bajwa@mail.utoronto.ca          
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(readr)

cleaned_opinion_poll <- read_csv("/cloud/project/data/analysis_data/cleaned_opinion_poll.csv")


cleaned_opinion_poll$`Sample size` |> class() == "numeric"
cleaned_opinion_poll$`NDA` |> class() == "numeric"
cleaned_opinion_poll$`INDIA` |> class() == "numeric"
cleaned_opinion_poll$`Others` |> class() == "numeric"

cleaned_exit_poll <- read_csv("/cloud/project/data/analysis_data/cleaned_exit_poll.csv")

cleaned_exit_poll$`NDA` |> class() == "numeric"
cleaned_exit_poll$`INDIA` |> class() == "numeric"
cleaned_exit_poll$`Others` |> class() == "numeric"

