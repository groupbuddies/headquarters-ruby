require 'headquarters/version'
require 'headquarters/request'
require 'headquarters/members'

module Headquarters
  API_BASE = 'hq.groupbuddies.com'
  ROOT_PATH = File.dirname(__FILE__)

  @@api_base = API_BASE
  @@api_port = Net::HTTP.https_default_port
  @@logger   = Logger.new(STDOUT)

  # Returns the api base endpoint
  #
  # @return [String] The api base endpoint
  def self.api_base
    @@api_base
  end

  # Sets the api base endpoint
  #
  # @param [String] api_base The api base endpoint
  def self.api_base=(api_base)
    @@api_base = api_base
  end

  # Returns the api port
  #
  # @return [String] The api port
  def self.api_port
    @@api_port
  end

  # Sets the api port
  #
  # @param [String] api_port The api port
  def self.api_port=(api_port)
    @@api_port = api_port
  end

  # Returns the current logger
  #
  # @return [Logger] The current logger
  def self.logger
    @@logger
  end

  # Sets the logger for Paymill
  #
  # @param [Logger] logger The logger instance to be used
  def self.logger=(logger)
    @@logger = logger
  end
end
