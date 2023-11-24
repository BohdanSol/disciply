# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    ActiveStorage::Current.url_options = {
      host: request.base_url
    }
    @cars = Car.page(params[:page]).per(5).order('created_at DESC')
  end
end
