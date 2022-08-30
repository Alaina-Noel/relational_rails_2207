class Customer < ApplicationRecord
  has_many :orders

  def self.sort_by_most_recent
    Customer.order(:created_at)
  end

  def number_of_orders
    self.orders.count
  end
  
end