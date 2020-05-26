module Error
  class APIError < StandardError
    attr_reader :message, :error_code
    def initialize(error_code, message)
      @error_code = error_code
      @message = message
    end
  end

  class API
    MissingToken = APIError.new(1000, 'Missing Access-Token')
    InvalidToken = APIError.new(1001, 'Invalid Access-Token ')
    LoginFailure = APIError.new(1002, 'Login unsuccessful')
  end
end
