module Portal
  class BaseController < ApplicationController
    before_action :authenticate_admin!
    

    def authenticate_admin!
      redirect_to new_teacher_session_path and return unless current_admin.present?
    end
  end
end