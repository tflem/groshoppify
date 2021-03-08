# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Our users can delete notes' do
  let(:product) { FactoryBot.create(:product) }
  let(:note)    { FactoryBot.create(:note, product: product) }

  before do
    visit product_note_path(product, note)
  end

  it 'successfully' do
    click_link 'Delete Note'

    expect(page).to have_content 'Your note has been deleted.'
    expect(page.current_url).to eq product_url(product)
    expect(page).not_to have_content(note.name)
  end
end
