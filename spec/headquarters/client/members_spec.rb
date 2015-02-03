require 'spec_helper'
require 'shared_examples/an_http_requester'

module Headquarters
  class Client
    describe Members do
      it_behaves_like 'an HTTP requester'

      subject(:client) { described_class.new }

      context '#all' do
        it 'asks for all the members' do
          allow(client).to receive(:get)

          client.all

          expect(client).to have_received(:get).with(Endpoints::MEMBERS)
        end
      end

      context '#search' do
        it 'asks for the members using an extra query param' do
          allow(client).to receive(:get)

          client.search('a_query')

          expect(client).to have_received(:get).with(Endpoints::MEMBERS, query: { q: 'a_query' })
        end
      end
    end
  end
end
