class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :in_usa
      t.integer :credit_score
       
      t.timestamps
    end
  end
end
