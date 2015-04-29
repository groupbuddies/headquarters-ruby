module Headquarters
  class Client::Projects < API
    def all
      get Endpoints::PROJECTS
    end
  end
end
