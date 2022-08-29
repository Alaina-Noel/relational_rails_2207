require 'rails_helper'

RSpec.describe 'the customers index page', type: :feature do 
  describe "As a user" do
    describe "When I visit /orders" do
      it 'I can see the quantity of the order' do
        customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
        order = customer.orders.create!(quantity: 1, gift: true, order_type: "green pants")
        visit '/orders'

        expect(page).to have_content(order.quantity)
      end

      it 'I can see the gift status of the order' do
        customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
        order = customer.orders.create!(quantity: 4, gift: true, order_type: "polly pockets")
        visit '/orders'
        expect(page).to have_content(order.gift)
      end

      it 'I can see the type or description of the order' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: true, credit_score: 74 )
        order = customer.orders.create!( quantity: 400, gift: true, order_type: "kitchen set")
        visit '/orders'

        expect(page).to have_content(order.order_type)
      end

      it 'I can see the timestamps of the order' do
        customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
        order = customer.orders.create!(quantity: 40, gift: true, order_type: "carving knife")
        visit '/orders'

        expect(page).to have_content(order.created_at)
        expect(page).to have_content(order.updated_at)
      end

      it 'I can see the name of the customer who made the order' do
        customer = Customer.create!(first_name: "Robert", last_name: "Kneiling" , in_usa: true, credit_score: 754 )
        order = customer.orders.create!(quantity: 40, gift: true, order_type: "carving knife")
        visit '/orders'

        expect(page).to have_content(customer.first_name)
      end

      it 'I see a link at the top of the page that leads me to the orders/index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/orders"
        
        expect(page).to have_content("This link will take you to all customers index page")
      end

      it 'The link on the top of the page will take you to the orders index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/orders"
        click_on "This link will take you to all customers index page"

        expect(current_path).to eq("/customers")
      end

      it 'returns the orders above a certian quantity' do
        customer1 = Customer.create(first_name: "Alaina", last_name: "Kneiling", in_usa: true, credit_score: 502)
        order1 = customer1.orders.create!(quantity: 44, gift: true, order_type: "green pants")
        order2 = customer1.orders.create!(quantity: 34, gift: true, order_type: "green shirt")
        order3 = customer1.orders.create!(quantity: 24, gift: true, order_type: "green shoes")
        order4 = customer1.orders.create!(quantity: 14, gift: true, order_type: "green polly pockets")

        expect(Order.find_orders_above(34)).to eq([order1])
      end
      
    end
  end
end