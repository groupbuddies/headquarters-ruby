module Headquarters
  class Members
    def self.all
      Request.get_json('/members')
    end
  end
end
