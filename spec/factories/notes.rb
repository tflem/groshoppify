# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    name { 'Example note' }
    description { 'An example note--no more, no less' }
  end
end
