###########################################################
############ SCRAPING NEWS ARTICLES ON PARLER #############
###########################################################

# Try this...
system('timeout')

# If 'timeout --help for more information.' is returned, PROCEED.

# (If not, you need to install coreutils on your system.)
system('brew install coreutils')
# https://docs.brew.sh/Installation

# Clone 'parlance' by castlelemongrab:
system('git clone http://github.com/castlelemongrab/parlance')

# Credentials...
do_credentials <- function(jst,mst) {
  system(
    paste0('cd parlance;','parlance init --mst ,',mst,
           ' --jst ',jst,' -o config/auth.json'))
}

# Follow inh2102/scrape_parler Github instructions to find mst and jst...
jst <- ''
mst <- ''
do_credentials(jst,mst)

# Define the news-grabbing function:
get_parler_news <- function(secs=10) {
  system(paste0("cd parlance; timeout ",secs," parlance news > news.json"))
  system('cd parlance; echo "\n]" >> news.json')
}

# Scrape news articles to ~/parlance/news.json
get_parler_news(secs=10)

# Retrieve json data
# install.packages('jsonlite')
# install.packages('lubridate') - easy date manipulation

# Tidy it up...
news <- jsonlite::read_json("~/parlance/news.json",simplifyVector=TRUE)
news_meta <- cbind(news$metadata['title'],news$metadata['description']) %>% tibble()
news <- tibble(news) %>% select(createdAt,domain,long)
news <- bind_cols(news,news_meta)
news <- news %>% mutate(createdAt = lubridate::parse_date_time(createdAt,orders='ymd HMS'))