require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Headquarters < ::OmniAuth::Strategies::OAuth2
      include ::OmniAuth::Strategy

      URL      = 'http://hq.groupbuddies.com'
      PATH     = '/admin/hq/authorize'

      option :name, :headquarters
      option :client_options, site: URL, authorize_path: PATH

      uid do
        raw_info['id']
      end

      info do
        {
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end

    class HeadquartersSecure < Headquarters::OAuth::Strategy
      URL = 'https://hq.groupbuddies.com'
      option :client_options, site: URL, authorize_path: PATH
    end
  end
end
