require 'spec_helper'
require 'shared_examples/an_http_requester'

module Headquarters
  class Client
    describe Github do
      it_behaves_like 'an HTTP requester'

      subject(:client) { described_class.new }


      context '#pull_requests' do
        it 'asks for all the pull requests' do
          allow(client).to receive(:get)

          client.pull_requests

          expect(client).to have_received(:get).with(Endpoints::Github::PULL_REQUESTS, query: { q: nil })
        end

        it 'asks for the open pull requests' do
          allow(client).to receive(:get)

          client.pull_requests(query: 'is:open')

          expect(client).to have_received(:get).with(Endpoints::Github::PULL_REQUESTS, query: { q: 'is:open' })
        end
      end
    end
  end
end
