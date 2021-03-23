# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :product
  belongs_to :author, class_name: "User"
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
