require 'httparty'

module Headquarters
  class Request
    include ::HTTParty
    base_uri Headquarters.api_base

    def self.perform_with_auth(http_method, path)
      perform(http_method, path,
        basic_auth: {
          username: ENV['BASIC_AUTH_USER'],
          password: ENV['BASIC_AUTH_PASS']
        }
      )
    end

    def self.perform(http_method, path, options = {})
      case http_method
      when :post
        new(path, options).post
      else
        new(path, options).get
      end
    end

    def initialize(path, options)
      @path = path
      @options = options
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
      Headquarters.logger.info "[HQ] [#{current_time}] #{http_method.to_s.upcase} #{path} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime('%d/%b/%Y %H:%M:%S %Z')
    end
  end
end
