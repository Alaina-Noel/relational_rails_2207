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
  end

end