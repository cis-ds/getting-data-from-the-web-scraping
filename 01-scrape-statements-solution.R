library(tidyverse)
library(lubridate)
library(rvest)

# Read in the presidential statement html page
# Store it in an object called `dwight`
dwight <- read_html(x = "https://www.presidency.ucsb.edu/documents/special-message-the-congress-relative-space-science-and-exploration")
dwight

# Select nodes that are "a" elements
html_elements(x = dwight, css = "a")

# Use SelectorGadget to find a CSS selector that selects
# the document's speaker
html_elements(x = dwight, css = ".diet-title a")

# Extract the document's date, speaker, title, and full text
date <- html_elements(x = dwight, css = ".date-display-single") %>%
  html_text2() %>% # Grab element text
  mdy() # Format using lubridate
date

speaker <- html_elements(x = dwight, css = ".diet-title a") %>%
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
  # get HTML page
  url_contents <- read_html(x = url)
  
  # extract elements we want
  date <- html_elements(x = url_contents, css = ".date-display-single") %>%
    html_text2() %>% # Grab element text
    mdy() # Format using lubridate
  
  speaker <- html_elements(x = url_contents, css = ".diet-title a") %>%
    html_text2()
  
  title <- html_elements(x = url_contents, css = "h1") %>%
    html_text2()
  
  text <- html_elements(x = url_contents, css = "div.field-docs-content") %>%
    html_text2()
  
  # store in a data frame
  url_data <- tibble(
    date = date,
    speaker = speaker,
    title = title,
    text = text
  )
  
  # return the data frame
  return(url_data)
}

# test on a new statement
scrape_doc("https://www.presidency.ucsb.edu/documents/letter-t-keith-glennan-administrator-national-aeronautics-and-space-administration")
