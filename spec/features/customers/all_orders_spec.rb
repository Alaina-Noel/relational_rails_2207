require 'rails_helper'

RSpec.describe 'the customers index page', type: :feature do 
  describe "As a user" do
    describe "When I visit /customers/id" do
      it 'I can see the quantity of the order' do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
        order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

        visit "/customers/#{customer.id}/orders" 

        expect(page).to have_content(order.quantity)
      end

      it 'I can see the gift status of the order' do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
        order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

        visit "/customers/#{customer.id}/orders" 

        expect(page).to have_content(order.gift)
      end

      it 'I can see the timstamps of the order' do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
        order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

        visit "/customers/#{customer.id}/orders" 

        expect(page).to have_content(order.created_at)
        expect(page).to have_content(order.updated_at)
      end

      it 'I can see the customer ID of the order' do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
        order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
        visit "/customers/#{customer.id}/orders" 

        expect(page).to have_content(order.customer_id)
      end

      it 'I can see all of the orders a customer made' do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
        order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
        order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")
        visit "/customers/#{customer.id}/orders" 

        expect(page).to have_content(order1.order_type)
        expect(page).to have_content(order2.order_type)
      end
    end
  end
end