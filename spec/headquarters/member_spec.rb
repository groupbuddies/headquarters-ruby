require 'spec_helper'

module Headquarters
  describe Member do
    context '.all' do
      it 'makes a new GET request using the correct API endpoint' do
        allow(Request).to receive(:perform)

        Member.all

        expect(Request).to have_received(:perform).with(:get, Endpoints::MEMBERS)
      end
    end

    context '.all_internal' do
      it 'makes a new GET request using the correct API endpoint' do
        allow(Request).to receive(:perform_with_auth)

        Member.all_internal

        expect(Request).to have_received(:perform_with_auth).with(:get, Endpoints::Internal::MEMBERS)
      end
    end
  end
end
