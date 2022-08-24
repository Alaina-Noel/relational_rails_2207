require 'rails_helper'

RSpec.describe 'the customers show page' do
  xit 'displays the customers first_name'do
  customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
  visit "/customers/#{customer.id}"

  expect(page).to have_content(customer.first_name)
end

  xit 'displays the customers last_name'do
  customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
  visit "/customers/#{customer.id}"

  expect(page).to have_content(customer.last_name)
end

  xit 'displays the customers in usa status'do
  customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
  visit "/customers/#{customer.id}"

  expect(page).to have_content(customer.in_usa)
end

  xit 'displays the customers credit score'do
  customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
  visit "/customers/#{customer.id}"

  expect(page).to have_content(customer.credit_score)
end

xit 'displays the customers timestamps' do
  customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
  visit "/customers/#{customer.id}"

  expect(page).to have_content(customer.created_at)
  expect(page).to have_content(customer.updated_at)
end

  xit 'does not display an unaffiliated customer'do
  customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
  customer2 = Customer.create!(first_name: "Pheobe", last_name: "Jackson" , in_usa: false, credit_score: 400 )

  visit "/customers/#{customer.id}"

  expect(page).to_not have_content(customer2.first_name)
end





end