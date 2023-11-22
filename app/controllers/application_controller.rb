# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    return unless session[:user_id]

    Current.user = User.find_by(id: session[:user_id])
  end

  def require_user_logged_in!
    return unless Current.user.nil?

    redirect_to sign_in_path
    flash[:warning] = 'You must log in to continue'
  end
end
