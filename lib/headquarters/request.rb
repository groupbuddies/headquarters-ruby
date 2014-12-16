require 'httparty'

module Headquarters
  class Request
    include ::HTTParty
    base_uri Headquarters.api_base

    def self.perform_with_auth(http_method, path, params = {}, options = {})
      options_with_auth = options.merge(
        basic_auth: {
          username: ENV['BASIC_AUTH_USER'],
          password: ENV['BASIC_AUTH_PASS']
        }
      )
      perform(http_method, path, params, options_with_auth)
    end

    def self.perform(http_method, path, params = {}, options = {})
      new(path, params, options).public_send(http_method)
    end

    def initialize(path, params, options)
      @path = path
      @options = options
      @options.merge!(query: params) if params && params.any?
    end

    def get
      response = Request.get(path, options)
      log_request_info(:get, response)
      response.parsed_response
    end

    def post
      response = Request.post(path, options)
      log_request_info(:post, response)
      response.parsed_response
    end

    private

    attr_reader :path, :options

    def log_request_info(http_method, response)
      Headquarters.logger.info "[HQ] [#{current_time}] #{http_method.to_s.upcase} #{path} #{options} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime('%d/%b/%Y %H:%M:%S %Z')
    end
  end
end
