require 'httparty'

module Headquarters
  class Request
    include ::HTTParty
    base_uri Headquarters.api_base

    def self.perform_with_auth(http_method, path, params = {}, options = {})
      options_with_auth = options.merge(basic_auth_info)
      perform(http_method, path, params, options_with_auth)
    end

    def self.perform(http_method, path, params = {}, options = {})
      new(path, params, options).public_send(http_method)
    end

    def initialize(path, params, options)
      @path = path
      @options = options
      @params = params
    end

    def get
      @options.merge!(query: params) if params && params.any?
      response = Request.get(path, options)
      log_request_info(:get, response)
      response.parsed_response
    end

    def post
      @options.merge!(body: params) if params && params.any?
      response = Request.post(path, options)
      log_request_info(:post, response)
      response.parsed_response
    end

    private

    attr_reader :path, :options, :params

    def log_request_info(http_method, response)
      Headquarters.logger.info "[HQ] [#{current_time}] #{http_method.to_s.upcase} #{path} #{options} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime('%d/%b/%Y %H:%M:%S %Z')
    end

    def self.basic_auth_info
      hq_basic_auth_info || deprecated_basic_auth_info
    end

    def self.hq_basic_auth_info
      return unless ENV['HQ_BASIC_AUTH_USER']
      {
        basic_auth: {
          username: ENV['HQ_BASIC_AUTH_USER'],
          password: ENV['HQ_BASIC_AUTH_PASS']
        }
      }
    end

    def self.deprecated_basic_auth_info
      warn '[DEPRECATED] Using ENV["BASIC_AUTH_USER"] is deprecated. Please use ENV["HQ_BASIC_AUTH_USER"]'
      {
        basic_auth: {
          username: ENV['BASIC_AUTH_USER'],
          password: ENV['BASIC_AUTH_PASS']
        }
      }
    end
  end
end
