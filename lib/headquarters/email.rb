module Headquarters
  class Email
    FIELDS = %i(to from subject app_name body)

    def self.send(**raw_params)
      prepare_params(raw_params)
      Request.perform_with_auth(:post, Endpoints::Internal::EMAIL, params)
    end

    class << self
      attr_accessor(*FIELDS)
    end

    def self.params
      Hash[FIELDS.map do |field|
        [field, public_send(field)]
      end.compact]
    end

    private

    def self.prepare_params(raw_params)
      @to = raw_params[:to]
      if @to.is_a? Array
        @to = @to.join(',')
      end
      @from = raw_params[:from]
      @subject = raw_params[:subject]
      @app_name = raw_params[:app_name]
      @body = raw_params[:body]
    end
  end
end
