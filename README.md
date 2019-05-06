# FavLanguage

**fav_language** guesses and returns github user's favorite progamming language.
Uses Github's graphql API to get the primary languages from the user's repositories and returns the most frequently used language. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fav_language', :git => 'https://github.com/ivanelrey/fav_git_language.git'
```

And then execute:

    $ bundle


## Usage

```ruby
GithubApi::V4::User.new('github_username').favorite_language
```

## Requirements

1) Enviroment variable **GITHUB_ACCESS_TOKEN** is required for the gem to work 

## Demo
https://fav-git-language.herokuapp.com/
