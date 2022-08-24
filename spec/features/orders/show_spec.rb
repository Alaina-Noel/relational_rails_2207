require 'rails_helper'

RSpec.describe 'the orders show page' do
  it 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 40, gift: false, order_type: "kitchen knife")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.quantity)
  end

  xit 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 40, gift: false, order_type: "kitchen knife")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.gift)
end

  xit 'displays the customers first_name'do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.order_type)
  end

  xit 'displays the customers id'do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.customer_id)
  end


  xit 'displays the customers timestamps'do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.updated_at)
  end
end