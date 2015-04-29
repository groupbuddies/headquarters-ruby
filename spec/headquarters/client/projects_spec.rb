require 'spec_helper'
require 'shared_examples/an_http_requester'

module Headquarters
  class Client
    describe Projects do
      it_behaves_like 'an HTTP requester'

      subject(:client) { described_class.new }

      context '#all' do
        it 'asks for all the projects' do
          allow(client).to receive(:get)

          client.all

          expect(client).to have_received(:get).with(Endpoints::PROJECTS)
        end
      end
    end
  end
end
