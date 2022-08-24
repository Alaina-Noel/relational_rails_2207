require 'rails_helper'

RSpec.describe 'the customers index page' do
  xit 'displays the first name of the customers' do
    customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
    visit '/customers'

    expect(page).to have_content(customer.first_name)
  end

  xit 'displays the last name of the customers' do
    customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
    visit '/customers'

    expect(page).to have_content(customer.last_name)
  end

  xit 'does not display the customers orders' 


end