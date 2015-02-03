RSpec.shared_examples 'an HTTP requester' do
  let(:client) { described_class.new }

  context '#get' do
    it 'makes a GET request to the correct endpoint' do
      allow(client).to receive(:perform_request)

      client.get :fake_endpoint

      expect(client).to have_received(:perform_request).with(:get, :fake_endpoint, {})
    end

    it 'accepts optional arguments' do
      allow(client).to receive(:perform_request)

      client.get :fake_endpoint, arg: :value

      expect(client).to have_received(:perform_request).with(:get, :fake_endpoint, arg: :value)
    end
  end

  context '#post' do
    it 'makes a POST request' do
      allow(client).to receive(:perform_request)

      client.post :fake_endpoint

      expect(client).to have_received(:perform_request).with(:post, :fake_endpoint, {})
    end

    it 'accepts optional arguments' do
      allow(client).to receive(:perform_request)

      client.post :fake_endpoint, arg: :value

      expect(client).to have_received(:perform_request).with(:post, :fake_endpoint, arg: :value)
    end
  end
end
