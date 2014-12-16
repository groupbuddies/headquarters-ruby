require 'spec_helper'

module Headquarters
  describe Member do
    before :each do
      allow(Request).to receive(:perform)
    end

    context '.all' do
      it 'makes a new GET request using the correct API endpoint' do
        Member.all

        expect(Request).to have_received(:perform).with(:get, Endpoints::MEMBERS)
      end
    end

    context '.all_internal' do
      it 'makes a new GET request using the correct API endpoint' do
        credentials = { basic_auth: { username: 'user', password: 'pass' }}
        new_env = {
          BASIC_AUTH_PASS: credentials[:basic_auth][:password],
          BASIC_AUTH_USER: credentials[:basic_auth][:username]
        }

        with_modified_env new_env do
          Member.all_internal

          expect(Request).to have_received(:perform).with(:get, Endpoints::MEMBERS_INTERNAL, credentials)
        end
      end
    end
  end
end
