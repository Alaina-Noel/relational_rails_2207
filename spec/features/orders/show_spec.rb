require 'rails_helper'

RSpec.describe 'the orders show page' do
  it 'displays the order id number' do
    customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
    order = customer.orders.create!(quantity: 1, gift: true, order_type: "green pants")
    visit "/orders/#{order.id}"
    
    expect(page).to have_content(order.id)
end

  it 'displays the order gift status'do
    customer = Customer.create!(first_name: "Robert", last_name: "Robertson" , in_usa: false, credit_score: 754 )
    order = customer.orders.create!(customer_id: 1, quantity: 40, gift: false, order_type: "kitchen knife")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.gift)
end

  it 'displays the customers id to whom the order belongs' do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
    order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.customer_id)
  end

  it 'displays the order gift status' do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
    order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.gift)
  end


  it 'displays the order type' do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
    order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.order_type)
  end

  it 'displays the order timestamps' do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
    order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
    visit "/orders/#{order.id}"

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.updated_at)
  end

  describe 'As a user' do
    describe 'when I visit /orders/show' do
      it 'I see a link at the top of the page that leads me to the orders/index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/orders/#{order.id}"
        
        expect(page).to have_content("This link will take you to all orders index page")
      end

      it 'The link on the top of the page will take you to the orders index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/orders/#{order.id}"
        click_on "This link will take you to all orders index page"

        expect(current_path).to eq("/orders")
      end
    end
  end
end