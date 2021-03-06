module Api
  class BaseAuthController < Api::BaseController
    before_action :authenticate_request
    attr_reader :current_user
    
    private
    
    def authenticate_request
      token = request.headers['Access-Token']
      raise Error::API::MissingToken if token.nil?
      raise Error::API::InvalidToken if validate_token(token).nil?
    end

    def validate_token(token)
      @current_user = Student.find_by_api_token(token)
    end
  end
end

