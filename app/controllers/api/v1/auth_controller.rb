module Api
  module V1
    class AuthController < Api::BaseController

      def create
        @user = Student.find_for_database_authentication(email: params[:email])

        if @user && @user.valid_password?(params[:password])
          render_json(data: {token: generate_token, student: StudentSerializer.new(@user) })
        else
          raise Error::API::LoginFailure
        end
      end

      private

      def generate_token
        @user.api_token || @user.generate_token
      end
    end
  end
end

