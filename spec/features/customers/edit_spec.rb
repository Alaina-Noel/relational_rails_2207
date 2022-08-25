require 'rails_helper'

RSpec.describe 'the customers edit page', type: :feature do 
  describe "As a user" do
    describe "When I visit /customers/id/edit" do
      it 'I can see a form to edit the parents attributes' 
      
      it 'When I fill out the form and click submit the formThen a `PATCH` request  is sent to /parents/:id,he customers info is updated, and I am redirected to the Customers Show page where I see the customers updated info' 
    end
  end
end
