library(tidyverse)
library(rvest)

# Look up the cost of living for your hometown on
# Sperling's Best Places (http://www.bestplaces.net/). Then extract it
# with `html_elements()` and `html_text()`.

## demo using my hometown of Sterling, Virginia
## download the HTML page
sterling <- read_html(x = "http://www.bestplaces.net/cost_of_living/city/virginia/sterling")

## extract the cost of living value
col <- html_elements(x = sterling, css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)")
html_text(x = col)

## or use a piped operation
sterling %>%
  html_elements(css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)") %>%
  html_text()

# Visit the climate tab for your home town. Extract the climate statistics
# of your hometown as a data frame with useful column names.

## again, a demo with Sterling
## download HTML page
sterling_climate <- read_html(x = "http://www.bestplaces.net/climate/city/virginia/sterling")

## extract the climate table
climate <- html_elements(x = sterling_climate, css = "table")
html_table(x = climate, header = TRUE, fill = TRUE)[[1]]

## or as a piped operation
sterling_climate %>%
  html_elements(css = "table") %>%
  nth(1) %>%
  html_table(header = TRUE)
