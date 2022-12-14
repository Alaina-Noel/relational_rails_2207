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
      describe "When I visit /customers" do
        it 'I can see the number of orders a customer made' do
          customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
          order = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")

          visit "/customers/#{customer.id}"

          expect(page).to have_content("order count: 1")
        end
      end
    end
  end

  describe 'when I visit /customers/:id' do
    it 'I see a link at the top of the page that leads me to the orders/index page' do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
      visit "/customers/#{customer.id}"
      
      expect(page).to have_content("This link will take you to all orders index page")
    end

    it 'The link on the top of the page will take you to the orders index page' do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
      visit "/customers/#{customer.id}"
      click_on "This link will take you to all orders index page"

      expect(current_path).to eq("/orders")
    end

    it 'I see a link at the top of the page that leads me to the customers/index page' do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
      visit "/customers/#{customer.id}"
      
      expect(page).to have_content("This link will take you to all customers index page")
    end

    it 'The link on the top of the page will take you to the customers index page' do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
      visit "/customers/#{customer.id}"
      click_on "This link will take you to all customers index page"

      expect(current_path).to eq("/customers")
    end

    it "I will see a link at the top of the page'" do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
      order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")
      visit "/customers/#{customer.id}"

      expect(page).to have_content("Click this link to see all of the orders this person has made.")
    end

    it "The link on the top of the page will take you to the orders page '/customers/id/orders'" do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
      order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")
      visit "/customers/#{customer.id}"
      click_on "Click this link to see all of the orders this person has made."

      expect(current_path).to eq("/customers/#{customer.id}/orders")
      expect(page).to have_content(order1.gift)
      expect(page).to have_content(order1.created_at)
      expect(page).to have_content(order1.customer_id)
      expect(page).to have_content(order1.updated_at)
      expect(page).to have_content(order2.gift)
      expect(page).to have_content(order2.created_at)
      expect(page).to have_content(order2.customer_id)
      expect(page).to have_content(order2.updated_at)
    end

   it "Then I see a link to update the parent Update Customer" do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
    visit "/customers/#{customer.id}"

    expect(page).to have_content("Update Customer")
   end

   it " When I click the link Update Customer Then I am taken to '/customers/:id/edit'" do
    customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
    visit "/customers/#{customer.id}"
    click_link("Update Customer")
    expect(current_path).to eq("/customers/#{customer.id}/edit")
    expect(page).to have_button("Submit")
    expect(page).to have_content("Credit Score:")
   end
    
  end
end