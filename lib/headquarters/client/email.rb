module Headquarters
  class Client::Email < API
    FIELDS = %i(to from subject app_name body)

    def deliver(**raw_params)
      prepare_params(raw_params)
      post Endpoints::EMAIL, body: params
    end

    attr_accessor(*FIELDS)

    private

    def params
      Hash[FIELDS.map do |field|
        [field, public_send(field)]
      end.compact]
    end

    def prepare_params(raw_params)
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
