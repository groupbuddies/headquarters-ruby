require 'spec_helper'

describe Headquarters::Members do
  context '.all' do
    it 'fetches all the members' do
      fake_members = [:me, :you, :him].to_s
      # WebMock.allow_net_connect!
      stub_request(:get, 'http://hq.groupbuddies.com/members').to_return(body: fake_members)

      members = Headquarters::Members.all

      expect(members).to eq(fake_members)
    end
  end
end
