class Customer < ApplicationRecord
  has_many :orders

  def find_all_orders(id_of_customer)
    Order.where(customer_id: id_of_customer)
  end
  

end