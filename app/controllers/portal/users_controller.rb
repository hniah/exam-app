module Portal
  class UsersController < BaseController
    def index
      @users = User.all.order(id: :desc).page(params[:page]).per(10)
    end

    def show
    end
  end
end