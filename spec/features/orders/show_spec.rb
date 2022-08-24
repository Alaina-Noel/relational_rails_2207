require 'rails_helper'

RSpec.describe 'the orders show page' do
  it 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 40, gift: false, order_type: "kitchen knife")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.quantity)
  end

  it 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 40, gift: false, order_type: "kitchen knife")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.gift)
end

  it 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.order_type)
  end

  it 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.customer_id)
  end


  it 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.updated_at)
  end
end