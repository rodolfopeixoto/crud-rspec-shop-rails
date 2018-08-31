require 'rails_helper'

RSpec.feature "Customers", type: :feature do

  scenario 'Cheking link create record' do
    visit root_path
    expect(page).to have_link 'Create Clients'
  end

  scenario 'Should a link with New Clients' do
    visit root_path
    click_on 'Create Clients'
    expect(page).to have_content 'List Clients'
    expect(page).to have_link 'New Client'
  end

  scenario 'Should form with new client' do
    visit customers_path
    click_on 'New Client'
    expect(page).to have_content 'New Client'
  end

  scenario 'Should Create Client' do
    visit new_customer_path
    
    customer_name = Faker::Name.name

    fill_in 'customer_name', with: customer_name
    fill_in 'customer_email', with: Faker::Internet.email
    fill_in 'customer_phone', with: Faker::PhoneNumber.phone_number
    attach_file 'customer_avatar', "#{Rails.root}/spec/fixtures/avatar.png"
    choose option: ['Y', 'N'].sample
    click_on 'Create Client'

    expect(page).to have_content 'Client create with successsfully!'
    expect(Customer.last.name).to eq customer_name
  end

  scenario 'Should not Create Client' do
    visit new_customer_path
    click_on 'Create Client'

    expect(page).to have_content "Name can't be blank"
  end
end
