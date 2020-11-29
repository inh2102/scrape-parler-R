# scrape_parler
Scrape the conservative alternative social media network "Parler."

This repository provides R functions that save the "Parleys" section of Parler's "Discover" page.

To clone this repository, use:

`git clone http://github.com/inh2102/scrape_parler`.

## Getting Started

[Sign up](https://parler.com/auth/access) for a Parler account. Be sure to use an email address and phone number you can verify. 

## Using Selenium

This script relies on the usage of Selenium remote webdrivers. `scrape_parler.R` uses the `RSelenium` package, and it's easiest to use [Docker](https://www.docker.com/get-started) to handle remote drives on your machine. Be sure to follow all of the installation instructions, and after you have opened the application, type the following into Terminal/Command Line:

`docker pull selenium/standalone-firefox`.

When you're ready to start a remote webdriver instance, use:

`docker run -d -p 4445:4444 selenium/standalone-firefox:2.53.1`.

If you'd like to kill all running instances of Docker, use:

`docker stop $(docker ps -q)`.

## Scraping Parler

Once you have cloned this repository, open the `scrape_parler.R` file (which handles references to the `functions.R` file, which is the meat of this repo). 

The `packages()` call will ensure you have installed the three R packages this script uses (RSelenium, rvest, tidyverse). 

The `df <- scrape_parler(scrolls=10)` call begins the scraping, which will take a few minutes. The `scrolls` argument controls the number of times Selenium scrolls down the page and grabs new posts; the default value of 10 returns 50 posts on my machine (the maximum Parler seems to allow for my feed).

The R console provides periodic status updates on the scraping process -- including required inputs for username (email) and password. After a few moments, a CAPTCHA image will display in your R viewer (scroll to center on the letters), and you must enter the case-sensitive CAPTCHA to proceed. Finally, Parler will text your mobile phone a 6-digit code that you must enter.

Once the scraping has completed, R will return `df`, which is a list of top posts and Parler's top trending hashtags.




