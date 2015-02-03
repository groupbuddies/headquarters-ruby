require 'spec_helper'
require 'shared_examples/an_http_requester'

module Headquarters
  describe Client do
    it_behaves_like 'an HTTP requester'

    subject(:client) { described_class.new }

    it { expect(client.members).to be_a Client::Members }
    it { expect(client.email).to be_a Client::Email }
    it { expect(client.github).to be_a Client::Github }
  end
end
