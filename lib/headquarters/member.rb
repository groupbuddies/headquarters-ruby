module Headquarters
  class Member
    def self.all
      Request.perform(:get, Endpoints::MEMBERS)
    end

    def self.all_internal
      Request.perform(:get, Endpoints::MEMBERS_INTERNAL, basic_auth: {
        username: ENV['BASIC_AUTH_USER'],
        password: ENV['BASIC_AUTH_PASS']
      })
    end
  end
end
