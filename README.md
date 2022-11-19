## Description
Github Indexer is a github profile searcher and indexer, where the user can register through the github name and url and we search and save the main profile data.

## Requirements
- Ruby: 2.6.5
- Rails: 7.0.4
- Postgres: >=9.5
## Setup

Navigate to the project folder using your terminal. Install gems with:
```
$ bundle install
```
Now, run the databases setup:
```
$ rails db:create
$ rails db:migrate
```
For these feature to work properly it is necessary to install:

linux
```
$ apt-get install chromium-chromedriver
```
mac
```
$ brew install chromedriver
```
If you are in a virtual machine, add to the Gemfile:
```
gem 'chromedriver-helper'
```
For the link shortener to work, it is necessary to create an account on the site(https://bitly.com/pages/landing/free-plan), create an access token and place it in the .env file with the title:
```
BIT_LY_ACCESS_TOKEN=<INSERT_YOUR_ACCESS_TOKEN_HERE>
```
## Usage

Start server with:
```
$ rails server
```
Open http://localhost:3000/ in your browser.

## Run tests
```
$ rspec
```
## Author

Github: https://github.com/anneizaura
linkedin: https://www.linkedin.com/in/anneizaura/
