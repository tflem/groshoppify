# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :notes, dependent: :delete_all
  validates :name, :quantity, presence: true
end
