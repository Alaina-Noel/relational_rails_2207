require 'rails_helper'

RSpec.describe 'the new customer page', type: :feature do 
  describe "as a user" do
    describe "when I visit /customers/new" do
      it 'I can see the a form to fill out for a new customer' do
        visit "/customers/new"

        expect(page).to have_content("Enter a new customer:")
      end

      it "When I fill out the form with a new customers's attributes: And I click the button Create a Customer to submit the form Then a `POST` request is sent to the '/customers' route, a new customer record is created." do
        visit "/customers/new"
        fill_in('customer[first_name]', with: 'John')
        fill_in('customer[last_name]', with: 'Seekrit')
        select('true', from: 'in_usa')
        fill_in('customer[credit_score]', with: 801)
        click_button('Submit')
        expect(current_path).to eq("/customers")

        expect(page).to have_content("Seekrit")
      end
    end
  end
end



    