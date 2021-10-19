library(tidytuesdayR)
library(tidyverse)

tt_available()
last_tuesday()
tt_load(last_tuesday())

tuesdata <- tt_load(last_tuesday())

pumpkins <- tuesdata$pumpkins

glimpse(pumpkins)

first_place <- pumpkins %>%
  group_by(state_prov) %>%
  filter(place == 1)

first_place <- first_place %>%
  mutate(weight_lbs = as.numeric(gsub(",", "", weight_lbs)))

first_place %>%
  ggplot(aes(x = country, y = weight_lbs)) +
  geom_jitter()
