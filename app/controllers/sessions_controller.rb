class SessionsController < ApplicationController
  skip_before_action :set_current_user, only: %i[new create destroy]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      set_current_user
      redirect_to root_path, notice: 'Signed in successfully.'
    else
      flash[:alert] = 'Incorrect email or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logged out.'
  end
end
