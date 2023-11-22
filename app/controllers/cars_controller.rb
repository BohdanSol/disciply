# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_brands_and_models, only: %i[new create]

  def new
    @car = Car.new
  end

  def show
    ActiveStorage::Current.url_options = {
      host: request.base_url
    }
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(create_car_params)
    if @car.save
      flash[:success] = 'Car created successfully!'
      redirect_to @car
    else
      render :new
      flash[:success] = 'Oops... Something went wrong!'
    end
  end

  def models_for_brand
    brand = Brand.find(params[:brand])
    models = brand.models
    render json: models
  end

  private

  def set_brands_and_models
    @brands = Brand.all
    @models = Model.all
  end

  def create_car_params
    params.require(:car).permit(:year, :range, :description, :photo, :brand, :model)
  end
end
