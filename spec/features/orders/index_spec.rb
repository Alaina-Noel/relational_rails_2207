require 'rails_helper'

RSpec.describe 'the orders index page' do
  xit 'displays the orders id' do
    order = Order.create!(customer_id: 1, quantity: 1, gift: true, order_type: "green pants")
    visit '/orders'

    expect(page).to have_content(order.quantity)
  end

  xit 'displays the orders quantity' do
    order = Order.create!(customer_id: 2, quantity: 4, gift: false, order_type: "polly pockets")
    visit '/orders'

    expect(page).to have_content(order.gift)
  end

  xit 'does not display the customers orders' do
    order = Order.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit '/orders'

    expect(page).to have_content(order.order_type)
  end

  xit 'does not display the customers orders' do
    order = Order.create!(customer_id: 3, quantity: 40, gift: true, order_type: "carving knife")
    visit '/orders'

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.updated_at)
  end


end