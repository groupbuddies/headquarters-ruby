module Headquarters
  class Github
    def self.pull_requests(query: nil)
      if query
        Request.perform(:get, Endpoints::Github::PULL_REQUESTS, query: { q: query })
      else
        Request.perform(:get, Endpoints::Github::PULL_REQUESTS)
      end
    end
  end
end
