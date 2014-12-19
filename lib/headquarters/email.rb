module Headquarters
  class Email
    def self.send(**params)
      return unless params[:to] && params[:body]

      Request.perform_with_auth(:post, Endpoints::Internal::EMAIL, params)
    end
  end
end
