require 'spec_helper'
require 'webmock/rspec'
WebMock.disable_net_connect!

module Headquarters
  describe Request do
    let(:request) { spy('request') }

    context '.perform' do
      it 'makes the correct call for a GET' do
        allow(Request).to receive(:new).and_return(request)

        Request.perform(:get, '/some-url')

        expect(request).to have_received(:get)
      end

      it 'makes the correct call for a POST' do
        allow(Request).to receive(:new).and_return(request)

        Request.perform(:post, '/some-url')

        expect(request).to have_received(:post)
      end

      it 'makes the actual call' do
        url = '/some-url'
        stub_request(:get, Headquarters.api_base + url)
        allow(Request).to receive(:get).and_call_original

        Request.perform(:get, url)

        expect(Request).to have_received(:get).with(url, {})
      end
    end

    context '.perform_with_auth' do
      it 'makes the actual call with basic auth' do
        url = '/some-url'
        options = { basic_auth: { username: 'user', password: 'pass' }}
        stub_request(:get, "user:pass@" + Headquarters.api_base + url)
        allow(Request).to receive(:get).and_call_original

        Request.perform(:get, url, options)

        expect(Request).to have_received(:get).with(url, options)
      end
    end
  end
end
