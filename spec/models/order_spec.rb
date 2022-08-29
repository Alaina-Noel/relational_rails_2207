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
    end
  end
end