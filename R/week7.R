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
fig0 <- ggpairs(subset(week7_tbl, select = paste0("q", c(1:5, 7:10))))
ggsave(filename = "../figs/fig0.png", plot = fig0, width = 10, height = 10, dpi = 300)

fig1 <- week7_tbl |> 
        ggplot(aes(x = timeStart, y = q1)) +
        geom_point() +
        labs(x = "Date of Experiment", y = "Q1 Score")
ggsave(filename = "../figs/fig1.png", plot = fig1, width = 10, height = 10, dpi = 300)
