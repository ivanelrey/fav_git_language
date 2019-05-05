require 'fav_language/version'
require 'graphql/client'
require 'graphql/client/http'
require 'fav_language/github_api/v4/adapter'
require 'fav_language/github_api/v4/query_execution_error'
require 'fav_language/github_api/v4/user'

module FavLanguage
  class Error < StandardError; end
end
