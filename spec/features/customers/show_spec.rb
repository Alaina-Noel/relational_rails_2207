require 'rails_helper'

RSpec.describe 'the customers index page', type: :feature do 
  describe "As a user" do
    describe "When I visit /customers/id" do
      it 'I can see the first name of the customer' do
        customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
        visit "/customers/#{customer.id}"

        expect(page).to have_content(customer.first_name)
      end

        it 'I can see the customers last_name'do
        customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
        visit "/customers/#{customer.id}"

        expect(page).to have_content(customer.last_name)
      end

        it 'I can see the customers in usa status'do
        customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
        visit "/customers/#{customer.id}"

        expect(page).to have_content(customer.in_usa)
      end

        it 'I can see the customers credit score'do
        customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
        visit "/customers/#{customer.id}"

        expect(page).to have_content(customer.credit_score)
      end

      it 'I can see the customers timestamps' do
        customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
        visit "/customers/#{customer.id}"

        expect(page).to have_content(customer.created_at)
        expect(page).to have_content(customer.updated_at)
      end

      it 'I can not see an unaffiliated customer'do
        customer = Customer.create!(first_name: "Samuel", last_name: "Jackson" , in_usa: true, credit_score: 400 )
        customer2 = Customer.create!(first_name: "Pheobe", last_name: "Jackson" , in_usa: false, credit_score: 400 )

        visit "/customers/#{customer.id}"

        expect(page).to_not have_content(customer2.first_name)
      end
    end
  end

  describe "user count" do
    describe "As a visitor" do
      describe "When I visit /customers/show" do
        it 'I can see the number of orders a customer made' do
          customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
          order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

          visit "/customers/#{customer.id}"

          expect(page).to have_content("order count: 1")
        end
      end
    end
  end

end