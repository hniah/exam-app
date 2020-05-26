module ExceptionHandler
  def listening_exception
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      response_error(404, 'Not found')
    rescue ActiveRecord::RecordInvalid => e
       response_error(400, e.message)
    rescue => e
      if e.class.name.include? 'Error::APIError'
        response_error(e.error_code, e.message)
      else
        response_error(500, e.message)
      end
    end
  end

  private

  def response_error(code, message)
    render json: {error_code: code, message: message }, status: :ok
  end
end
