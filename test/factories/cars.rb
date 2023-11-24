# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  image_path = Rails.root.join('spec', 'fixtures', 'images', 'example.jpg')
  uploaded_file = Rack::Test::UploadedFile.new(image_path, 'image/jpg')

  factory :car do
    year { 2020 }
    range { 900 }
    description { 'Car description' }
    photo { uploaded_file }

    trait :with_brand_and_model do
      transient do
        brand { 'Bugatti Factory' }
        model { 'Model Factory' }
      end

      before(:create) do |car, evaluator|
        car.brand = evaluator.brand
        car.model = evaluator.model
      end
    end
  end
end
