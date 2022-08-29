class Order < ApplicationRecord
  belongs_to :customer
  
  def self.find_orders_above(qty)
    Order.where("quantity > #{qty}")
  end
end