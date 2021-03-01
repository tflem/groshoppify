# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :notes
  validates :name, :quantity, presence: true
end
