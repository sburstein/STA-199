# load packages ----------------------------------------------------------------
library(tidyverse)
library(rvest)

# read in http://www.imdb.com/chart/tvmeter ------------------------------------
page <- read_html("http://www.imdb.com/chart/tvmeter")

# years ------------------------------------------------------------------------
years <- page %>%
  html_nodes(".secondaryInfo:nth-child(2)") %>%
  html_text() %>%
  str_replace("\\(", "") %>%
  str_replace("\\)", "") %>%
  as.numeric()

# scores -----------------------------------------------------------------------
scores <- page %>%
  html_nodes(".imdbRating") %>%
  html_text() %>%
  as.numeric()

# names ------------------------------------------------------------------------
names <-  page %>%
  html_nodes(".titleColumn a") %>%
  html_text()

# tvshows dataframe ------------------------------------------------------------
tvshows <- tibble(
  rank = 1:100,
  year = years,
  score = scores,
  name = names
)

ggplot(tvshows,
       aes(x = year, y = score)) +
  geom_point() +
  geom_smooth()

