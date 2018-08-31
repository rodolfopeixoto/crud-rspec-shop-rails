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

  scenario 'Should show a client' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end


  scenario 'Should list all clients in index' do

    customer1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    customer2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit customers_path
    expect(page).to have_content(customer1.name).and have_content(customer2.name)

  end

  scenario 'Should update the client' do

    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    new_name = Faker::Name.name

    visit edit_customer_path(customer.id)
    fill_in 'customer_name', with: new_name

    click_on 'Update Client'

    expect(page).to have_content 'Client update successfully'
    expect(page).to have_content new_name
  end

  scenario '' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Y', 'N'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )


    visit customers_path
    find(:xpath, "/html/body/table/tbody/tr[1]/td[2]/a").click
    expect(page).to have_content 'Showing client'

  end

end
