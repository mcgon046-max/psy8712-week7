# Script Settings and Resources 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)




# Data Import and Cleaning 
week7_tbl <- read_csv("../data/week3.csv") |>
  mutate(timeStart = ymd_hms(timeStart), 
         timeEnd = ymd_hms(timeEnd),
         condition = fct_recode(
           
         ))
