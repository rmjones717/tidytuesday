First TidyTuesday for MJ
================
Mark Jones
October 21, 2021

``` r
library(tidytuesdayR)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.4     ✓ dplyr   1.0.7
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   2.0.1     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
library(RColorBrewer)
```

``` r
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

with_year <- first_place %>%
  mutate(year = as.numeric(substr(id, 1, 4)))

with_year %>%
  ggplot(aes(x = year, y = weight_lbs, color = country)) +
  geom_point(size = 4) +
  scale_color_brewer(palette = "Spectral")
```
