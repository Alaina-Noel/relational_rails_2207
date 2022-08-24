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
  end
end