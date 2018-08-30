require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  scenario 'Show the message Welcome' do
    visit root_path
    expect(page).to have_content 'Welcome'
  end

  scenario 'Cheking link create record' do
    visit root_path
    expect(page).to have_selector 'ul li'
  end
end
