require 'spec_helper'
require 'shared_examples/an_http_requester'

module Headquarters
  describe API do
    it_behaves_like 'an HTTP requester'

    context '#headers' do
      context 'no authentication' do
        it 'includes only the API version' do
          api = API.new

          expect(api.headers).to eq({ 'Accept' => 'v2' })
        end
      end

      context 'with authentication' do
        let(:credentials) { { client_id: 'id', client_secret: 'secret' } }

        it 'includes the API version' do
          allow(Request).to receive(:perform)

          api = API.new(credentials)

          expect(api.headers).to match hash_including('Accept' => 'v2')
        end

        it 'includes authentication headers' do
          expected_headers = { header: :value }
          fake_authenticator = double('OAuthAuthenticator', headers: expected_headers)
          allow(API::OAuthAuthenticator).to receive(:new).and_return(fake_authenticator)

          api = API.new(credentials)

          expect(api.headers).to match hash_including(expected_headers)
        end
      end
    end

    context '.namespace' do
      class API::FakeNamespace
        def initialize(**_)
        end
      end

      it 'creates a new method' do
        API.namespace(:fake_namespace)

        expect(API.new.methods).to include(:fake_namespace)
      end

      it 'sets the return value to an instance of the expected class' do
        API.namespace(:fake_namespace)

        expect(API.new.fake_namespace).to be_a(API::FakeNamespace)
      end
    end
  end
end
