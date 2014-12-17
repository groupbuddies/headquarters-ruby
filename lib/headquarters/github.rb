module Headquarters
  class Github
    def self.pull_requests(query: nil)
      Request.perform(:get, Endpoints::Github::PULL_REQUESTS, query: { q: query })
    end
  end
end
