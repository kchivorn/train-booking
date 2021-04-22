class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    else
      redirect_to sign_in_path
    end
  end

  def client_ip
    request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end
end
