class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}!"
    resource.admin? ? admin_tests_path : root_path
  end
end
