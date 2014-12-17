require 'spec_helper'

module Headquarters
  describe Github do
    context '.pull_requests' do
      it 'asks for all the pull requests' do
        allow(Request).to receive(:perform)

        Github.pull_requests

        expect(Request).to have_received(:perform).
          with(:get, Endpoints::Github::PULL_REQUESTS, query: { q: nil })
      end

      it 'asks for the open pull requests' do
        allow(Request).to receive(:perform)

        Github.pull_requests(query: 'is:open')

        expect(Request).to have_received(:perform).
          with(:get, Endpoints::Github::PULL_REQUESTS, query: { q: 'is:open' })
      end
    end
  end
end
