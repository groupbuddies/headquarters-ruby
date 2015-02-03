module Headquarters
  class API
    class OAuthAuthenticator
      def initialize(client_id: nil, client_secret: nil)
        @client_id = client_id
        @client_secret = client_secret
        authenticate!
      end

      attr_reader :access_token, :client_id, :client_secret

      def headers
        if access_token
          { 'Authorization' => "Bearer #{access_token}" }
        else
          {}
        end
      end

      def authenticate!
        return if client_id.nil? || client_secret.nil?

        response = Request.perform(:post, Endpoints::OAUTH_TOKEN, body: authentication_body)

        @access_token = Hash(response).fetch('access_token', nil)
      end

      def authentication_body
        {
          grant_type: 'client_credentials',
          client_id: client_id,
          client_secret: client_secret
        }
      end
    end
  end
end
