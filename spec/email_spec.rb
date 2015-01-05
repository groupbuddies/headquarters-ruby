require 'spec_helper'

module Headquarters
  describe Email do
    context '.send' do
      it 'makes a new POST request using the correct API endpoint' do
        allow(Request).to receive(:perform_with_auth)
        params = { subject: 'fake subject' }

        Email.send(params)

        expect(Request).to have_received(:perform_with_auth).with(:post, Endpoints::Internal::EMAIL, hash_including(params))
      end
    end
  end
end
