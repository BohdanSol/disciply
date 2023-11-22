# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    @user.present? && PasswordMailer.with(user: @user).reset.deliver_later

    redirect_to root_path
    flash[:success] = "If this email exists we've sent you an email!"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path
    flash[:danger] = 'Your reset password token has expired. Try again.'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to sign_in_path
      flash[:success] = 'Your reset password was reset successfully.'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
