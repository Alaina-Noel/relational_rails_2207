require 'rails_helper'

RSpec.describe 'the orders of a particular customer page' do
  it 'displays the order quantity' do
    customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
    order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

    visit "/customers/#{customer.id}/orders" 

    expect(page).to have_content(order.quantity)
  end

  it 'displays the order gift status' do
    customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
    order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

    visit "/customers/#{customer.id}/orders" 

    expect(page).to have_content(order.gift)
  end

  it 'displays the orders timestamps' do
    customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
    order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

    visit "/customers/#{customer.id}/orders" 

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.updated_at)
  end

  it 'displays the orders customer id' do
    customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
    order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
    visit "/customers/#{customer.id}/orders" 

    expect(page).to have_content(order.customer_id)
  end

  it 'displays all of the customers orders' do
    customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
    order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
    order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")
    visit "/customers/#{customer.id}/orders" 

    expect(page).to have_content(order1.order_type)
    expect(page).to have_content(order2.order_type)
  end
end