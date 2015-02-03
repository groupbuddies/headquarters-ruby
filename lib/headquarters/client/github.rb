module Headquarters
  class Client::Github < API
    def pull_requests(query: nil)
      get Endpoints::Github::PULL_REQUESTS, query: { q: query }
    end
  end
end
