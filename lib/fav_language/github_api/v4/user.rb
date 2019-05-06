module GithubApi
  module V4
    class User
      UserPrimaryLangs = GithubApi::V4::Client.parse <<-'GRAPHQL'
        query($username: String!, $repo_cursor: String) {
          user(login: $username) {
            repositories(first: 50, after: $repo_cursor) {
              edges {
                node {
                  primaryLanguage {
                    name
                  }
                }
              }
              pageInfo {
                endCursor
                hasNextPage
              }
            }
          }
        }
      GRAPHQL

      attr_reader :username

      def initialize(username)
        @username = username
      end

      def favorite_language
        languages_freq = primary_languages.each_with_object(Hash.new(0)) { |v, h| h[v] += 1; }

        unless languages_freq.empty?
          languages_freq.max_by { |_key, value| value }[0]
        else
          'User has 0 repositories.'
        end
      end

      def primary_languages
        langs = []
        repo_cursor = nil

        loop do
          response = GithubApi::V4::Client.query(UserPrimaryLangs, variables: { username: username, repo_cursor: repo_cursor })

          raise QueryExecutionError, response.data.errors.messages.to_a.join(' : ') if response.data.errors.any?

          langs << response.data.user.repositories.edges.map { |edge| edge.node.primary_language&.name }

          break unless response.data.user.repositories.page_info.has_next_page

          repo_cursor = response.data.user.repositories.page_info.end_cursor
        end

        langs.flatten.compact
      end
    end
  end
end
