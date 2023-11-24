# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:brand) { create(:brand) }
  let!(:model) { create(:model, brand:) }

  image_path = Rails.root.join('spec', 'fixtures', 'images', 'example.jpg')
  car_image_uploaded = Rack::Test::UploadedFile.new(image_path, 'image/jpg')

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new car instance' do
      get :new
      expect(assigns(:car)).to be_a_new(Car)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      car = create(:car, :with_brand_and_model, brand: brand.id, model: model.id)
      get :show, params: { id: car.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested car to @car' do
      car = create(:car, :with_brand_and_model, brand: brand.id, model: model.id)
      get :show, params: { id: car.id }
      expect(assigns(:car)).to eq(car)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new car' do
        expect do
          post :create, params: {
            car: {
              name: 'Example Car',
              year: 2022,
              range: 'Some Range',
              description: 'Some Description',
              photo: car_image_uploaded,
              brand: brand.id,
              model: model.id
            }
          }
        end.to change(Car, :count).by(1)
      end

      it 'redirects to the created car' do
        post :create, params: {
          car: {
            name: 'Example Car',
            year: 2022,
            range: 'Some Range',
            description: 'Some Description',
            photo: car_image_uploaded,
            brand: brand.id,
            model: model.id
          }
        }
        expect(response).to redirect_to(Car.last)
      end

      it 'sets a flash success message' do
        post :create, params: {
          car: {
            name: 'Example Car',
            year: 2022,
            range: 'Some Range',
            description: 'Some Description',
            photo: car_image_uploaded,
            brand: brand.id,
            model: model.id
          }
        }
        expect(flash[:success]).to eq('Car created successfully!')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new car' do
        expect do
          post :create, params: { car: { name: '', brand: brand.id, model: model.id } }
        end.to_not change(Car, :count)
      end

      it 'sets a flash error message' do
        post :create, params: { car: { name: '', brand: brand.id, model: model.id } }
        expect(flash[:error]).to eq('Oops... Something went wrong!')
      end
    end
  end

  describe 'GET #models_for_brand' do
    it 'returns models for a given brand as JSON' do
      brand = create(:brand)
      model = create(:model, brand:)

      get :models_for_brand, params: { brand: brand.id }, format: :json

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).first['name']).to eq(model.name)
    end
  end
end
