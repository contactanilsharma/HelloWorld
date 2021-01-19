install.packages("httr")

# load httr package
library(httr)

# do a post function
r = httr::POST(
  url = "https://api.deepai.org/api/text-generator",
  body = list("text" = "How to teach visual thinking?"),
  add_headers(.headers = c("api-key" = "quickstart-QUdJIGlzIGNvbWluZy4uLi4K"))
)

# convert raw result to text

cat(content(r, "text"), "\n")