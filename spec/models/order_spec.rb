require 'rails_helper'

RSpec.describe Order, type: :model do
  it {should belong_to :customer}

  describe 'instance methods' do
    describe '#find_orders_above' do
      it 'returns the orders above a certian quantity' do
        customer1 = Customer.create(first_name: "Alaina", last_name: "Kneiling", in_usa: true, credit_score: 502)
        order1 = customer1.orders.create!(quantity: 44, gift: true, order_type: "green pants")
        order2 = customer1.orders.create!(quantity: 34, gift: true, order_type: "green shirt")
        order3 = customer1.orders.create!(quantity: 24, gift: true, order_type: "green shoes")
        order4 = customer1.orders.create!(quantity: 14, gift: true, order_type: "green polly pockets")

        expect(Order.find_orders_above(34)).to eq([order1])
      end

      it 'returns the correct quantity' do
        customer1 = Customer.create(first_name: "Alaina", last_name: "Kneiling", in_usa: true, credit_score: 502)
        order1 = customer1.orders.create!(quantity: 44, gift: true, order_type: "green pants")
        order2 = customer1.orders.create!(quantity: 34, gift: true, order_type: "green shirt")
        order3 = customer1.orders.create!(quantity: 24, gift: true, order_type: "green shoes")
        order4 = customer1.orders.create!(quantity: 14, gift: true, order_type: "green polly pockets")

        qty = 14
        expect(Order.where("quantity > #{qty}")).to eq([order1, order2, order3])
      end
    end

    it 'returns the orders above a certian quantity' do
      customer1 = Customer.create(first_name: "Alaina", last_name: "Kneiling", in_usa: true, credit_score: 502)
      customer2 = Customer.create(first_name: "Peta", last_name: "Pipa", in_usa: true, credit_score: 502)
      customer3 = Customer.create(first_name: "Suzia", last_name: "Rollins", in_usa: false, credit_score: 800)
      customer4 = Customer.create(first_name: "Janet", last_name: "Jackson", in_usa: false, credit_score: 555)
      
      expect(Customer.sort_by_most_recent).to eq([customer1, customer2, customer3, customer4])
    end
  end
end