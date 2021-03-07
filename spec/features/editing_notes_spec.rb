# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Our users can edit existing notes' do
  let(:product) { FactoryBot.create(:product) }
  let(:note)    { FactoryBot.create(:note, product: product) }

  before do
    visit product_note_path(product, note)
  end

  it 'with valid attributes' do
    click_link 'Edit Note'
    fill_in 'Name', with: 'No Skim!'
    click_button 'Update Note'

    expect(page).to have_content 'Your note has been updated.'

    within('.note h2') do
      expect(page).to have_content 'No Skim!'
      expect(page).not_to have_content note.name
    end
  end

  it 'with invalid attributes' do
    click_link 'Edit Note'
    fill_in 'Name', with: ''
    click_button 'Update Note'

    expect(page).to have_content 'Your note has not been updated.'
  end
end
