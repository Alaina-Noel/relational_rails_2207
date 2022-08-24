require 'rails_helper'

RSpec.describe 'the orders index page' do
  it 'displays the orders quantity' do
    customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
    order = customer.orders.create!(quantity: 1, gift: true, order_type: "green pants")
    visit '/orders'

    expect(page).to have_content(order.quantity)
  end

  it 'displays the orders gift status' do
    customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
    order = customer.orders.create!(quantity: 4, gift: false, order_type: "polly pockets")
    visit '/orders'

    expect(page).to have_content(order.gift)
  end

  it 'does not display the order type' do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: true, credit_score: 74 )
    order = customer.orders.create!( quantity: 400, gift: false, order_type: "kitchen set")
    visit '/orders'

    expect(page).to have_content(order.order_type)
  end

  it 'displays the orders timestamps' do
    customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
    order = customer.orders.create!(quantity: 40, gift: true, order_type: "carving knife")
    visit '/orders'

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.updated_at)
  end

  it 'does not display the customer name' do
    customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
    order = customer.orders.create!(quantity: 40, gift: true, order_type: "carving knife")
    visit '/orders'

    expect(page).to_not have_content(customer.first_name)
    expect(page).to_not have_content(customer.last_name)
  end


end