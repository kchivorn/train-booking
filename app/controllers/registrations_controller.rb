class RegistrationsController < ApplicationController
  skip_before_action :set_current_user, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    params[:user][:ip_address] = client_ip
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      set_current_user
      redirect_to root_path, notice: 'Registered successfully.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :ip_address)
  end
end
