# Script Settings and Resources 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(GGally)



# Data Import and Cleaning 
week7_tbl <- read_csv("../data/week3.csv") |>
  mutate(timeStart = ymd_hms(timeStart), 
         timeEnd = ymd_hms(timeEnd),
         condition = fct_recode(condition,"Block A" = "A", "Block B" = "B","Control" = "C"),
         gender = fct_recode(gender, "Male" = "M", "Female" = "F")) |>
  filter(q6 == 1) |>
  select(-q6) |>
  mutate(timeSpent = difftime(timeEnd, timeStart, units = "mins")) # Note I did not capitalize condition and gender, which may be a mistake as this is different from table 1, but I wasn't sure.




# Visualization
ggpairs(subset(week7_tbl, select = paste0("q", c(1:5, 7:10))))
ggsave(filename = "../figs/fig0.png", width = 10, height = 10, dpi = 300)
