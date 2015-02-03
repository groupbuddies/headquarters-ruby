require 'headquarters/client/email'

module Headquarters
  class RailsDeliveryMethod

    def initialize(**args)
    end

    class << self
      attr_accessor :credentials
    end

    def deliver(mail)
      params = {
        from:     mail.from,
        to:       mail.to,
        subject:  mail.subject,
        body:     mail.body.to_s,
        app_name: mail.header['app_name'].to_s
      }
      client.deliver(params)
    end

    alias_method :deliver!,       :deliver
    alias_method :deliver_now,    :deliver
    alias_method :deliver_now!,   :deliver
    alias_method :deliver_later,  :deliver
    alias_method :deliver_later!, :deliver

    private

    def client
      @client ||= Headquarters::Client::Email.new(self.class.credentials)
    end
  end
end
