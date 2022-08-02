class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :pro_name
      t.decimal :pro_price
      t.integer :pro_quantity
      t.integer :product_id
      t.integer :user_id
      t.integer :sell_id

      t.timestamps
    end
  end
end
