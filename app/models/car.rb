# frozen_string_literal: true

class Car < ApplicationRecord
  attribute :brand, :integer
  attribute :model, :integer

  validates :year, presence: true
  validates :range, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :brand, presence: true
  validates :model, presence: true

  has_one_attached :photo
end
