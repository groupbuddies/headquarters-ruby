module Headquarters
  module OAuth
    class Strategy < ::OmniAuth::Strategies::OAuth2
      include ::OmniAuth::Strategy

      URL      = 'http://auth.groupbuddies.com'
      PATH     = '/oauth/authorize'

      option :name, :headquarters
      option :client_options, { site: URL, authorize_path: PATH }

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

    class SecureStrategy < Headquarters::OAuth::Strategy
      URL = 'https://auth.groupbuddies.com'
      option :client_options, { site: URL, authorize_path: PATH }
    end
  end
end
