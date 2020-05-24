module Portal
  class UsersController < BaseController
    before_action :find_user, only: [:edit, :destroy, :show, :update]
    def index
      @users = User.all.order(id: :desc).page(params[:page]).per(10)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to portal_users_path, notice: 'User has been created.'
      else
        render :new
      end
    end

    def update
      if @user.update(update_user_params)
        redirect_to portal_user_path(@user), notice: 'User has been updated.'
      else
        render :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      if @user == current_admin
        flash[:alert] = 'Can not remove yourself.'
      elsif @user.destroy
        flash[:notice] = 'User has been deleted.'
      else
        flash[:error] = @user.errors.full_messages
      end
      redirect_to portal_users_path
    end

    private

    def id
      params.require(:id)
    end

    def find_user
      @user ||= User.find(id)
    end

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :type,
        :password,
        :password_confirmation
      )
    end

    def update_user_params
      data = user_params
      return data if data[:password].present?
      data.delete(:password)
      data.delete(:password_confirmation)
      data
    end
  end
end