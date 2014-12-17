require 'net/https'
require 'logger'
require 'dotenv'

require 'headquarters/version'
require 'headquarters/endpoints'

module Headquarters
  API_BASE = 'hq.groupbuddies.com'
  ROOT_PATH = File.dirname(__FILE__)

  @api_base = API_BASE
  @api_port = Net::HTTP.https_default_port
  @logger   = Logger.new(STDOUT)

  class << self
    attr_accessor :api_base, :api_port, :logger
  end
end

require 'headquarters/request'
require 'headquarters/member'
require 'headquarters/github'

Dotenv.load
