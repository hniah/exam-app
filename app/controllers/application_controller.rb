class ApplicationController < ActionController::Base
  helper_method :current_admin
  
  # def after_sign_in_path_for(resource)
  #   sign_in_url = portal_root_path
  # end

  def current_admin
    current_teacher
  end
end
