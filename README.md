# FavLanguage

fav_language guesses and returns github user's favorite progamming language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fav_language', :git => 'https://github.com/ivanelrey/fav_git_language.git'
```

And then execute:

    $ bundle


## Usage

1) GithubApi::V4::User.new('github_username').favorite_language

## Requirements

1) Enviroment variable **GITHUB_ACCESS_TOKEN** is required for the gem to work 
