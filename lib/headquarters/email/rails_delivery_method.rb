require 'headquarters/email'

module Headquarters
  class Email
    class RailsDeliveryMethod
      attr_accessor :options

      def initialize(options = {})
        self.options = options
      end

      def deliver(mail)
        params = {
          from:     mail.from,
          to:       mail.to,
          subject:  mail.subject,
          body:     mail.body.to_s,
          app_name: mail.header['app_name'].to_s
        }
        require 'pry'
        binding.pry
        Headquarters::Email.new(params).send
      end

      alias_method :deliver!,       :deliver
      alias_method :deliver_now,    :deliver
      alias_method :deliver_now!,   :deliver
      alias_method :deliver_later,  :deliver
      alias_method :deliver_later!, :deliver
    end
  end
end
