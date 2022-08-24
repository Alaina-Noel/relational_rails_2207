require 'rails_helper'

RSpec.describe 'the customers index page' do
  it 'displays the first name of the customers' do
    customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
    visit '/customers'

    expect(page).to have_content(customer.first_name)
  end

  it 'displays the last name of the customers' do
    customer = Customer.create!(first_name: "Maya", last_name: "Jordan" , in_usa:false, credit_score:400 )
    visit '/customers'

    expect(page).to have_content(customer.last_name)
  end

  it 'does not display the customers orders' 


end