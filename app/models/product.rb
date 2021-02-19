# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :quantity, presence: true
end
