module Headquarters
  class Member
    def self.all
      Request.perform(:get, Endpoints::MEMBERS)
    end

    def self.all_internal
      Request.perform_with_auth(:get, Endpoints::Internal::MEMBERS)
    end
  end
end
