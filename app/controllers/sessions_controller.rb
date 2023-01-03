class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)

    if user = User.authenticate_with_credentials(params[:login][:email], params[:login][:password])
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'Logged in'
    else
      flash.now.alert = "Invalid login credentials"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out"
  end
end
