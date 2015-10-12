require 'net/https'
require 'logger'

require 'headquarters/version'
require 'headquarters/client'

if defined? ::Rails::Railtie
  require 'headquarters/railtie'
end

module Headquarters
  API_BASE = 'https://hq.subvisual.co'
  ROOT_PATH = File.dirname(__FILE__)

  @api_base = API_BASE
  @api_port = Net::HTTP.https_default_port
  @logger   = Logger.new(STDOUT)

  class << self
    attr_accessor :api_base, :api_port, :logger

    def new(*options)
      Client.new(*options)
    end
  end
end

require 'headquarters/request'
