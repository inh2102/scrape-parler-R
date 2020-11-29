source("functions.R")
packages()
df <- scrape_parler(scrolls=10)
posts <- df$posts
trending_hashtags <- df$trending_hashtags