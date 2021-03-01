class Note < ApplicationRecord
  belongs_to :product
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
