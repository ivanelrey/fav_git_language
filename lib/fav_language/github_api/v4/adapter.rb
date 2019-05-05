module GithubApi
  module V4
    GITHUB_ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN'].freeze
    URL = 'https://api.github.com/graphql'.freeze

    HttpAdapter = GraphQL::Client::HTTP.new(URL) do
      def headers(context)
        unless token = context[:access_token] || GITHUB_ACCESS_TOKEN
          fail "Missing GitHub access token"
        end
        {
          'Authorization' => "Bearer #{GITHUB_ACCESS_TOKEN}",
          'User-Agent' => 'Ruby'
        }
      end
    end

    Schema = GraphQL::Client.load_schema(HttpAdapter)
    Client = GraphQL::Client.new(schema: Schema, execute: HttpAdapter)
  end
end
