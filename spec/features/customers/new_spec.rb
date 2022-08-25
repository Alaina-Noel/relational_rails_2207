require 'rails_helper'

RSpec.describe 'the new customer page', type: :feature do 
  describe "as a user" do
    describe "when I visit /customers/new" do
      it 'I can see the a form to fill out for a new customer' do
        visit "/customers/new"
        expect(page).to have_content("First Name")
      end

      it "When I fill out the form with a new customers's attributes: And I click the button Create a Customer to submit the form Then a `POST` request is sent to the '/customers' route, a new customer record is created." do
        visit "/customers/new"
        fill_in('First Name', with: 'John')
        fill_in('Last Name', with: 'Seekrit')
        fill_in('In USA?', with: 'true')
        fill_in('Credit Score', with: 801)
        click_button('Submit')
        expect(current_path).to eq("/customers")
        expect(page).to have_content("Seekrik")
      end
    end
  end
end



    