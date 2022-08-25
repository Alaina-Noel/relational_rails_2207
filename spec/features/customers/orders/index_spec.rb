require 'rails_helper' 

RSpec.describe 'the customers index page', type: :feature do 
  describe "As a user" do
    describe "When I visit /customers/id" do
      it 'I can see all of the orders a customer made' do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
        order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
        order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")
        visit "/customers/#{customer.id}/orders" 

        expect(page).to have_content(order1.order_type)
        expect(page).to have_content(order2.order_type)
      end

     it 'I can see each orders attributes associated with that parent' do
      customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )
      order1 = customer.orders.create!(quantity: 1, gift: true, order_type: "green shirt")
      order2 = customer.orders.create!(quantity: 3, gift: true, order_type: "polly pockets")
      visit "/customers/#{customer.id}/orders" 

      expect(page).to have_content(order1.gift)
      expect(page).to have_content(order1.created_at)
      expect(page).to have_content(order1.customer_id)
      expect(page).to have_content(order1.updated_at)
      expect(page).to have_content(order2.gift)
      expect(page).to have_content(order2.created_at)
      expect(page).to have_content(order2.customer_id)
      expect(page).to have_content(order2.updated_at)
     end
    end

    describe 'when I visit /customers/:id/orders' do
      it 'I see a link at the top of the page that leads me to the orders/index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/customers/#{customer.id}/orders"
        
        expect(page).to have_content("This link will take you to all orders index page")
      end
  
      it 'The link on the top of the page will take you to the orders index page' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        order = customer.orders.create!(customer_id: 1, quantity: 400, gift: false, order_type: "kitchen set")
        visit "/customers/#{customer.id}/orders"
        click_on "This link will take you to all orders index page"
  
        expect(current_path).to eq("/orders")
      end
    end

  end

end