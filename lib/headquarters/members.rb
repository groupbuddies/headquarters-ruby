module Headquarters
  class Members
    def self.all
      Request.perform(:get, '/members')
    end

    def self.all_internal
      Request.perform(:get, '/internal/members')
    end
  end
end
