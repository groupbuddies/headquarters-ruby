require 'httparty'

module Headquarters
  class Request
    include ::HTTParty
    base_uri 'hq.groupbuddies.com'

    def self.get_json(path)
      get(path).to_json
    end
  end
end
