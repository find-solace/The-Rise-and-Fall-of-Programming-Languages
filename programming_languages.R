#reading libraries and dataset
library(readr)
library(dplyr)

by_tag_year <- read_csv("by_tag_year.csv")
glimpse(by_tag_year)

#represent tags as fraction of the total questions in the year
by_tag_year_fraction <- by_tag_year %>% mutate(fraction = number/year_total)
