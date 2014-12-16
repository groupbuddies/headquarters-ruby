require 'httparty'

module Headquarters
  class Request
    include ::HTTParty
    base_uri Headquarters.api_base

    def self.perform(http_method, path)
      case http_method
      when :post
        new(path).post
      else
        new(path).get
      end
    end

    def initialize(path)
      @path = path
    end

    def get
      Request.get(path).to_json.tap do |response|
        log_request_info(:get, response)
      end
    end

    def post
      Request.post(path).to_json.tap do |response|
        log_request_info(:post, response)
      end
    end

    private

    attr_reader :path

    def log_request_info(http_method, response)
      Headquarters.logger.info "[HQ] [#{current_time}] #{http_method.to_s.upcase} #{path} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime("%d/%b/%Y %H:%M:%S %Z")
    end
  end
end
