require 'rails_helper'

RSpec.describe 'the customers edit page', type: :feature do 
  describe "As a user" do
    describe "When I visit /customers/id/edit" do
      it 'I can see a form to edit the parents attributes' do
      customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
      visit "/customers/#{customer.id}/edit"

      expect(page).to have_content("In USA?")
    end
      
      it 'When I fill out the form and click submit the formThen a `PATCH` request  is sent to /parents/:id,he customers info is updated, and I am redirected to the Customers Show page where I see the customers updated info' do
        customer = Customer.create!(first_name: "Sarah", last_name: "Robertson" , in_usa: false, credit_score: 755 )
        visit "/customers/#{customer.id}"
        click_link('Update Customer')
        fill_in("First Name:", with: 'PeterPoppinSaucin')
        click_on('Submit')
        expect(current_path).to eq("/customers/#{customer.id}")

        expect(page).to have_content('PeterPoppinSaucin')
      end
    end
  end
end

# <form action="/customers/<%= @customer.id %>" method="post">  
#   <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
#   <input type="hidden" name="method" value="PATCH" />

#   <p>Update Customer</p>
#   <p>First Name: <input type='text' name='customer[first_name]' value="<%= @customer.first_name %>" ></p><br/>
#   <p>Last Name: <input type='text' name='customer[last_name]' value="<%= @customer.last_name %>"></p><br/>
#   <p>In USA? <select id="in_usa" name='in_usa' value="<%= @customer.in_usa %>">
#     <option value="true">true</option>
#     <option value="false">false</option>
#   </select></p>
#   <p>Credit score: <input type='text' name='customer[credit_score]' value="<%= @customer.credit_score %>"></p><br/>
#   <input type="submit" value="Submit"/>
# </form>