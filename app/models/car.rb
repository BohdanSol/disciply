# frozen_string_literal: true

class Car < ApplicationRecord
  attribute :brand, :integer
  attribute :model, :integer
  has_one_attached :photo
end
