require 'spec_helper'

module Headquarters
  module OAuth
    describe Strategy do
      let(:request) { double('Request', params: {}, cookies: {}, env: {}) }

      subject do
        args = ['appid', 'secret', @options || {}].compact
        OmniAuth::Strategies::Twitter.new(*args).tap do |strategy|
          allow(strategy).to receive(:request) {
            request
          }
        end
      end

      describe 'client options' do
        it 'should have correct name' do
          expect(subject.options.name).to eq('twitter')
        end

        it 'should have correct site' do
          expect(subject.options.client_options.site).to eq('http://auth.headquarters.com')
        end
      end
    end
  end
end
