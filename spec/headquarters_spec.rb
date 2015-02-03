require 'spec_helper'

describe Headquarters do
  context '.new' do
    it 'instantiates a new client' do
      expect(Headquarters::Client).to receive(:new)

      Headquarters.new
    end
  end
end
