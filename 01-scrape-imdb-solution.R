library(tidyverse)
library(rvest)

# Read in the Frozen html page (https://www.imdb.com/title/tt2294629/)
# Store it in an object called `frozen`
frozen <- read_html(x = "http://www.imdb.com/title/tt2294629/")

# Select the nodes that are both `a`s and `id = "titleCast"`
cast <- html_nodes(x = frozen, css = "#titleCast a")

# Extract the text from the nodes
html_text(x = cast)

# Use SelectorGadget to find a CSS selector combination that
# identifies just the cast member names
cast2 <- html_nodes(x = frozen, css = "#titleCast td:nth-child(2) a")
html_text(x = cast2)

## cleaned up text
cast2 %>%
  html_text() %>%
  # remove empty white space
  str_trim() %>%
  # remove new line indicator \n
  str_remove_all(pattern = "\n")
