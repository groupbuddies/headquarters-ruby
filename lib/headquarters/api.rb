require 'headquarters/api/endpoints'
require 'headquarters/api/factory'
require 'headquarters/api/oauth_authenticator'

module Headquarters
  class API
    def initialize(**options)
      @authenticator = options[:authenticator] || OAuthAuthenticator.new(options)
    end

    def headers
      authenticator.headers.merge(
        'Accept' => 'v2'
      )
    end

    attr_reader :authenticator

    def get(endpoint, **params)
      perform_request(:get, endpoint, params)
    end

    def post(endpoint, **params)
      perform_request(:post, endpoint, params)
    end

    private

    def perform_request(method, endpoint, params = {})
      Request.perform(method, endpoint, params_with_headers(params))
    end

    def params_with_headers(original_params)
      params = original_params.dup
      params[:headers] ||= {}
      params[:headers].merge!(headers)
      params
    end

    def self.namespace(name)
      class_name = namespace_to_class_name(name)
      define_method(name) do
        @namespaces ||= {}
        @namespaces[name] ||= API::Factory.new(class_name, authenticator: authenticator)
      end
    end

    def self.namespace_to_class_name(name)
      "#{self.name}::#{name.to_s.split('_').map(&:capitalize).join}"
    end
  end
end
