require "omniauth"

module OmniAuth
  module Strategies
    class Amazon < OmniAuth::Strategies::OAuth2
      option :name, "amazon"

      option :client_options, {
        :site => "https://www.amazon.com",
        :authorize_url => "https://sellercentral-japan.amazon.com/apps/authorize/consent",
        :token_url => "https://api.amazon.com/auth/o2/token"
      }

      option :access_token_options, {
        :mode => :query
      }

      option :authorize_params, {
        :application_id => Rails.application.credentials.amazon_sp_api.app_id,
        :scope => "profile:user_id",
        :version => :beta
      }

      uid { raw_info["Profile"]["CustomerId"] }

      info do
        {
          "email" => raw_info["Profile"]["PrimaryEmail"],
          "name" => raw_info["Profile"]["Name"]
        }
      end

      def raw_info
        access_token.options[:parse] = :json

        url = "/ap/user/profile"
        params = { :params => { :access_token => access_token.token } }
        @raw_info ||= access_token.client.request(:get, url, params).parsed
      end

      def callback_url
        full_host + "/users/auth/amazon/callback"
      end
    end  
  end
end
