require 'rails_helper'

RSpec.describe Customer, type: :model do
  it {should have_many :orders}

  describe 'instance methods' do
    describe '#sort_by_most_recent' do
      it 'returns the orders above a certian quantity' do
        customer1 = Customer.create(first_name: "Alaina", last_name: "Kneiling", in_usa: true, credit_score: 502)
        customer2 = Customer.create(first_name: "Peta", last_name: "Pipa", in_usa: true, credit_score: 502)
        customer3 = Customer.create(first_name: "Suzia", last_name: "Rollins", in_usa: false, credit_score: 800)
        customer4 = Customer.create(first_name: "Janet", last_name: "Jackson", in_usa: false, credit_score: 555)
        
        expect(Customer.sort_by_most_recent).to eq([customer1, customer2, customer3, customer4])
      end
    end
  end


end