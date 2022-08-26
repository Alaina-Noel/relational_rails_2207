require 'rails_helper'


# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'the new order page', type: :feature do 
  describe "as a user" do
    describe "when I visit '/orders'" do
      it "I can see the a form to fill out for a new adoptable order When I fill out the form with a new customers's attributes: And I click the button Create a Order to submit the form Then a `POST` request is sent to the '/parents/:parent_id/child_table_name' route, a new order record is created for that customer" do
        customer = Customer.create!(first_name: "Alaina", last_name: "Kneiling" , in_usa: true, credit_score: 801 )

        visit "/customers/#{customer.id}/orders"
        click_link('New Order')

        expect(current_path).to eq("/customers/#{customer.id}/orders/new")
        visit "/customers/#{customer.id}/orders/new"
        expect(page).to have_content("Gift Description")

        fill_in('Quantity:', with: 10)
        fill_in('Gift?', with: false )
        fill_in('Gift Description', with: 'kitchen goodies')
        click_on('Add Order')
        expect(current_path).to eq("/customers/#{customer.id}/orders")

        expect(page).to have_content("kitchen goodies")
      end
    end
  end
end

