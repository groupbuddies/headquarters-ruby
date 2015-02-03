require 'headquarters/rails_delivery_method'

module Headquarters
  class Railtie < ::Rails::Railtie
    initializer 'headquaters.add_delivery_method' do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :headquarters, Headquarters::RailsDeliveryMethod
      end
    end
  end
end
