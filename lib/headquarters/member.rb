module Headquarters
  class Member
    def self.all
      Request.perform(:get, Endpoints::MEMBERS)
    end

    def self.all_internal
      Request.perform_with_auth(:get, Endpoints::MEMBERS_INTERNAL)
    end
  end
end
