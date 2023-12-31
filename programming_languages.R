#reading libraries and dataset
library(readr)
library(dplyr)
library(ggplot2)

by_tag_year <- read_csv("by_tag_year.csv")
glimpse(by_tag_year)

#represent tags as fraction of the total questions in the year
by_tag_year_fraction <- by_tag_year %>% mutate(fraction = number/year_total)

#Examining trends in popularity of R language
r_over_time <- by_tag_year_fraction %>% filter(tag == "r")
ggplot(r_over_time, aes(x = year, y = fraction)) + geom_line()

#Examining trends in r, dplyr, and ggplot2
selected_packages <- c("r", "dplyr", "ggplot2")
r_and_packages <- by_tag_year_fraction %>% filter(tag %in% selected_packages)

ggplot(r_and_packages, aes(x = year, y = fraction, color = tag)) + geom_line()

#tags with most questions overall
sorted_tags <- by_tag_year %>% group_by(tag) %>%
  summarize(total_tags = sum(number)) %>% arrange(desc(total_tags))

#trends in the top tags
highest_tags <- head(sorted_tags$tag)
highest_subset <- by_tag_year_fraction %>% filter(tag %in% highest_tags) %>%

ggplot(highest_subset, aes(x = year, y = fraction, color = tag)) + geom_line()


#trends in the bottom tags
lowest_tags <- tail(sorted_tags$tag)
lowest_subset <- by_tag_year_fraction %>% filter(tag %in% lowest_tags)

ggplot(lowest_subset, aes(x = year, y = fraction, color = tag)) + geom_line()


#trends in popularity of ios, android, and windows-phone operating systems
os_tags <- c("ios", "windows-phone", "android")
os_subset <- by_tag_year_fraction %>% filter(tag %in% os_tags)

ggplot(os_subset, aes(x = year, y = fraction, color = tag)) + geom_line()







