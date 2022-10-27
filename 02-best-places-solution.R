library(tidyverse)
library(rvest)

# Look up the cost of living for Ithaca, NY on
# Sperling's Best Places (http://www.bestplaces.net/). Then extract it
# with `html_elements()` and `html_text()`.

## download the HTML page
ithaca <- read_html("https://www.bestplaces.net/cost_of_living/city/new_york/ithaca")

## extract the elements
col <- html_elements(ithaca, css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)")
html_text2(col)

## or use a piped operation
ithaca %>%
  html_elements(css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)") %>%
  html_text2()

# Visit the climate tab for Ithaca, NY. Extract the climate statistics
# of your hometown as a data frame with useful column names.

## download HTML page
ithaca_climate <- read_html("http://www.bestplaces.net/climate/city/new_york/ithaca")

## extract the climate table
climate <- html_elements(ithaca_climate, css = "table")
html_table(climate, header = TRUE, fill = TRUE)[[1]]

## or as a piped operation
ithaca_climate %>%
  html_elements(css = "table") %>%
  nth(1) %>%
  html_table(header = TRUE)
