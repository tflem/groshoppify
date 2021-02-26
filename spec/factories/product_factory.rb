# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Example product' }
    description { 'Example description' }
    quantity { 2 }
  end
end
