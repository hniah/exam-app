module Api
  class BaseController < ActionController::API
    include ExceptionHandler
    around_action :listening_exception

    def render_json(error_code: 0, message: '', data: nil)
      if error_code.zero?
        render json: { error_code: error_code, data: data }
      else
        render json: { error_code: error_code, message: message }
      end
    end
  end
end
