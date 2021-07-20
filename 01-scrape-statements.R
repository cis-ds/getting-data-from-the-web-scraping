library(tidyverse)
library(lubridate)
library(rvest)

# Read in the presidential statement html page
# (https://www.imdb.com/title/tt2294629/)
# Store it in an object called `dwight`
dwight <- read_html(x = "https://www.presidency.ucsb.edu/documents/special-message-the-congress-relative-space-science-and-exploration")
dwight

# Select nodes that are "a" elements
html_elements(x = dwight, css = "a")

# Use SelectorGadget to find a CSS selector that selects
# the document's speaker
html_elements(x = dwight, css = _______)

# Extract the document's date, speaker, title, and full text
date <- html_elements(x = dwight, css = ".date-display-single") %>%
  html_text2() %>% # Grab element text
  mdy() # Format using lubridate
date

speaker <- html_elements(x = dwight, css = _______) %>%
  html_text2()
speaker

title <- html_elements(x = dwight, css = "h1") %>%
  html_text2()
title

text <- html_elements(x = dwight, css = "div.field-docs-content") %>%
  html_text2()

# This is a long document, so let's just display the first 1,000 characters
text %>% str_sub(1, 1000) 

# Make a function called `scrape_docs()` that that accepts
# a URL of an individual document, scrapes the page,
# and returns a data frame containing the document's
# date, speaker, title, and full text.
scrape_doc <- function(url){
  
  # YOUR CODE HERE
  
}

# test on a new statement
scrape_doc("https://www.presidency.ucsb.edu/documents/letter-t-keith-glennan-administrator-national-aeronautics-and-space-administration")
