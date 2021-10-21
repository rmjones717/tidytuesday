#' ---
#' title: "First TidyTuesday for MJ"
#' author: "Mark Jones"
#' date: "October 21, 2021"
#' output: github_document
#' ---

library(tidytuesdayR)
library(tidyverse)
library(lubridate)
library(RColorBrewer)

#+ load-packages, include=FALSE
tuesdata <- tt_load("2021-10-19")

#+ glimpse
pumpkins <- tuesdata$pumpkins

glimpse(pumpkins)

#' Filtering out first place pumpkins
#' 
#+ filter-first
first_place <- pumpkins %>%
  group_by(state_prov) %>%
  filter(place == 1)

first_place <- first_place %>%
  mutate(weight_lbs = as.numeric(gsub(",", "", weight_lbs)))

#' Take a look
#+ plot-first
first_place %>%
  ggplot(aes(x = country, y = weight_lbs)) +
  geom_jitter()

#' Add in year and make it look nice
#+ plot-year
with_year <- first_place %>%
  mutate(year = as.numeric(substr(id, 1, 4)))

with_year %>%
  ggplot(aes(x = year, y = weight_lbs, color = country)) +
  geom_point(size = 4) +
  scale_color_brewer(palette = "Spectral")
