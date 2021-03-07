# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Our users can view notes' do
  before do
    milk = FactoryBot.create(:product, name: 'Milk')

    FactoryBot.create(:note, product: milk,
                             name: 'No Skim!',
                             description: 'Pickup 2%, not skim milk!')

    chips = FactoryBot.create(:product, name: 'Ketchup Chips')

    FactoryBot.create(:note, product: chips,
                             name: 'Name Brand Chips',
                             description: 'Get the top brand, not el cheapo.')

    visit '/'
  end

  it 'for any product' do
    click_link 'Milk'

    expect(page).to have_content 'No Skim!'
    expect(page).not_to have_content 'Name Brand Chips'

    click_link 'No Skim!'
    within('.note h2') do
      expect(page).to have_content 'No Skim!'
    end

    expect(page).to have_content 'Pickup 2%, not skim milk!'
  end
end
