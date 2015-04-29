module Headquarters
  class API
    module Endpoints
      MEMBERS = '/members'
      PROJECTS = '/projects'
      EMAIL = '/emails'
      OAUTH_TOKEN = '/oauth/token'

      module Github
        PULL_REQUESTS = '/github/pull_requests'
      end
    end
  end
end
