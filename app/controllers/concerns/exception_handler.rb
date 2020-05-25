module ExceptionHandler
  def listening_exception
    begin
      yield
    rescue => exception
      render json: {error_code: 500, message: exception.message }, status: :ok
    end
  end
end
