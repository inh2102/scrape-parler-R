# scrape_parler
Scrape the conservative alternative social media network "Parler."

This repository provides R functions that save the "Parleys" section of Parler's "Discover" page.

## Getting Started

[Sign up](https://parler.com/auth/access) for an account. Be sure to use an email address and phone number you can verify. 

## Selenium

This script relies on the usage of Selenium remote webdrivers. `scrape_parler` uses the `RSelenium` package, and it's easiest to use [Docker](https://www.docker.com/get-started) to handle remote drives on your machine. Be sure to follow all of the installation instructions, and after you have opened the application, type the following into Terminal/Command Line:
`docker pull selenium/standalone-firefox`
