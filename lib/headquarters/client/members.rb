module Headquarters
  class Client::Members < API
    def all
      get Endpoints::MEMBERS
    end

    def me
      get Endpoints::ME
    end

    def search(query)
      get Endpoints::MEMBERS, query: { q: query }
    end
  end
end
