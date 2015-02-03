require 'spec_helper'

module Headquarters
  class API
    describe OAuthAuthenticator do
      context '#authenticate!' do
        context 'client_id or client_secret are missing' do
          it 'does nothing' do
            allow(Request).to receive(:perform)

            OAuthAuthenticator.new
            OAuthAuthenticator.new client_id: 'id'
            OAuthAuthenticator.new client_secret: 'secret'

            expect(Request).not_to have_received(:perform)
          end
        end

        context 'client_id and client_secret exist' do
          it 'makes a new POST request with the correct parameters' do
            allow(Request).to receive(:perform).and_return({})

            credentials = { client_id: 'id', client_secret: 'secret' }
            OAuthAuthenticator.new(**credentials)

            expect(Request).to have_received(:perform).with(:post, Endpoints::OAUTH_TOKEN, hash_including(body: hash_including(credentials)))
          end
        end
      end
    end
  end
end
