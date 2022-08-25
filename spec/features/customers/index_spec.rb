require 'rails_helper'

RSpec.describe 'the customers index page', type: :feature do 
  describe "as a user" do
    describe "when I visit /customers" do
      it 'I can see the first name of the customers' do
        customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa: false, credit_score: 400 )
        visit '/customers'

        expect(page).to have_content(customer.first_name)
      end

      it 'I can see the last name of the customers' do
        customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
        visit '/customers'

        expect(page).to have_content(customer.last_name)
      end

      it 'I can not see the customers orders' do
        customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
        order = customer.orders.create!(quantity: 4, gift: false, order_type: "polly pockets")
        visit '/customers'

        expect(page).to_not have_content(order.order_type)
      end
    end

    describe 'when I visit /customers' do
      it 'I see a link at the top of the page that leads me to the orders/index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/customers"
        
        expect(page).to have_content("This link will take you to all orders index page")
      end

      it 'The link on the top of the page will take you to the orders index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/customers"
        click_on "This link will take you to all orders index page"

        expect(current_path).to eq("/orders")
      end

      it "when I visit /orders the records are ordered by recently created" do
        customer1 = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        customer2 = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
        customer3 = Customer.create!(first_name: "Gina", last_name: "Jefferson" , in_usa: true, credit_score: 802 )
        order1 = customer1.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        order2 = customer2.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "polly pockets")

        visit "/customers"
        
        this = "Sarah"
        that = "Maya"

        expect(this).to appear_before(that)
      end

      it "I can see a link to create a new Customer Record called New Customer" do
        visit "/customers"

        expect(page).to have_content("New Customer")
      end

      it "When I click this link then I am taken to '/customers/new' where I see a form for a new customer record" do
        visit "/customers"

        customer1 = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        customer2 = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
        customer3 = Customer.create!(first_name: "Gina", last_name: "Jefferson" , in_usa: true, credit_score: 802 )
        click_link("New Customer")

        expect(current_path).to eq("/customers/new")
        expect(page).to have_content("Enter a new customer:")
      end
    end
  end
end

