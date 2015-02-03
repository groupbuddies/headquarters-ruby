require 'httparty'

module Headquarters
  class Request
    include ::HTTParty
    base_uri Headquarters.api_base

    def self.perform(http_method, path, params = {})
      new(path, params).public_send(http_method)
    end

    def initialize(path, params)
      @path = path
      @params = params
    end

    def get
      response = Request.get(path, params)
      log_request_info(:get, response)
      response.parsed_response
    end

    def post
      response = Request.post(path, params)
      log_request_info(:post, response)
      response.parsed_response
    end

    private

    attr_reader :path, :params

    def log_request_info(http_method, response)
      Headquarters.logger.info "[HQ] [#{current_time}] #{http_method.to_s.upcase} #{path} #{params} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime('%d/%b/%Y %H:%M:%S %Z')
    end
  end
end
