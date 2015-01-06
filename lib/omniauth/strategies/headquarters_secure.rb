require 'omniauth/strategies/headquarters'

module OmniAuth
  module Strategies
    class HeadquartersSecure < Headquarters
      URL = 'https://hq.groupbuddies.com'
      option :client_options, site: URL, authorize_path: PATH
    end
  end
end
