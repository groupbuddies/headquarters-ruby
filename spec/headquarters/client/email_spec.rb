require 'spec_helper'
require 'shared_examples/an_http_requester'

module Headquarters
  class Client
    describe Email do
      it_behaves_like 'an HTTP requester'

      subject(:client) { described_class.new }

      context '#deliver' do
        it 'posts an email to be sent' do
          allow(client).to receive(:post)
          params = { subject: 'fake subject' }

          client.deliver(params)

          expect(client).to have_received(:post).with(Endpoints::EMAIL, body: hash_including(params))
        end

        context 'with multiple destinations' do
          it 'comma-separates the list of emails' do
            allow(client).to receive(:post)
            params = { to: %w(1@email.com 2@email.com') }

            client.deliver(params)

            expect(client).to have_received(:post).with(Endpoints::EMAIL, body: hash_including(to: params[:to].join(',')))
          end
        end
      end
    end
  end
end
