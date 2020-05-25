class ApplicationController < ActionController::Base
  helper_method :current_admin

  def current_admin
    current_teacher
  end
end
