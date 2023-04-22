class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = 'Logged in successfully'
    else
      redirect_to sign_in_path
      flash[:danger] = 'Wrong email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:warn] = 'Logged out'
  end
end
