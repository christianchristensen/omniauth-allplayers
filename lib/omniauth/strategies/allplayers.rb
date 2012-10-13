require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies

    # An omniauth 1.0 strategy for AllPlayers.com authentication
    # Based on http://develop.allplayers.com/oauth.html
    class AllPlayers < OmniAuth::Strategies::OAuth

      option :name, 'allplayers'

      option :client_options, {
        :access_token_path => "/oauth/access_token",
        :authorize_path => "/oauth/authorize",
        :request_token_path => "/oauth/request_token",
        :site => "https://www.allplayers.com"
      }

      uid {
        user_info['uuid']
      }

      info do
        {
          :name => user_info['username'],
          :nickname => user_info['nickname'],
          :picture => user_info['picture'],
          :urls => {
            "Profile" => user_info['uri'],
          }
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        # This is a public API and does not need signing or authentication
        request = "/api/v1/rest/users/current.json"
        resp_redir = access_token.get(request)
        user_url = resp_redir['location']
        @raw_info ||= MultiJson.load(access_token.get(user_url).body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      # Provide the "Person" portion of the raw_info

      def user_info
        @user_info ||= raw_info.nil? ? {} : raw_info
      end
    end
  end
end
